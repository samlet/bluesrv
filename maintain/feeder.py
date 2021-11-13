import time
import random
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

    def publish_raw(self, topic, data):
        self.producer.send(topic, bytes(data, "utf-8"))
        self.producer.flush()

    def publish_multi(self, topic, data_list: List[Any]):
        for data in data_list:
            json_data = json.dumps(data, cls=CustomEncoder, ensure_ascii=False)
            self.producer.send(topic, bytes(json_data, "utf-8"))
        self.producer.flush()

    def publish_record(self, topic, key, value):
        self.producer.send(topic, key=key.dumps(), value=value.dumps())
        self.producer.flush()

    def publish_with_headers(self, topic, value, headers):
        self.producer.send(topic, value=value, headers=headers)
        self.producer.flush()

    def consume(self, topic):
        from kafka import KafkaConsumer
        consumer = KafkaConsumer(topic)
        for msg in consumer:
            print(msg)


class Feeder(object):
    def __init__(self):
        # initialize a generator
        # self.fake = Faker()
        self.fake = Faker(['it_IT', 'en_US', 'ja_JP', 'zh_CN'])
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

    def proc(self, fn, total:int, publish:bool, topic:str):
        data_list = []
        for cur in range(0, total):
            data = fn()
            data['id']=cur+1  # add the auto-increment id
            data_list.append(data)
            print(cur + 1, data)

        if publish:
            self.publisher.publish_multi(topic, data_list)

    def user(self, total=10, publish=False, topic="user"):
        """
        $ just create user
        $ just consume user
        $ python -m feeder user
        $ python -m feeder user 20 True
        :return:
        """
        self.proc(self.fake.profile, total, publish, topic)

    def send_test_rules(self):
        """
        $ python -m feeder send_test_rules

        :return:
        """
        self.publisher.publish_raw("rules", """
[
  {
    "name": "adult rule",
    "description": "when age is greater than 18, then mark as adult",
    "priority": 1,
    "condition": "person.age > 18",
    "actions": [
      "person.setAdult(true);"
    ]
  }
]
        """)
        time.sleep(1)
        self.publisher.publish("person", {"name": "samlet", "age": 38})
        self.publisher.publish("person", {"name": "kitty", "age": 8})

        for index in range(0, 100):
            self.publisher.publish("person", {
                "name": self.fake.name(),
                "age": random.randint(1,40),
            })
            time.sleep(0.3)

if __name__ == '__main__':
    import fire

    fire.Fire(Feeder)
