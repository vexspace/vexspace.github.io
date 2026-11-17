---
layout: guide
title: macOS
description: macOS에서 VexSpace 앱을 설치하고 "열 수 없음" 경고를 넘기는 방법
platform: macos
parent: { title: 설치 가이드, url: /install/ }
updated: 2026-11-17
permalink: /install/macos.html
---
{% comment %}VexSpace 맥 앱은 Apple 공증 없이 ad-hoc 서명으로 배포해서, 브라우저로 받은 앱을 처음 열면 Gatekeeper 가 막는다.
공증을 받게 되면 "처음 열 때" 부분을 지운다.{% endcomment %}{% include install-apps.html key="macos" %}
## 설치

1. 앱 페이지에서 **macOS Apple Silicon** 파일(.dmg)을 받습니다. M1 이후의 Apple Silicon Mac에서 동작합니다.
2. 받은 .dmg 파일을 열고, 앱 아이콘을 **응용 프로그램** 폴더로 끌어다 놓습니다.
3. 응용 프로그램 폴더에서 앱을 엽니다.

## 처음 열 때 뜨는 경고

처음 열면 아래와 같은 경고가 뜰 수 있습니다.

> **‘앱 이름.app’을(를) 열 수 없음**<br>
> Apple은 ‘앱 이름.app’에 손상을 입히거나 사용자의 개인정보에 침입할 수 있는 악성 코드가 없음을 확인할 수 없습니다.

VexSpace 앱은 개인 개발자가 만들어 **Apple 공증(유료 개발자 인증)을 받지 않고** 배포합니다. 그래서 나오는 경고이고, 파일이 손상됐거나 악성 코드가 들어 있다는 뜻은 아닙니다. 경고 창에서 **휴지통으로 이동**을 누르지 말고 **완료**를 누른 다음, 아래 두 방법 중 하나로 여세요. 한 번 허용하면 다음부터는 그냥 열립니다.

### 방법 1. 시스템 설정에서 허용

1. 경고 창에서 **완료**를 누릅니다.
2. **시스템 설정 › 개인정보 보호 및 보안**을 열고 아래로 내립니다.
3. “‘앱 이름.app’이(가) 차단되었습니다” 옆의 **그래도 열기**를 누르고 암호를 입력합니다.

macOS 15(Sequoia)부터는 Finder에서 우클릭 › 열기로는 이 경고를 넘길 수 없습니다.

### 방법 2. 터미널에서 열기

터미널에서 쓰는 앱의 명령을 실행합니다.

<pre><code>{% for a in install_apps %}xattr -dr com.apple.quarantine /Applications/{{ a }}.app{% unless forloop.last %}&#10;{% endunless %}{% endfor %}</code></pre>

## 새 버전을 받았을 때

새로 받은 앱은 다시 경고가 뜰 수 있습니다. 같은 방법으로 한 번 더 허용하면 됩니다.
