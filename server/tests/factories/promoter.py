from datetime import datetime, timedelta

import factory

from server.db import db
from server.models import Promoter

from .address import AddressFactory


class PromoterFactory(factory.alchemy.SQLAlchemyModelFactory):
    class Meta:
        model = Promoter
        sqlalchemy_session = db.session

    telephone = factory.Faker('phone_number')
    fax = factory.Faker('phone_number')
    email = factory.Faker('email')
    description = factory.Faker('sentence', nb_words=25)
    address = factory.SubFactory(AddressFactory)
