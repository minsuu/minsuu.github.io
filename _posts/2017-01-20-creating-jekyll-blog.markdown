---
title: Creating Jekyll Blog
layout: post
description: >
    Jekyll로 하루만에 블로그 만들기
tag: [tech]
---

본래 [티스토리 블로그](http://1dayleft.tistory.com/)를 3년 정도 써왔다. 단지 간편하다는 점 때문에 사용해왔지만, 시간이 나면 github Pages+Jekyll조합으로 갈아타려고 벼르고 있었다. 다른 이유보다도 티스토리가 markdown을 지원하지 않고 수식 입력이 정말 괴상하다는 점(block문자가 `\(`과 `\)`) 때문에 formal한 글을 예쁘게 쓰는 게 너무 어려웠다.. 어쨌든 첫 포스팅으로 블로그 세팅과정을 정리해 본다.

## Setting up Jekyll

블로그 테마는 [hydejack](https://github.com/qwtel/hydejack)을 기반으로 했다. Jekyll은 게시물 tag기능이 내장돼있지 않아서 따로 만들어줘야 하는데, 우선 태그 기능이 이미 달려 있어서 좋다(..)

