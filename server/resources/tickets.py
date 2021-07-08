from flask import current_app, request, jsonify
from flask_jwt_extended import (
    current_user, get_jwt, jwt_required, create_access_token,
    create_refresh_token
)
from flask_apispec.views import MethodResource
from flask_apispec import marshal_with, use_kwargs, doc
from flask_restful import Resource
from marshmallow import Schema, fields
from werkzeug.exceptions import BadRequest

from server.models import User
from server.services import (
    section_service, seat_service)


@doc(tags=['tickets'], description='get sections of the stadium')
class Sections(MethodResource, Resource):
    def get(self, stadium_id):
        sections = section_service.find(stadium_id=stadium_id).all()
        return [s.to_json() for s in sections]


@doc(tags=['tickets'], description='get seats of a section in a stadium')
class Seats(MethodResource, Resource):
    def get(self, section_id):
        seats = seat_service.find(section_id=section_id).all()
        return [s.to_json() for s in seats]
