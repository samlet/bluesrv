import json
from datetime import datetime
from decimal import Decimal
from json import JSONEncoder, dumps
from pymysql import connect
from pymysql.cursors import SSDictCursor

# Define a class to encode values to a json representation
import io_utils
from helpers import CustomEncoder


class MysqlTool(object):
    def __init__(self):
        self.topic=""
        self.producer=None
        self.output_kind="stdout"

    def consume(self, topic):
        """
        $ python -m mysql_tool consume data

        :param topic:
        :return:
        """
        from kafka import KafkaConsumer
        consumer = KafkaConsumer(topic)
        for msg in consumer:
            print(msg)

    def dump(self, table, db="bot", target=""):
        """
        $ python -m mysql_tool dump hotel bot
        $ python -m mysql_tool dump hotel bot dump/hotel.jsonl
        $ python -m mysql_tool dump hotel bot *data   # output to kafka
        $ python -m mysql_tool dump order_info gmall dump/order_info.jsonl
        $ python -m mysql_tool dump sku_info gmall dump/sku_info.jsonl
        $ python -m mysql_tool dump spu_info gmall dump/spu_info.jsonl

        :param table:
        :return:
        """
        from kafka import KafkaProducer

        # Initialize the connection parameters
        params = {
            'host': 'localhost',
            'user': 'root',
            'password': 'root',
            'port': 3306,
            'db': db,
            'charset': 'utf8mb4',
            'cursorclass': SSDictCursor
        }
        # Instantiate connection
        self.connection = connect(**params)

        # setup output kind
        if target == "":
            self.output_kind="stdout"
        elif target.startswith("*"):
            self.output_kind="kafka"
            self.topic=target[1:]
            print("output to kafka:", self.topic)
            self.producer = KafkaProducer(bootstrap_servers='localhost:9092')
        else:
            self.output_kind="file"

        query=f"select * from {table}"

        try:
            # Execute the query and iterate over the results
            with self.connection.cursor() as cursor:
                lines=[]
                cursor.execute(query)
                for result in cursor:
                    data=dumps(result, cls=CustomEncoder, ensure_ascii=False)
                    if self.output_kind=="stdout":
                        print(data)
                    elif self.output_kind=="kafka":
                        self.producer.send(self.topic, bytes(data, "utf-8"))
                    else:
                        lines.append(data)

                if self.output_kind=="file":
                    io_utils.write_to_file(target, '\n'.join(lines))
                elif self.output_kind=="kafka":
                    self.producer.flush()
        finally:
            # Close the database connection
            self.connection.close()


if __name__ == '__main__':
    import fire
    fire.Fire(MysqlTool)
