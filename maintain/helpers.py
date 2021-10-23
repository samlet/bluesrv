import json
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
