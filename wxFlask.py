# -- coding: utf-8 --**
from wxsb import sbcw
from flask import Flask
import time
import random
import traceback2 as traceback
import os

from flask_apscheduler import APScheduler
       
m = random.randint(1,3)
s = random.randint(1,20)

class Config(object):
    JOBS = [
        {
            'id': 'index',
            'func': '__main__:index',
            'trigger': 'cron',
            'timezone':"Asia/Shanghai",
            'day_of_week':'mon-sun',
            'hour':'19',
            'minute':'{}'.format(m),
            'second':'{}'.format(s)
        }
    ]

b = sbcw()#实例化（）不应在其他函数里，实例化后的实例driver应用在其他函数里    
app = Flask(__name__)  # 实例化flask
app.config.from_object(Config())  # 为实例化的flask引入配置
@app.route('/')  # 首页路由
def index():  # 首页视图函数，就返回个hello
    try:
        b.send_msg()
        time.sleep(random.uniform(1,3))
    except Exception as e:
        print(e.args)
        print('======')
        print(traceback.format_exc())

if __name__ == '__main__':
    scheduler = APScheduler()  # 实例化APScheduler
    scheduler.init_app(app)  # 把任务列表放进flask
    scheduler.start()  # 启动任务列表
    app.run(host='0.0.0.0', port=8080)  # 启动flask