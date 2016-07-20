---
title: tackling with django
layout: post
---

flask와 헤딩하는 과정을 써본다.

### install

쉽다. python만 설치되어 있다면, ``pip install flask``면 끝!

### basic app

{% hightlight python linenos %}
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__=="__main__":
	app.run(host = '0.0.0.0', port = '1234')
{% endhighlight %}

간단하게 작성해 준 뒤 python으로 실행시키면 된다. ``app.run``에서 매개변수를 주는 것은, 외부 access를 허용하게끔 하기 위함이다.

### render_template

출력뿐 아니라 html문서를 뿌려주고 싶다면? 다음과 같이 하면 된다.

{% hightlight python linenos %}
@app.route('/')
def hello():
    return render_template('index.html')
{% endhighlight %}

### 리소스 뿌려주기

image와 같이 하나하나 route해주기 귀찮다면? 다음과 같이 directory단위 routing을 할 수 있다.

{% hightlight python linenos %}
@app.route('/resources/<path:path>')
def data(path):
    return send_from_directory('resources/', path)
{% endhighlight %}


