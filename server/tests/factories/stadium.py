from datetime import datetime, timedelta

import factory

from server.db import db
from server.models import Stadium

from .address import AddressFactory


class StadiumFactory(factory.alchemy.SQLAlchemyModelFactory):
    class Meta:
        model = Stadium
        sqlalchemy_session = db.session

    telephone = factory.Faker('phone_number')
    fax = factory.Faker('phone_number')
    email = factory.Faker('email')
    description = factory.Faker('sentence', nb_words=25)
    address = factory.SubFactory(AddressFactory)
