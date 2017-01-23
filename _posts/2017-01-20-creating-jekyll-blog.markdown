---
title: Creating Jekyll Blog
layout: post
description: >
    Jekyll로 하루만에 블로그 만들기
tag: [tech]
---

본래 [티스토리 블로그](http://1dayleft.tistory.com/)를 3년 정도 써왔다. 티스토리는 포스팅이 간편해서 사용해왔지만, 기능이 제한적이라 사용하면서 포기한 점들이 많았다. 대표적으로 markdown 지원이 전무해서 markdown posting을 위해서는 HTML로 변환하는 과정을 따로 거쳐야 했고, 수식 입력이 굉장히 불편했다. 때문에 formal한 글을 예쁘게 쓰기가 어려웠고, 언젠가는 Github Pages+Jekyll로 옮기겠다고 벼르고 있었다. 마침 방학이고 시간이 남아 시도해봤는데, 예상했던 것보다 훨씬 쉽고 빨리 끝났다! 그 과정을 정리해본다.

<!--more-->

## Setting up Jekyll

블로그 테마는 [hydejack](https://github.com/qwtel/hydejack)을 기반으로 했다. Jekyll은 게시물 tag기능이 내장돼있지 않아서 따로 만들어줘야 하는데, 우선 태그 기능이 이미 달려 있어서 좋았다(..) 디자인과 태그 기능만을 보고 택한 테마였는데, 내부 구현 코드도 깔끔해서 customize하기 좋았다. 해당 테마를 받아와서 github pages로 올리는 과정은 [Github Pages+Jekyll Tutorial](https://help.github.com/articles/using-jekyll-as-a-static-site-generator-with-github-pages/)에 잘 나와있다.

[hydejack](https://github.com/qwtel/hydejack)테마의 구조를 들여다보면 알 수 있는 몇가지로,

* 모든 layout의 크기는 `\_sass\hydejack\_base-essential.scss`에서 설정된 `font-size`에 비례하게끔 설정되어 있다. 전체적으로 blog의 크기를 확대/축소시키고 싶을 때 이 두 개의 크기를 조절한다. browser의 너비에 따라서 `font-size`를 두 단계로 조절해주는 식이다.

~~~ css
@media (min-width: 48em) {
  html {
    font-size: 17px;
  }
  body {
    padding-left: 0;
  }
}
@media (min-width: 58em) {
  html {
    font-size: 19px;
  }
}
~~~

* 기본 설정에서 사이드바에 표시되는 아이템은 `_config.yml`에서 설정되는 `sidebar_tags`의 목록과 함께, "layout이 page인 모든 페이지들"이 자동적으로 표시된다. 이것은 `_includes/nav.html`을 수정하면 되는데, 내 경우에는 페이지가 추가되는 부분을 주석처리하고 CV와 Archive를 고정적으로 메뉴에 넣어주었다.

{% raw %}
~~~ html
  {% comment %}
    The code below dynamically generates a sidebar nav of pages with
    `layout: page` in the front-matter. See readme for usage.

  {% assign pages_list = site.pages %}
  {% for node in pages_list %}
    {% if node.title != null %}
      {% if node.layout == "page" %}
      <li>
        <a class="sidebar-nav-item {% if page.url == node.url %}active{% endif %}" href="{{ node.url | prepend:site.baseurl }}">{{ node.title }}</a>
      </li>
      {% endif %}
    {% endif %}
  {% endfor %}

  {% endcomment %}

  <li>
    <a class="sidebar-nav-item {% if page.url == node.url %}active{% endif %}" href="/archive">Archive</a>
  </li>

  <li>
    <a class="sidebar-nav-item {% if page.url == node.url %}active{% endif %}" href="/cv">Curriculum Vitae</a>
  </li>
~~~
{% endraw %}

## Writing CV page


## Sublime Plugin Setting

