import phoenixdb
import phoenixdb.cursor

database_url = 'http://localhost:8765/'

class PhoenixTool(object):
    def __init__(self):
        self.conn=phoenixdb.connect(database_url, autocommit=True)

    def test(self):
        """
        $ python -m phoenix_tool test
        :return:
        """
        cursor = self.conn.cursor()
        cursor.execute("CREATE TABLE if not exists users (id INTEGER PRIMARY KEY, username VARCHAR)")
        cursor.execute("UPSERT INTO users VALUES (?, ?)", (1, 'admin'))
        cursor.execute("SELECT * FROM users")
        print(cursor.fetchall())

        cursor = self.conn.cursor(cursor_factory=phoenixdb.cursor.DictCursor)
        cursor.execute("SELECT * FROM users WHERE id=1")
        print(cursor.fetchone()['USERNAME'])

if __name__ == '__main__':
    import fire
    fire.Fire(PhoenixTool)
