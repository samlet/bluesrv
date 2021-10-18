from clickhouse_driver import Client

class ClickHouseProcs(object):
    def __init__(self):
        settings = {'max_threads': 2}
        self.client = Client(host='localhost', settings=settings)

    def db(self):
        """
        $ python3 -m click_house_info db
        :return:
        """
        return self.client.execute('SHOW DATABASES')

    def tables(self):
        """
        $ python3 -m click_house_info tables
        :return:
        """
        return self.client.execute("SHOW TABLES")

if __name__ == '__main__':
    import fire
    fire.Fire(ClickHouseProcs)

