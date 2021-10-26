from clickhouse_driver import Client
import json

class ClickHouseProcs(object):
    def __init__(self):
        from feeder import Publisher

        settings = {'max_threads': 2}
        self.client = Client(host='localhost', settings=settings)
        self.publisher = Publisher()

    def db(self):
        """
        $ python -m clickhouse_procs db
        :return:
        """
        return self.client.execute('SHOW DATABASES')

    def tables(self):
        """
        $ python -m clickhouse_procs tables
        :return:
        """
        return self.client.execute("SHOW TABLES")

    def query(self, sql):
        return self.client.query_dataframe(sql)

    def publish(self, table, limit=10, db=None):
        '''
        $ just create uk_price_paid
        $ python -m clickhouse_procs publish uk_price_paid 10
        $ just create visits_v1
        # FIXME: OverflowError: int too big to convert
        $ python -m clickhouse_procs publish visits_v1 10 tutorial

        :param table:
        :param limit:
        :return:
        '''
        if db is not None:
            table=f"{db}.{table}"
        ds = self.query(f"select * from {table} limit {limit}")
        js = ds.to_json(orient='records')
        self.publisher.publish_multi(table, json.loads(js))

if __name__ == '__main__':
    import fire
    fire.Fire(ClickHouseProcs)

