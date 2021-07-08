from flask import Flask
from flask_bcrypt import Bcrypt
from flask_jwt_extended import JWTManager
from flask_migrate import Migrate
from flask_restful import Api
from flask_apispec.extension import FlaskApiSpec

from server.admin import add_admin
from server.config import Config
from server.db import db
from server.cli import add_commands
from server.login_manager import login_manager
from server.resources import add_routes, register_docs
from server.services import user_service, token_blacklist

app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)
migrate = Migrate(app, db)

admin = add_admin(app)
api = Api(app, catch_all_404s=True)
jwt = JWTManager(app)
bcrypt = Bcrypt(app)

@jwt.user_lookup_loader
def user_loader_callback(_jwt_header, jwt_data):
    return user_service.first(id=jwt_data['sub'])


@jwt.user_identity_loader
def user_identity_lookup(email):
    return user_service.first(email=email).id


@jwt.token_in_blocklist_loader
def check_if_token_in_blocklist(jwt_headers, jwt_payload):
    return bool(token_blacklist.get(jwt_payload['jti']))


def create_app():
    add_routes(api)
    add_commands(app)
    login_manager.init_app(app)
    docs = FlaskApiSpec(app)
    register_docs(docs)
    return app
