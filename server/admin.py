from flask_admin import Admin
from flask_admin.contrib.sqla import ModelView

from server.db import db
from server.models import User, UserRoles
from server.models.stadium import Stadium
from server.models.seat import Seat, Row, Section


def add_admin(app):
    admin = Admin(app, name='bravostix', template_mode='bootstrap3')
    admin.add_view(ModelView(User, db.session))
    admin.add_view(ModelView(UserRoles, db.session))
    admin.add_view(ModelView(Stadium, db.session))
    admin.add_view(ModelView(Section, db.session))
    admin.add_view(ModelView(Seat, db.session))
    admin.add_view(ModelView(Row, db.session))

    return admin
