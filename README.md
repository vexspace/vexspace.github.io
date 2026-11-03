<div align="center">

<a href="https://vexspace.github.io/"><img src="assets/icons/vexspace.svg" alt="VexSpace" width="72" height="72"></a>

# VexSpace

**개인 개발자 Vex 가 만드는 작은 도구들의 공개 사이트**<br>
프로젝트 소개 · 개인정보 처리방침 같은 공개 문서 · 앱 내려받기와 업데이트 정보를 한 곳에 둡니다.

[![Pages](https://github.com/vexspace/vexspace.github.io/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/vexspace/vexspace.github.io/actions/workflows/pages/pages-build-deployment)
[![Pagemark](https://img.shields.io/github/v/release/vexspace/vexspace.github.io?filter=pagemark-*&label=Pagemark&color=1f5f6b)](https://github.com/vexspace/vexspace.github.io/releases?q=pagemark&expanded=true)

[**사이트**](https://vexspace.github.io/) · [**Pagemark 내려받기**](https://vexspace.github.io/pagemark/) · [**Releases**](https://github.com/vexspace/vexspace.github.io/releases) · [**문의**](mailto:vexspace.io@gmail.com)

</div>

---

## 목차

- [프로젝트](#프로젝트)
- [내려받기](#내려받기)
- [이 저장소가 하는 일](#이-저장소가-하는-일)
- [구조](#구조)
- [로컬에서 미리 보기](#로컬에서-미리-보기)
- [운영 가이드](#운영-가이드)
  - [앱 새 버전 내보내기](#앱-새-버전-내보내기)
  - [프로젝트 추가](#프로젝트-추가)
  - [문서 파일 규약](#문서-파일-규약)
- [누가 무엇을 소유하나](#누가-무엇을-소유하나)
- [문의](#문의)

## 프로젝트

| | 프로젝트 | 소개 | 플랫폼 | 상태 |
|:-:|---|---|---|---|
| <img src="assets/icons/pagemark.png" width="40" alt=""> | [**Pagemark**](https://vexspace.github.io/pagemark/) | 마크다운 문서를 전자책처럼 한 장씩 넘겨 읽는 뷰어 — 폴더 트리, 링크 이동, 쪽 넘김·스크롤 보기, 보이는 그대로 편집 | Android · macOS | 출시 준비 중 |
| <img src="assets/icons/calit.png" width="40" alt=""> | [**Calit**](https://vexspace.github.io/calit/) | 기기 캘린더의 일정과 TODO 를 위젯과 잠금 화면에서 바로 보고 정리하는 앱 | Android | 출시 준비 중 |

목록의 원본은 [`_data/projects.yml`](_data/projects.yml) 입니다 — 사이트 첫 화면 카드와 각 프로젝트 페이지가 여기서 만들어집니다.

## 내려받기

### Pagemark

[**vexspace.github.io/pagemark**](https://vexspace.github.io/pagemark/) 에서 기기에 맞는 파일을 고르면 됩니다.

| 플랫폼 | 파일 | 비고 |
|---|---|---|
| macOS (Apple Silicon) | `Pagemark-<버전>-arm64.dmg` | 서명·공증 없음 — 처음 열 때 경고가 뜨면 Finder 에서 우클릭 › 열기 |
| Android | `Pagemark-<버전>.apk` | "출처를 알 수 없는 앱" 허용 필요. Google Play 버전과는 서명이 달라 서로 위에 설치되지 않음 |

모든 버전은 [Releases](https://github.com/vexspace/vexspace.github.io/releases?q=pagemark&expanded=true) 에 있습니다 (`pagemark-v<버전>` 태그).

## 이 저장소가 하는 일

```
                 ┌──────────────────── vexspace.github.io (이 저장소, GitHub Pages · Jekyll) ────────────────────┐
 방문자 ───────▶ │  첫 화면 · 프로젝트 페이지 · 내려받기 드롭다운          ← _data/projects.yml · _data/versions.yml      │
                 │  /calit/privacy.html · /pagemark/privacy.html            ← 각 프로젝트 저장소의 워크플로가 밀어 넣음    │
 앱(Pagemark) ─▶ │  /pagemark/version.json  (강제 업데이트 판단)           ← _data/versions.yml                          │
                 └─────────────────────────────────────────────────────────────────────────────────────────────────┘
                 설치 파일(.dmg · .apk)은 이 저장소의 Releases 에 — GitHub 저장소 파일은 100MB 를 넘을 수 없어서
```

- **허브** — 첫 화면, 레이아웃, 프로젝트 목록, 아이콘을 이 저장소가 직접 소유합니다.
- **공개 문서** — 개인정보 처리방침 등은 각 프로젝트 저장소가 원본이고, 그 저장소의 워크플로가 자기 폴더만 교체합니다.
- **앱 배포** — `_data/versions.yml` 하나가 Pagemark 페이지의 내려받기 목록과 앱이 읽는 `version.json` 을 함께 만듭니다.

## 구조

```
.
├── _config.yml                 # Jekyll 설정 (kramdown GFM, 라이트 테마 고정)
├── _data/
│   ├── projects.yml            # 프로젝트 목록 — 첫 화면 카드 · 프로젝트 페이지 머리
│   └── versions.yml            # 앱 버전 · 내려받기 — version.json 과 드롭다운의 원본
├── _includes/dl-icon.html      # 내려받기 드롭다운 아이콘 (apple · android · windows)
├── _layouts/
│   ├── default.html            # 공통 틀 · 스타일
│   ├── project.html            # 프로젝트 페이지 (머리 · 내려받기 · 공개 문서 목록)
│   └── doc.html                # 공개 문서
├── assets/icons/               # 사이트·프로젝트 아이콘 (프로젝트는 160px PNG)
├── index.md                    # 첫 화면
├── pagemark-version.json       # → /pagemark/version.json (pagemark/ 폴더 밖에 두는 이유는 아래)
├── calit/                      # index.md 는 여기서, privacy.md 는 vexspace/calit 이 밀어 넣음
└── pagemark/                   # index.md 는 여기서, privacy*.md 는 vexspace/pagemark 이 밀어 넣음
```

## 로컬에서 미리 보기

GitHub Pages 는 **Jekyll 3.10** 으로 빌드합니다. 같은 버전으로 미리 보면 올린 뒤 빌드가 깨지는 일을 막을 수 있습니다.

```bash
gem install jekyll -v 3.10.0
gem install kramdown-parser-gfm
jekyll serve            # → http://127.0.0.1:4000/
```

> [!WARNING]
> Jekyll 3.10 의 `{% include %}` 는 인자에 `p[1].icon` 같은 대괄호 값을 받지 못합니다(빌드 실패).
> `{% assign ic = p[1].icon %}` 로 먼저 담은 뒤 `name=ic` 로 넘기세요. 다른 Liquid 엔진에서는 통과해서 놓치기 쉽습니다.

## 운영 가이드

### 앱 새 버전 내보내기

Pagemark 앱은 켤 때마다 `https://vexspace.github.io/pagemark/version.json` 을 보고 강제 업데이트 여부를 정합니다.

1. 설치 파일을 만들고 **Releases** 에 `pagemark-v<버전>` 태그로 올립니다.
2. 올린 **뒤에** [`_data/versions.yml`](_data/versions.yml) 의 `latest` · `url` · `size` 를 바꿉니다.
   먼저 바꾸면 받을 파일이 없는데 앱이 업데이트를 요구하게 됩니다.
3. 커밋하고 push 하면 1~2분 뒤 페이지와 `version.json` 이 바뀝니다.

```yaml
pagemark:
  macos:                      # 키는 앱이 읽는다 — 바꾸지 않는다 (macos · android · windows)
    latest: "1.2.0"
    # minimum: "1.2.1"        # 비상시에만 — 끝자리 업데이트도 강제할 때
    url: https://github.com/vexspace/vexspace.github.io/releases/download/pagemark-v1.2.0/Pagemark-1.2.0-arm64.dmg
    os: macOS                 # 드롭다운에 굵게
    variant: Apple Silicon    # 드롭다운에 흐리게
    icon: apple               # apple · android · windows
    size: 131 MB
```

**강제 업데이트 규칙** — `minimum` 을 적으면 그 버전보다 낮은 앱은 읽기가 막히고, 비우면 `latest` 의 끝자리를 0 으로 바꾼 값이 최소 버전이 됩니다
(앞·가운데 자리가 오르면 강제, 끝자리만 오르면 권유). 앱은 `version.json` 을 받지 못하면 마지막으로 받은 값을 쓰고, 그것도 없으면 막지 않습니다.

**드롭다운** — 항목은 `versions.yml` 에 적힌 순서대로 보이고, 방문한 기기에 맞는 항목이 단추에 먼저 나옵니다. 새 플랫폼(Windows · macOS Intel 등)은 항목을 더하면 목록에 생깁니다.

> [!NOTE]
> `version.json` 을 만드는 `pagemark-version.json` 은 `pagemark/` 폴더 **밖**에 있습니다. Pagemark 저장소의 처리방침 동기화가 `pagemark/` 폴더를 통째로 교체(`index.md` 만 남김)하기 때문입니다.

### 프로젝트 추가

1. [`_data/projects.yml`](_data/projects.yml) 에 항목을 추가합니다 — `slug` 는 폴더 이름과 같아야 합니다.
2. `assets/icons/<slug>.png` (160px) 를 넣습니다.
3. `<slug>/index.md` 를 만듭니다.

```yaml
---
layout: project
title: 프로젝트 이름
project: <slug>
---
```

### 문서 파일 규약

프로젝트 저장소가 밀어 넣는 문서는 front matter 에 다음을 적습니다. 목록 · 경로 · 갱신일은 여기서 자동으로 만들어집니다.

```yaml
layout: doc
title: 개인정보 처리방침          # 목록에 뜨는 제목
description: 한 줄 설명            # 목록 부제(선택)
project: calit                    # _data/projects.yml 의 slug
doc: true                         # 목록에 포함 (이전 판처럼 목록에서 빼려면 false)
updated: 2026-09-16               # 갱신일
permalink: /calit/privacy.html
```

## 누가 무엇을 소유하나

| 경로 | 원본 | 고치는 곳 |
|---|---|---|
| `index.md` · `_layouts/` · `_includes/` · `_data/` · `assets/` · `*/index.md` · `pagemark-version.json` | 이 저장소 | 여기서 직접 |
| `calit/` 안의 문서 (`index.md` 제외) | [`vexspace/calit`](https://github.com/vexspace/calit) | 그 저장소 — `.github/workflows/publish-privacy-policy.yaml` 이 교체 |
| `pagemark/` 안의 문서 (`index.md` 제외) | [`vexspace/pagemark`](https://github.com/vexspace/pagemark) | 그 저장소 — 같은 워크플로가 교체 |

> [!IMPORTANT]
> 프로젝트 폴더 안 문서를 여기서 고치면 다음 동기화 때 사라집니다. 원본 저장소에서 고치세요.

## 문의

[vexspace.io@gmail.com](mailto:vexspace.io@gmail.com) — 각 앱의 개인정보 처리에 관한 문의도 같은 주소로 받습니다.
