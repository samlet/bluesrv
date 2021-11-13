from peewee import *

database = MySQLDatabase('bot', **{'charset': 'utf8', 'sql_mode': 'PIPES_AS_CONCAT', 'use_unicode': True, 'user': 'root', 'password': 'root'})

class UnknownField(object):
    def __init__(self, *_, **__): pass

class BaseModel(Model):
    class Meta:
        database = database

class Users(BaseModel):
    fullname = CharField(null=True)
    name = CharField(null=True)

    class Meta:
        table_name = 'users'

class Addresses(BaseModel):
    email_address = CharField()
    user = ForeignKeyField(column_name='user_id', field='id', model=Users, null=True)

    class Meta:
        table_name = 'addresses'

class Hotel(BaseModel):
    breakfast_included = IntegerField(null=True)
    city = CharField(null=True)
    free_wifi = IntegerField(null=True)
    name = CharField(null=True)
    price_range = CharField(null=True)
    star_rating = IntegerField(null=True)
    swimming_pool = IntegerField(null=True)

    class Meta:
        table_name = 'hotel'

class Restaurant(BaseModel):
    cuisine = CharField(null=True)
    name = CharField(null=True)
    outside_seating = IntegerField(null=True)
    price_range = CharField(null=True)

    class Meta:
        table_name = 'restaurant'

