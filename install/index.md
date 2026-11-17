---
layout: doc
title: 설치 가이드
description: VexSpace 앱을 플랫폼별로 설치하는 방법과 처음 열 때 뜨는 경고를 넘기는 방법
updated: 2026-11-17
permalink: /install/
---
{% comment %}설치 가이드 첫 화면 (2026-11-17) — 플랫폼 카드. 지원 앱은 _data/versions.yml 에서 자동으로 읽는다.{% endcomment %}
# 설치 가이드

VexSpace 앱은 앱 스토어를 거치지 않고 이 사이트에서 설치 파일을 받아 설치합니다. 그래서 처음 설치하거나 열 때 운영체제가 경고를 띄울 수 있습니다. 쓰는 기기를 골라 설치 방법을 확인하세요.

<div class="pf-grid">
{% for pf in site.data.platforms %}{% include install-apps.html key=pf.key %}  <a class="pf-card{% if install_apps.size == 0 %} off{% endif %}" href="{{ '/install/' | append: pf.key | append: '.html' | relative_url }}">
    <span class="pf-name">{% include dl-icon.html name=pf.icon %}{{ pf.name }}</span>
    <span class="pf-sub">{% if install_apps.size > 0 %}{{ install_apps | join: " · " }}{% else %}아직 지원하는 앱이 없습니다{% endif %}</span>
  </a>
{% endfor %}</div>
