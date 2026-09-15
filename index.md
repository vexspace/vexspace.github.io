---
layout: default
title: VexSpace
---
<section class="intro">
<h1>개인 개발자 Vex가 운영하는 작은 공간</h1>
<p>VexSpace는 개인 개발자 Vex가 운영하는 작은 공간입니다.<br>일상에서 직접 겪은 불편에서 출발해, 개발자와 사용자에게 실제로 필요한 도구를 만듭니다.</p>
<p>하나의 문제를 끝까지 풀어내는 작은 프로젝트를 이어가고 있습니다.<br>크고 화려한 서비스보다, 매일 쓰이고 오래 쓰이는 도구를 목표로 합니다.</p>
</section>

<div class="section-label">Projects</div>
<div class="grid">
{% for proj in site.data.projects %}{% assign docs = site.pages | where: "project", proj.slug | where: "doc", true %}      <a class="card" href="{{ '/' | append: proj.slug | append: '/' | relative_url }}">
<div class="card-head"><img class="mark" src="{{ proj.icon | relative_url }}" alt="{{ proj.name }} 앱 아이콘" width="40" height="40"><h3>{{ proj.name }}</h3></div>
<p>{{ proj.blurb }}</p>
<div class="meta"><span class="status {{ proj.status_kind }}">{{ proj.status }}</span>{% for pf in proj.platforms %}<span class="chip">{{ pf }}</span>{% endfor %}<span class="docs-count">{% if docs.size > 0 %}공개 문서 {{ docs.size }}{% else %}공개 문서 준비 중{% endif %}</span></div>
</a>
{% endfor %}    </div>
