from server.db import db, Service
from server.utils.models import Auditable


class Reservation(Auditable, db.Model):
    __tablename__ = 'reservations'

    id = db.Column(db.Integer, primary_key=True)

    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    user = db.relationship(
        'User',
        backref=db.backref('reservations', uselist=True),
        uselist=False,
        cascade='delete',
        foreign_keys=[user_id],
    )

    # TODO: payment type
    # TODO: payment location
