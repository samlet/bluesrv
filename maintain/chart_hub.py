from random import randrange

from sanic import Sanic
from sanic.response import json as resp_json, html

from pyecharts import options as opts
from pyecharts.charts import Bar
import redis

pool = redis.ConnectionPool(host='localhost', port=6379, decode_responses=True)
r = redis.Redis(connection_pool=pool)

# 初始化 Sanic
app = Sanic(__name__)

def bar_base(chart_name:str) -> Bar:
    from json import loads

    data=r.get(chart_name)
    json_data=loads(data)
    bar=Bar()

    for key, row in json_data['data'].items():
        bar.add_yaxis(key, row)

    c = (
        bar
            .add_xaxis(json_data['fields'])
            .set_global_opts(title_opts=opts.TitleOpts(title="Products", subtitle="sales"))
    )
    return c


@app.route("/barChart", methods=["GET"])
async def draw_bar_chart(request):
    c = bar_base("chart_default")
    return resp_json(c.dump_options_with_quotes())


@app.route("/", methods=["GET"])
async def index(request):
    # return html(open("./templates/simple.html").read())
    return html(open("./templates/simple_interval.html").read())

if __name__ == '__main__':
    app.run()

'''
$ python -m chart_hub
'''
