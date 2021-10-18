from datetime import datetime
from json import JSONEncoder, dumps
from pymysql import connect
from pymysql.cursors import SSDictCursor

# Define a class to encode values to a json representation
import io_utils


class CustomEncoder(JSONEncoder):
   def default(self, obj):
      if isinstance(obj, set):
         return list(obj)
      if isinstance(obj, datetime):
         return obj.isoformat()
      return JSONEncoder.default(self, obj)


class MysqlTool(object):
    def __init__(self):
        pass

    def dump(self, table, db="bot", target=""):
        """
        $ python -m mysql_tool dump hotel bot
        $ python -m mysql_tool dump hotel bot dump/hotel.jsonl

        :param table:
        :return:
        """
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

        query=f"select * from {table}"

        try:
            # Execute the query and iterate over the results
            with self.connection.cursor() as cursor:
                lines=[]
                cursor.execute(query)
                for result in cursor:
                    if target=="":
                        print(dumps(result, cls=CustomEncoder))
                    else:
                        lines.append(dumps(result, cls=CustomEncoder))

                io_utils.write_to_file(target, '\n'.join(lines))
        finally:
            # Close the database connection
            self.connection.close()


if __name__ == '__main__':
    import fire
    fire.Fire(MysqlTool)
