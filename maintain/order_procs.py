import json
import time
from dataclasses import dataclass, field

from feeder import Publisher
from fn_tool import receive_topic
from termcolor import colored
import threading

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
        self.conf=conf

    def run(self):
        receive_topic(self.conf.out_topic, True)


class OrderProcs(object):
    def __init__(self):
        self.publisher = Publisher()

    def boot_consumer(self, conf: InstanceConf):
        print(".. config consumer")
        ReceiverThread(conf).start()
        time.sleep(0.5)

    def purchase_order(self, conf_name='default'):
        """
        $ python -m order_procs purchase_order
        :return:
        """
        conf = instance_confs[conf_name]
        self.boot_consumer(conf)

        print(".. send request")
        self.publisher.publish_with_headers(
            conf.in_topic,
            b"salesOrder: verbose",
            [('type', b'text/yaml'),
             ('fn', b'salesOrder')
             ])

        print(colored(".. wait response", "green", attrs=["reverse"]))
        # receive_topic(conf.out_topic, True)

    def list_order(self, conf_name='default'):
        """
        $ python -m order_procs list_order
        :param conf:
        :return:
        """
        conf = instance_confs[conf_name]
        self.boot_consumer(conf)
        print(".. service request")
        request = {
            "serviceName": "performFindList",
            "serviceInParams": {
                "entityName": "Product",
                "viewIndex": 0,
                "viewSize": 5,
                "inputFields": {
                    "productId": "GZ-2644"
                }
            }
        }
        body = str.encode(json.dumps(request, ensure_ascii=False, indent=2))
        self.publisher.publish_with_headers(
            conf.in_topic,
            body,
            [('type', b'application/json'),
             ('fn', b'service')
             ])

        print(colored(".. wait response", "green", attrs=["reverse"]))
        # receive_topic(conf.out_topic, True)

if __name__ == '__main__':
    import fire

    fire.Fire(OrderProcs)
