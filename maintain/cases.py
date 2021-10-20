import logging
import sys

class Cases(object):
    def datagen(self):
        """
        $ python -m cases datagen
        :return:
        """
        from dataframe.pandas_udaf import pandas_udaf
        pandas_udaf()

    def filter_country(self, country):
        """
        $ python -m cases filter_country China
        :param country:
        :return:
        """
        from datastream.process_json_data import process_json_data
        process_json_data(country)



if __name__ == '__main__':
    import fire

    logging.basicConfig(stream=sys.stdout, level=logging.INFO, format="%(message)s")
    fire.Fire(Cases)
