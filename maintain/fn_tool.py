import random

from feeder import Publisher
import faust
import sys

def receive_topic(topic: str, print_value=False):
    from kafka import KafkaConsumer
    from termcolor import colored
    consumer = KafkaConsumer(topic)
    try:
        for msg in consumer:
            if print_value:
                print("☑️ ", colored(msg.topic, 'yellow'))
                cnt=msg.value.decode("utf-8")
                print(colored(cnt, "cyan"))
            else:
                print(msg)
    except KeyboardInterrupt:
        sys.exit()

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

