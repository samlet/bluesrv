import json
import threading
from dataclasses import dataclass, field
from datetime import datetime, date
from decimal import Decimal
from json import JSONEncoder, dumps

class CustomEncoder(JSONEncoder):
    def default(self, obj):
        if isinstance(obj, set):
            return list(obj)
        if isinstance(obj, datetime):
            return obj.isoformat(sep=' ')
        if isinstance(obj, date):
            return obj.isoformat()
        elif isinstance(obj, Decimal):
            return str(obj)
        return JSONEncoder.default(self, obj)


def receive_topic(topic: str, print_value=False):
    import sys
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


@dataclass
class InstanceConf:
    in_topic: str = field(default="bluecc-in")
    out_topic: str = field(default="bluecc-out")


instance_confs = {
    "default": InstanceConf(
        in_topic="bluecc-in",
        out_topic="bluecc-out"
    )
}


class ReceiverThread(threading.Thread):
    def __init__(self, conf):
        super().__init__()
        self.conf = conf

    def run(self):
        receive_topic(self.conf.out_topic, True)

