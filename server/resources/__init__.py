from .auth import (
    Check, Ping, Login, Refresh, Logout, ConfirmTwoFactor
)

from .events import Events
from .payments import Payment
from .tickets import Sections
from .user import User, Users


def add_routes(api):
    api.add_resource(Check, '/check')
    api.add_resource(Refresh, '/refresh')
    api.add_resource(Login, '/login')
    api.add_resource(Logout, '/logout')
    api.add_resource(Ping, '/ping')

    api.add_resource(Events, '/events')
    api.add_resource(Sections, '/sections/<int:stadium_id>')
    api.add_resource(Payment, '/payment')
    api.add_resource(User, '/user')
    api.add_resource(Users, '/users')


def register_docs(docs):
    docs.register(Check)
    docs.register(Refresh)
    docs.register(Login)
    docs.register(Logout)
    docs.register(Ping)
    docs.register(Events)
    docs.register(Payment)
    docs.register(User)
