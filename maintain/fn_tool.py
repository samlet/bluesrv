import random

from feeder import Publisher
import faust

class Point(faust.Record, serializer='json'):
    x: int
    y: int

class Fn(object):
    def __init__(self):
        self.publisher = Publisher()

    def consume(self, topic):
        """
        $ python -m fn_tool consume data

        :param topic:
        :return:
        """
        from helpers import receive_topic
        receive_topic(topic)

    def send_test_ev(self):
        """
        $ python -m fn_tool send_test_ev
        :return:
        """
        self.publisher.publish_record("topic_event",
                                      Point(x=10, y=20),
                                      Point(x=random.randint(1,30), y=random.randint(1,40)))

if __name__ == '__main__':
    import fire
    fire.Fire(Fn)

