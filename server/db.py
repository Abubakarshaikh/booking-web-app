from flask_sqlalchemy import SQLAlchemy
from werkzeug.local import LocalProxy


db = SQLAlchemy()

class Service:
    """A :class:`Service` instance encapsulates common SQLAlchemy model
    operations in the context of a :class:`Flask` application.
    """
    __model__ = None

    @property
    def query(self):
        return self.__model__.query

    def _isinstance(self, model, raise_error=True):
        """Checks if the specified model instance matches the service's model.
        By default this method will raise a `ValueError` if the model is not the
        expected type.
        :param model: the model instance to check
        :param raise_error: flag to raise an error on a mismatch
        """
        if isinstance(model, LocalProxy):
            model = model._get_current_object()
        rv = isinstance(model, self.__model__)
        if not rv and raise_error:
            raise ValueError('%s is not of type %s' % (model, self.__model__))
        return rv

    def save(self, model):
        """Commits the model to the database and returns the model
        :param model: the model to save
        """
        self._isinstance(model)
        db.session.add(model)
        db.session.commit()
        return model

    def all(self, limit=None):
        """Returns a generator containing all instances of the service's model.
        """
        if limit:
            return self.__model__.query.limit(limit).all()
        return self.__model__.query.all()

    def get(self, id):
        """Returns an instance of the service's model with the specified id.
        Returns `None` if an instance with the specified id does not exist.
        :param id: the instance id
        """
        return self.__model__.query.get(id)

    def get_all(self, *ids):
        """Returns a list of instances of the service's model with the specified
        ids.
        :param *ids: instance ids
        """
        return self.__model__.query.filter(self.__model__.id.in_(ids)).all() if len(ids) > 0 else []

    def find(self, **kwargs):
        """Returns a list of instances of the service's model filtered by the
        specified key word arguments.
        :param **kwargs: filter parameters
        """
        return self.__model__.query.filter_by(**kwargs)

    def filter(self, *criterion):
        """Returns a list of instances of the service's model filtered by the
        specified key word arguments.
        :param **kwargs: filter parameters
        """
        return self.__model__.query.filter(*criterion)

    def first(self, **kwargs):
        """Returns the first instance found of the service's model filtered by
        the specified key word arguments.
        :param **kwargs: filter parameters
        """
        return self.find(**kwargs).first()

    def one(self, **kwargs):
        return self.find(**kwargs).one()

    def one_or_none(self, **kwargs):
        return self.find(**kwargs).one_or_none()

    def new(self, **kwargs):
        """Returns a new, unsaved instance of the service's model class.
        :param **kwargs: instance parameters
        """
        return self.__model__(**kwargs)

    def create(self, **kwargs):
        """Returns a new, saved instance of the service's model class.
        :param **kwargs: instance parameters
        """
        return self.save(self.new(**kwargs))

    def update(self, model, commit=False, **kwargs):
        """Returns an updated instance of the service's model class.
        :param model: the model to update
        :param **kwargs: update parameters
        """
        self._isinstance(model)
        for k, v in kwargs.items():
            setattr(model, k, v)
        if commit:
            self.save(model)
        return model

    def delete(self, model):
        """Immediately deletes the specified model instance.
        :param model: the model instance to delete
        """
        self._isinstance(model)
        db.session.delete(model)
        db.session.commit()

    def find_and_delete(self, **kwargs):
        """Finds instances of the service's model filtered by the
        specified key word arguments and deletes them.
        :param **kwargs: filter parameters
        """
        return self.delete(self.first(**kwargs))
