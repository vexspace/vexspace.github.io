#!/usr/bin/env bash
# 최신 버전만 남긴다 (2026-11-24) — _data/versions.yml 의 url 이 가리키는 설치 파일만 Releases 에 남기고,
# 같은 제품(<product>-v… 태그)의 나머지 파일을 지운다. 파일이 하나도 안 남은 릴리스는 태그와 함께 지운다.
# 쓰는 곳: 새 버전을 올리고 versions.yml 을 바꾼 **뒤** (calit release-android.yaml, macOS 수동 배포, pagemark 배포).
# ⚠️ 순서를 지킬 것 — versions.yml 이 아직 옛 url 이면 새로 올린 파일이 지워진다.
#
#   scripts/prune-releases.sh <product> [--dry-run]     (예: calit, pagemark)
# 필요: gh(이 저장소에 쓰기 권한), 저장소 루트에서 실행하거나 VERSIONS_FILE 지정.
set -euo pipefail
product="${1:?product (calit | pagemark)}"
dry="${2:-}"
repo="${REPO:-vexspace/vexspace.github.io}"
versions="${VERSIONS_FILE:-_data/versions.yml}"
prefix="https://github.com/${repo}/releases/download/"

# 남길 파일: "<태그>/<파일>" — 이 제품 블록의 url 만 읽는다(최상위 키 줄로 블록을 가른다).
keep=$(awk -v p="$product" '
  /^[a-z][a-z0-9_-]*:/ { cur = substr($1, 1, length($1) - 1) }
  cur == p && $1 == "url:" { print $2 }' "$versions" | sed "s#^${prefix}##")
[ -n "$keep" ] || { echo "versions.yml 에 ${product} url 이 없다 — 아무것도 지우지 않는다" >&2; exit 1; }
# 남길 파일이 실제로 Releases 에 있어야 진행한다(오타·업로드 전이면 전부 지워질 수 있다).
while read -r k; do
  t="${k%%/*}"; f="${k#*/}"
  gh release view "$t" -R "$repo" --json assets -q '.assets[].name' | grep -qxF "$f" \
    || { echo "남길 파일이 Releases 에 없다: $k — 중단" >&2; exit 1; }
done <<< "$keep"

for tag in $(gh release list -R "$repo" -L 200 --json tagName -q '.[].tagName' | grep "^${product}-v"); do
  left=0
  for f in $(gh release view "$tag" -R "$repo" --json assets -q '.assets[].name'); do
    if grep -qxF "${tag}/${f}" <<< "$keep"; then left=$((left + 1)); continue; fi
    echo "파일 삭제: ${tag}/${f}"
    [ "$dry" = "--dry-run" ] || gh release delete-asset "$tag" "$f" -R "$repo" -y
  done
  if [ "$left" -eq 0 ]; then
    echo "릴리스 삭제: ${tag}"
    [ "$dry" = "--dry-run" ] || gh release delete "$tag" -R "$repo" -y --cleanup-tag
  fi
done
