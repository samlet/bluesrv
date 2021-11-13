import pugsql

class PartyProcs(object):
    def __init__(self):
        self.queries = pugsql.module('queries/')
        self.queries.connect('postgresql://xiaofeiwu@localhost/ofbiz')

    def find_by_id(self, id):
        """
        $ python -m party_procs find_by_id admin

        :param id:
        :return:
        """
        result = self.queries.user_for_id(user_id=id)
        return result

    def find_person_by_id(self, id, format='json'):
        """
        $ python -m party_procs find_person_by_id admin | json
        $ python -m party_procs find_person_by_id admin csv

        :param id:
        :return:
        """
        import records
        db = records.Database('postgresql://xiaofeiwu@localhost/ofbiz')
        rows = db.query('select * from person where party_id=:id', id=id)
        # print(rows.first())
        print(rows.export(format))

if __name__ == '__main__':
    import fire
    fire.Fire(PartyProcs)


