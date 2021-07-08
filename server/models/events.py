from enum import Enum
from sqlalchemy import DateTime

from server.db import db, Service
from server.utils.models import Auditable


class EventStatus(Enum):
    for_sale = 1
    sold_out = 2
    cancelled = 3
    completed = 4

    def __str__(self):
        return self.name


class Event(Auditable, db.Model):
    __tablename__ = 'events'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(256))
    description = db.Column(db.Text())
    status = db.Column(db.Enum(EventStatus))
    start_time = db.Column(DateTime(timezone=True))
    sales_start_time = db.Column(DateTime(timezone=True))
    sales_end_time = db.Column(DateTime(timezone=True))
    thumbnail = db.Column(db.String(256))

    promoter_id = db.Column(db.Integer, db.ForeignKey('promoters.id'), nullable=False)
    promoter = db.relationship(
        'Promoter',
        backref=db.backref('events', uselist=True),
        uselist=False,
        cascade='delete',
        foreign_keys=[promoter_id],
    )

    stadium_id = db.Column(db.Integer, db.ForeignKey('stadiums.id'), nullable=False)
    stadium = db.relationship(
        'Stadium',
        backref=db.backref('events', uselist=True),
        uselist=False,
        cascade='delete',
        foreign_keys=[stadium_id],
    )


class EventService(Service):
    __model__ = Event
