---
title: torch install
layout: post
---
Torch를 인스톨하는 과정을 써본다.

0. readline \& ncurses 설치

이게 없으면 lua설치가 안된다. [GNU readline](https://cnswww.cns.cwru.edu/php/chet/readline/rltop.html)페이지에서 깔아야함. `configure --prefix=[PATH]`를 넣으면 해당 계정에 알맞게 설치할 수 있다. [GNU ncurses](https://www.gnu.org/software/ncurses/)도 마찬가지.

1. lua설치

[lua 사이트](https://www.lua.org/download.html)에서 소스를 받아 makefile의 경로를 적절하게 고치고, `make linux test`명령어로 컴파일한다. 소스코드들도 필요로 하는 것 같길래, include에다 넣어뒀다.

2. luarocks설치

[luarocks 사이트](https://github.com/keplerproject/luarocks/wiki/Download)에서 하라는 대로 configure파일을 좀 손보고 build를 했다.

3. torch설치

torch설치를 그대로 하려면 sudo권한이 필요. 돌아가기 위해서 하나하나 package를 깔아줘야 한다..
일단 [luaJIT](http://luajit.org/install.html)을 깔아본다. `make PREFIX=[PATH]`로 경로를 넣는다.
