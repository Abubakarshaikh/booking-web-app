from server.db import db, Service
from server.utils.models import Auditable


class Address(Auditable, db.Model):
    __tablename__ = 'addresses'

    id = db.Column(db.Integer, primary_key=True)
    street_address = db.Column(db.String(256))
    city = db.Column(db.String(50))
    state = db.Column(db.String(25))
    country = db.Column(db.String(50))
    zip_code = db.Column(db.String(15))


class AddressService(Service):
    __model__ = Address
