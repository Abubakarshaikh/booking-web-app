import flask_bcrypt

from server.db import db, Service
from server.utils.models import Auditable
from server.utils.citext import CIText


class Role(db.Model):
    __tablename__ = 'roles'

    id = db.Column(db.Integer(), primary_key=True)
    name = db.Column(db.String(50), unique=True)


class UserRoles(db.Model):
    __tablename__ = 'user_roles'

    id = db.Column(db.Integer(), primary_key=True)
    role_id = db.Column(db.Integer(), db.ForeignKey('roles.id', ondelete='CASCADE'))
    user_id = db.Column(db.Integer(), db.ForeignKey('users.id', ondelete='CASCADE'))


class User(Auditable, db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    company = db.Column(db.String(52))
    email = db.Column(CIText, unique=True)
    first_name = db.Column(db.String(52))
    last_name = db.Column(db.String(52))
    username = db.Column(db.String(52))
    phone_number = db.Column(db.String(26), unique=True)
    password_hash = db.Column(db.String(256))

    confirmation_code = db.Column(db.String(4))
    is_confirmed = db.Column(db.Boolean(), default=False)

    roles = db.relationship('Role', secondary='user_roles',
                            backref=db.backref('users', lazy='dynamic'))


    mailing_address_id = db.Column(db.Integer, db.ForeignKey('addresses.id'), nullable=False)
    mailing_address = db.relationship(
        'Address',
        # backref='owner',
        uselist=False,
        cascade='delete',
        foreign_keys=[mailing_address_id],
    )

    billing_address_id = db.Column(db.Integer, db.ForeignKey('addresses.id'), nullable=True)
    billing_address = db.relationship(
        'Address',
        # backref='owner',
        uselist=False,
        cascade='delete',
        foreign_keys=[billing_address_id],
    )

    @staticmethod
    def hash_password(passwd):
        hashed = flask_bcrypt.generate_password_hash(passwd)
        return hashed

    def check_password(self, passwd):
        return flask_bcrypt.check_password_hash(self.password_hash, passwd)

User.created_by_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=True)
User.created_by = db.relationship(
        'User',
        uselist=False,
        backref=db.backref('created_accounts', uselist=True, remote_side=[User.id]),
        foreign_keys=[User.created_by_id],
    )

User.last_updated_by_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=True)
User.last_updated_by = db.relationship(
        'User',
        uselist=False,
        backref=db.backref('updated_accounts', uselist=True, remote_side=[User.id]),
        foreign_keys=[User.last_updated_by_id],
    )


class UserService(Service):
    __model__ = User


class RoleService(Service):
    __model__ = Role
