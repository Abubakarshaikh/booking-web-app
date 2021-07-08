from server.db import db, Service
from server.utils.models import Auditable


class Promoter(Auditable, db.Model):
    __tablename__ = 'promoters'

    id = db.Column(db.Integer, primary_key=True)
    telephone = db.Column(db.String(256))
    fax = db.Column(db.String(256))
    email = db.Column(db.String(256))
    description = db.Column(db.Text())

    address_id = db.Column(db.Integer, db.ForeignKey('addresses.id'), nullable=False)
    address = db.relationship(
        'Address',
        # backref='owner',
        uselist=False,
        cascade='delete',
        foreign_keys=[address_id],
    )
