---
title: Creating Jekyll Blog
layout: post
description: >
    Jekyll로 하루만에 블로그 만들기
tag: [tech]
---

본래 [티스토리 블로그](http://1dayleft.tistory.com/)를 3년 정도 써왔다. 티스토리는 포스팅이 간편해서 사용해왔지만, 기능이 제한적이라 사용하면서 포기한 점들이 많았다. 대표적으로 markdown 지원이 전무해서 markdown posting을 위해서는 HTML로 변환하는 과정을 따로 거쳐야 했고, 수식 입력이 굉장히 불편했다. 때문에 formal한 글을 예쁘게 쓰기가 어려웠고, 언젠가는 Github Pages+Jekyll로 옮기겠다고 벼르고 있었다. 마침 방학이고 시간이 남아 시도해봤는데, 예상했던 것보다 훨씬 쉽고 빨리 끝났다! 그 과정을 정리해본다.

<!--more-->

## Goals

Jekyll로 블로그를 만들면서 다음과 같은 점들을 목표로 두었다.

* 보기에 아름답고 수정하기 쉬운 CV페이지를 포함해야 한다.
* markdown을 지원하고 desktop editor에서 글쓰기/수정이 편리하게 이루어져야 한다.

두 개 모두 티스토리에서는 요원한 일임에 분명했다(..)

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

개인 페이지로서 블로그보다도 CV를 제대로 써넣고 싶었는데, 이게 생각보다 어려웠다. 처음엔 괜찮은 웹페이지 CV 테마를 가져다가 수정하려 했는데, 아무리 찾아봐도 적절한 게 없더라.. 그래서 결국 building block을 직접 구해보기로 했다. 간단하게 보기 좋은 textbox 하나만 구하면 될 것 같았는데, bootstrap document에서 나오는 callout box를 [여기에서](http://cpratt.co/twitter-bootstrap-callout-css-styles/) 구할 수 있었다.

이제 이 building block을 어떻게 적절한 방식으로 추가하는지가 문제였는데.. style은 Typography를 설정하는 `_sass/pooleparty/_type-essential.scss`에 추가해 주면 되었다. 하지만 어떻게 `<div>` 태그를 markdown과 혼용하여 쓸 수 있는지가 문제였다. Github Pages는 kramdown engine을 사용하는데, kramdown의 경우 markdown 속에 inline html을 그대로 지원하지만, tag block 속에서는 markdown parsing을 하지 않는다. 즉 `<div>` 속에 있는 내용에는 markdown을 쓸 수 없다는 말이었다..

뭐 적절히 타협해서 callout box 안에 있는 내용은 HTML로 작성할 수도 있었지만, 그게 너무 귀찮았고 해결책을 알아본 결과, [Jekyll의 include구문](https://jekyllrb.com/docs/includes/)를 이용해서 해결했다. `_includes/cvbox.html`을 만들고 다음과 같이 작성해줬다.

{% raw %} 
~~~ html
<div class="bs-callout bs-callout-{{ include.type }}">
  <h4>{{ include.title | markdownify }}<span class="date">{{ include.date }}</span></h4>
  <small>{{ include.content | markdownify }}</small>
</div>
~~~

이게 하는 일은, 적절한 markdown string을 입력받아 그것을 callout box의 형태로 뿌려주는 것이다. 이제 이걸 사용하기 위해서는 markdown문서 내에서 include만 시켜주면 됐다. 다음과 같은 형태로..

~~~ markdown
{% include cvbox.html type="info" title="Programming Languages" content="
* C/C++, Python, Java, C#, Scala (*ordered by proficiency*)"%}
~~~
{% endraw %}

뭐 이게 더 보기에는 불편할지라도, box내에도 markdown을 쓰고 싶다는 목적은 달성한 셈이다.

## Sublime Plugin Setting

