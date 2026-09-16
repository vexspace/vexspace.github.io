# vexspace.github.io

VexSpace 공개 문서 사이트(GitHub Pages, Jekyll). https://vexspace.github.io/

## 누가 무엇을 소유하나

- **이 저장소가 허브의 원본이다** — 첫 화면(`index.md`), 레이아웃(`_layouts/`), 프로젝트 목록(`_data/projects.yml`), 아이콘(`assets/icons/`),
  각 프로젝트 폴더의 `index.md`. 여기서 직접 고친다.
- **프로젝트 폴더 안의 문서(`calit/privacy.md` 등)는 각 프로젝트 저장소가 원본이다.** 그 저장소의 워크플로가 자기 폴더 안 문서를
  통째로 교체한다(`index.md` 제외). 여기서 고치면 다음 동기화 때 사라진다.
  - `calit/` ← `vexspace/calit` `.github/workflows/publish-privacy-policy.yaml`

## 문서 파일 규약

프로젝트 저장소가 밀어 넣는 문서는 front matter 에 다음을 적는다. 목록·경로·갱신일은 여기서 자동으로 만들어진다.

```yaml
layout: doc
title: 개인정보 처리방침          # 목록에 뜨는 제목
description: 한 줄 설명            # 목록 부제(선택)
project: calit                    # _data/projects.yml 의 slug
doc: true                         # 목록에 포함
updated: 2026-09-16               # 갱신일
permalink: /calit/privacy.html
```

## 프로젝트 추가

`_data/projects.yml` 에 항목 추가 + `assets/icons/<slug>.png`(160px) + `<slug>/index.md`(`layout: project`, `project: <slug>`).
