from server.db import db, Service
from server.utils.models import Auditable


class Company(Auditable, db.Model):
    __tablename__ = 'addresses'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String)
    mailing_address_id = db.Column(db.Integer, db.ForeignKey('addresses.id'), nullable=False)
    mailing_address = db.relationship(
        'Address',
        # backref='owner',
        uselist=False,
        cascade='delete',
        foreign_keys=[mailing_address_id],
    )


class AddressService(Service):
    __model__ = Company
