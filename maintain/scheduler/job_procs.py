import time
from timeloop import Timeloop
from datetime import timedelta
from random import randrange
import redis
import time
import json

pool = redis.ConnectionPool(host='localhost', port=6379, decode_responses=True)
r = redis.Redis(connection_pool=pool)

tl = Timeloop()


@tl.job(interval=timedelta(seconds=2))
def publish_chart_data():
    print("publish chart: {}".format(time.ctime()))
    chart_data = {
        "fields": ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"],
        # 随机数据
        "data": {
            "商家A": [randrange(0, 100) for _ in range(6)],
            "商家B": [randrange(0, 100) for _ in range(6)]
        }
    }
    r.set("chart_default", json.dumps(chart_data, ensure_ascii=False))

@tl.job(interval=timedelta(seconds=2))
def sample_job_every_2s():
    print("2s job current time : {}".format(time.ctime()))


@tl.job(interval=timedelta(seconds=5))
def sample_job_every_5s():
    print("5s job current time : {}".format(time.ctime()))
    chart_data=json.loads(r.get("chart_default"))
    print(chart_data["fields"])
    for key, row in chart_data['data'].items():
        print('\t', key, row)

@tl.job(interval=timedelta(seconds=10))
def sample_job_every_10s():
    print("10s job current time : {}".format(time.ctime()))


if __name__ == "__main__":
    tl.start(block=True)

'''
$ python -m scheduler.job_procs
'''
