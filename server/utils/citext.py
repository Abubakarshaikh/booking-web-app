from sqlalchemy import types

from sqlalchemy.dialects.postgresql.base import ischema_names


class CIText(types.UserDefinedType):
    def get_col_spec(self, **kwargs):  # pylint: disable=unused-argument
        return 'CITEXT'

    def bind_processor(self, dialect):
        def process(value):
            return value
        return process

    def result_processor(self, dialect, coltype):
        def process(value):
            return value
        return process

ischema_names['citext'] = CIText
