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

from server.services import event_service


class EventSchema(Schema):
    name = fields.Str()
    description = fields.Str()
    status = fields.Str()
    start_time = fields.Str(data_key='startTime')
    sales_start_time = fields.Str(data_key='salesStartTime')
    sales_end_time = fields.Str(data_key='salesEndTime')
    thumbnail = fields.Str()


class EventsResponseSchema(Schema):
    events = fields.List(fields.Nested(EventSchema))


class Events(MethodResource, Resource):
    @marshal_with(EventsResponseSchema)
    @jwt_required()
    def get(self):
        return {
            'events': event_service.query.order_by('start_time').all(),
        }
