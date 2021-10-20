from random import randrange

from sanic import Sanic
from sanic.response import json, html

from pyecharts import options as opts
from pyecharts.charts import Line

# 初始化 Sanic
app = Sanic(__name__)


def line_base() -> Line:
    line = (
        Line()
        .add_xaxis(list(range(10)))
        .add_yaxis(series_name="",
                   y_axis=[randrange(0, 100) for _ in range(10)],
                   is_smooth=True,
                   )
        .set_global_opts(
            title_opts=opts.TitleOpts(title="动态数据"),
            xaxis_opts=opts.AxisOpts(type_="value"),
            yaxis_opts=opts.AxisOpts(type_="value")
        )
    )
    return line


@app.route("/lineChart", methods=["GET"])
async def draw_line_chart(request):
    c = line_base()
    return json(c.dump_options_with_quotes())

cnt = 9

@app.route("/lineDynamicData", methods=["GET"])
async def update_line_data(request):
    global cnt
    cnt = cnt + 1
    return json({"name": cnt, "value": randrange(0, 100)})


@app.route("/", methods=["GET"])
async def index(request):
    return html(open("./templates/index.html").read())


if __name__ == '__main__':
    app.run()

