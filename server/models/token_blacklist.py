from server.db import db, Service


class TokenBlacklist(db.Model):
    __tablename__ = 'token_blacklist'
    token = db.Column(db.String, primary_key=True)


class TokenBlacklistService(Service):
    __model__ = TokenBlacklist
