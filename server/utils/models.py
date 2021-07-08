import datetime

from sqlalchemy import DateTime, func

from server.db import db


def get_now_utc():
    return datetime.datetime.now(datetime.timezone.utc)


class Auditable(object):
    created_at = db.Column(
        DateTime(timezone=True),
        nullable=False,
        server_default=func.now(),
        index=True,
    )
    updated_at = db.Column(
        DateTime(timezone=True),
        nullable=False,
        server_default=func.now(),
        onupdate=get_now_utc,
        index=True,
    )
    deleted_at = db.Column(DateTime(timezone=True), index=True)
