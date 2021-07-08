from server.db import db, Service
from server.utils.models import Auditable


class Section(Auditable, db.Model):
    __tablename__ = 'sections'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(256))

    stadium_id = db.Column(db.Integer, db.ForeignKey('stadiums.id'), nullable=False)
    stadium = db.relationship(
        'Stadium',
        backref=db.backref('sections', uselist=True),
        uselist=False,
        cascade='delete',
        foreign_keys=[stadium_id],
    )

    def to_json(self):
        return {
            'id': self.id,
            'name': self.name,
        }


class Row(Auditable, db.Model):
    __tablename__ = 'rows'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(256))

    section_id = db.Column(db.Integer, db.ForeignKey('sections.id'), nullable=False)
    section = db.relationship(
        'Section',
        backref=db.backref('rows', uselist=True),
        uselist=False,
        cascade='delete',
        foreign_keys=[section_id],
    )

    def to_json(self):
        return {
            'id': self.id,
            'name': self.name,
        }


class Seat(Auditable, db.Model):
    __tablename__ = 'seats'

    id = db.Column(db.Integer, primary_key=True)
    number = db.Column(db.String(5))

    row_id = db.Column(db.Integer, db.ForeignKey('rows.id'), nullable=False)
    row = db.relationship(
        'Row',
        backref=db.backref('seats', uselist=True),
        uselist=False,
        cascade='delete',
        foreign_keys=[row_id],
    )

    def to_json(self):
        return {
            'id': self.id,
            'number': self.number,
        }


class SectionService(Service):
    __model__ = Section


class SeatService(Service):
    __model__ = Seat
