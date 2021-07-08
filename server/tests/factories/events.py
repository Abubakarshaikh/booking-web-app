from datetime import datetime, timedelta

import factory

from server.db import db
from server.models import Event, EventStatus

from .promoter import PromoterFactory
from .stadium import StadiumFactory


class EventFactory(factory.alchemy.SQLAlchemyModelFactory):
    class Meta:
        model = Event
        sqlalchemy_session = db.session

    name = factory.Faker('name')
    description = factory.Faker('sentence')
    status = factory.Iterator(EventStatus)
    start_time = factory.Faker('date_time_between_dates', 
        datetime_start=datetime.now() - timedelta(days=60),
        datetime_end=datetime.now() + timedelta(days=60),
    )
    sales_start_time = factory.LazyAttribute(lambda o: o.start_time - timedelta(days=60))
    sales_end_time = factory.LazyAttribute(lambda o: o.start_time + timedelta(days=90))
    promoter = factory.SubFactory(PromoterFactory)
    stadium = factory.SubFactory(StadiumFactory)
