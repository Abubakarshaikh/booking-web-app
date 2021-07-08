from enum import Enum

from sqlalchemy import DateTime

from server.db import db, Service
from server.utils.models import Auditable


class TicketState(Enum):
    not_complete = 1
    reserved = 2
    complete = 3


class Ticket(Auditable, db.Model):
    __tablename__ = 'purchase'

    id = db.Column(db.Integer, primary_key=True)
    state = db.Column(db.Enum(TicketState))
    # TODO: reserved while in a users cart, for a period of time.
    reserved_at = db.Column(DateTime(timezone=True))

    event_id = db.Column(db.Integer, db.ForeignKey('events.id'), nullable=False)
    event = db.relationship(
        'Event',
        backref=db.backref('purchases', uselist=True),
        uselist=False,
        cascade='delete',
        foreign_keys=[event_id],
    )

    seat_id = db.Column(db.Integer, db.ForeignKey('seats.id'), nullable=False)
    seat = db.relationship(
        'Seat',
        backref=db.backref('purchases', uselist=True),
        uselist=False,
        cascade='delete',
        foreign_keys=[seat_id],
    )

    reservation_id = db.Column(db.Integer, db.ForeignKey('reservations.id'), nullable=True)
    reservation = db.relationship(
        'Reservation',
        backref=db.backref('purchases', uselist=True),
        uselist=False,
        cascade='delete',
        foreign_keys=[reservation_id],
    )
