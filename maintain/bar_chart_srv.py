from random import randrange

from sanic import Sanic
from sanic.response import json, html

from pyecharts import options as opts
from pyecharts.charts import Bar

# 初始化 Sanic
app = Sanic(__name__)


def bar_base() -> Bar:
    c = (
        Bar()
        .add_xaxis(["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"])
        .add_yaxis("商家A", [randrange(0, 100) for _ in range(6)])
        .add_yaxis("商家B", [randrange(0, 100) for _ in range(6)])
        .set_global_opts(title_opts=opts.TitleOpts(title="Bar-基本示例", subtitle="我是副标题"))
    )
    return c


@app.route("/barChart", methods=["GET"])
async def draw_bar_chart(request):
    c = bar_base()
    return json(c.dump_options_with_quotes())


@app.route("/", methods=["GET"])
async def index(request):
    # return html(open("./templates/simple.html").read())
    return html(open("./templates/simple_interval.html").read())

if __name__ == '__main__':
    app.run()

