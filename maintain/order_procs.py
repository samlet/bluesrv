import json
import time
from dataclasses import dataclass, field

from feeder import Publisher
from helpers import receive_topic, InstanceConf, ReceiverThread, instance_confs
from termcolor import colored
import threading
import logging

logger = logging.getLogger(__name__)

class OrderProcs(object):
    def __init__(self):
        self.publisher = Publisher()

    def boot_consumer(self, conf: InstanceConf):
        logger.info(".. config consumer")
        ReceiverThread(conf).start()
        time.sleep(0.5)

    def purchase_order(self, conf_name='default'):
        """
        $ python -m order_procs purchase_order
        :return:
        """
        conf = instance_confs[conf_name]
        self.boot_consumer(conf)

        logger.info(".. send request")
        self.publisher.publish_with_headers(
            conf.in_topic,
            b"salesOrder: verbose",
            [('type', b'text/yaml'),
             ('fn', b'salesOrder')
             ])

        print(colored(".. wait response", "green", attrs=["reverse"]))
        # receive_topic(conf.out_topic, True)

    def list_order(self, order_id="WSCO10112", conf_name='default'):
        """
        $ python -m order_procs list_order
        $ python -m order_procs list_order --order_id=WSCO10112

        :param conf:
        :return:
        """
        conf = instance_confs[conf_name]
        self.boot_consumer(conf)

        print(".. service request")
        self.service_req(conf, "performFindList", {
            "entityName": "OrderHeader",
            "viewIndex": 0, "viewSize": 5,
            "inputFields": {"orderId": order_id}
        })
        self.service_req(conf, "performFindList", {
            "entityName": "OrderItem",
            "viewIndex": 0, "viewSize": 5,
            "inputFields": {"orderId": order_id}
        })
        # receive_topic(conf.out_topic, True)

    def service_req(self, conf, srv_name: str, request):
        body = str.encode(json.dumps({
            "serviceName": srv_name,
            "serviceInParams": request},
            ensure_ascii=False, indent=2))
        self.publisher.publish_with_headers(
            conf.in_topic,
            body,
            [('type', b'application/json'),
             ('fn', b'service')
             ])
        print(colored(f".. wait response for {srv_name}", "green", attrs=["reverse"]))


if __name__ == '__main__':
    import fire

    fire.Fire(OrderProcs)
