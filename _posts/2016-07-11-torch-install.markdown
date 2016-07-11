---
title: torch install
layout: post
---
Torch를 인스톨하는 과정을 써본다.

### readline \& ncurses 설치

이게 없으면 lua설치가 안된다. [GNU readline](https://cnswww.cns.cwru.edu/php/chet/readline/rltop.html)페이지에서 깔아야함. ``configure --prefix=[PATH]``를 넣으면 해당 계정에 알맞게 설치할 수 있다. [GNU ncurses](https://www.gnu.org/software/ncurses/)도 마찬가지.

### lua설치

[lua 사이트](https://www.lua.org/download.html)에서 소스를 받아 makefile의 경로를 적절하게 고치고, ``make linux test``명령어로 컴파일한다. 소스코드들도 필요로 하는 것 같길래, include에다 넣어뒀다.

### luarocks설치

[luarocks 사이트](https://github.com/keplerproject/luarocks/wiki/Download)에서 하라는 대로 configure파일을 좀 손보고 build를 했다.

### torch설치

torch설치를 그대로 하려면 sudo권한이 필요. 돌아가기 위해서 하나하나 package를 깔아줘야 한다..
일단 [luaJIT](http://luajit.org/install.html)을 깔아본다. ``make PREFIX=[PATH]``로 경로를 넣는다.
그 후 [torch](http://torch.ch/docs/getting-started.html#_)의 getting started에서 설치를 해본다.
그런데 ``torch install image``가 먹질 않는다..ㅠㅠ git경로를 지정해 억지로 설치했더니, ``require 'image'``가 ``117: error loading module 'libimage' from file``라는 에러를 띄웠다.

암걸릴 것 같아서 다른 서버에서 시도해 보니 똑같은 절차를 거쳤음에도 불구하고 잘 됐다-_-




