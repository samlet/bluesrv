import opentracing

tracer = opentracing.tracer

def say_hello(hello_to):
    span = tracer.start_span('say-hello')
    hello_str = 'Hello, %s!' % hello_to
    print(hello_str)
    span.finish()

if __name__ == '__main__':
    say_hello("samlet")

"""
$ python -m dummy.simple
"""

