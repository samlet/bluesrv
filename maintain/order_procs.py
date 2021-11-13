from dataclasses import dataclass, field

from feeder import Publisher
from fn_tool import receive_topic


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


class OrderProcs(object):
    def __init__(self):
        self.publisher = Publisher()

    def purchase_order(self, conf='default'):
        """
        $ python -m order_procs purchase_order
        :return:
        """
        conf = instance_confs[conf]

        print(".. send request")
        self.publisher.publish_with_headers(
            conf.in_topic,
            b"salesOrder: verbose",
            [('type', b'text/yaml'),
             ('fn', b'salesOrder')
             ])
        print(".. wait response")
        receive_topic(conf.out_topic, True)


if __name__ == '__main__':
    import fire

    fire.Fire(OrderProcs)
