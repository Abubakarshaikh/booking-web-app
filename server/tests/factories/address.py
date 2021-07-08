import random

import factory

from server.db import db
from server.models import Address


class AddressFactory(factory.alchemy.SQLAlchemyModelFactory):
    class Meta:
        model = Address
        sqlalchemy_session = db.session
    
    street_address = factory.Faker('street_address')
    city = factory.Faker('city')
    state = factory.Faker('state')
    zip_code = factory.Faker('postcode')
