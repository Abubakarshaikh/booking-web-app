import random

import factory

from server.db import db
from server.models import User
from .address import AddressFactory


class UserFactory(factory.alchemy.SQLAlchemyModelFactory):
    first_name = factory.Faker('first_name')
    last_name = factory.Faker('last_name')
    email = factory.Faker('email')
    phone_number = factory.Faker('phone_number')
    password_hash = factory.LazyAttribute(lambda o: User.hash_password(str(random.randint(0, 9999999))))
    is_confirmed = factory.Faker('pybool')
    company = factory.Faker('company')
    confirmation_code = factory.Faker('lexify', text='????')
    mailing_address = factory.SubFactory(AddressFactory)
    billing_address = factory.SubFactory(AddressFactory)

    # created_by = factory.SubFactory(UserFactory)
    # last_updated_by = factory.SubFactory(UserFactory)

    class Meta:
        model = User
        sqlalchemy_session = db.session
