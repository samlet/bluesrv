from typing import Text, Any, Dict, List, Union, Optional
import json

from faker import Faker
from kafka import KafkaProducer

from helpers import CustomEncoder


class Publisher(object):
    def __init__(self):
        self.producer = KafkaProducer(bootstrap_servers='localhost:9092')

    def publish(self, topic, data):
        json_data = json.dumps(data, cls=CustomEncoder, ensure_ascii=False)
        self.producer.send(topic, bytes(json_data, "utf-8"))
        self.producer.flush()

    def publish_multi(self, topic, data_list: List[Any]):
        for data in data_list:
            json_data = json.dumps(data, cls=CustomEncoder, ensure_ascii=False)
            self.producer.send(topic, bytes(json_data, "utf-8"))
        self.producer.flush()

    def consume(self, topic):
        from kafka import KafkaConsumer
        consumer = KafkaConsumer(topic)
        for msg in consumer:
            print(msg)


class Feeder(object):
    def __init__(self):
        # initialize a generator
        self.fake = Faker()
        self.publisher = Publisher()

    def user_interest(self, total=10, publish=False, topic="user_interest"):
        """
        $ just create user_interest
        $ just consume user_interest
        $ python -m feeder user_interest
        $ python -m feeder user_interest 20 True
        :return:
        """
        data_list = []
        for cur in range(0, total):
            data = {"id": cur+1,
                    "name": self.fake.name(),
                    "birth_date": self.fake.date_between(start_date='-30y', end_date='today'),
                    "color": self.fake.color_name()
                    }
            data_list.append(data)
            print(cur+1, data)

        if publish:
            self.publisher.publish_multi(topic, data_list)


if __name__ == '__main__':
    import fire

    fire.Fire(Feeder)
