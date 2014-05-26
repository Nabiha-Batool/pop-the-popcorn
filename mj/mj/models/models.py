from sqlalchemy.orm import relationship, backref
from sqlalchemy import Column, Integer, Unicode, UnicodeText, ForeignKey

from . import DBSession, Base


# Create your models here.

class Play(Base):
    __tablename__ = 'plays'

    filename = Column(Unicode(250), primary_key=True)
    current_position = Column(Integer)
    
class Info(Base):
    __tablename__='info'
    id = Column(Integer, primary_key=True)
    first_name = Column(Unicode(100))
    last_name = Column(Unicode(100))
    email = Column(Unicode(100))
    password = Column(Unicode(100))

class Movies(Base):
    __tablename__='movies'
    id = Column(Integer, primary_key=True)
    movie_name = Column(Unicode(100))
    movie_path = Column(Unicode(1000))
    code = Column(Unicode(100))
    movie_member = Column(Integer)
    user_id = Column(Integer, ForeignKey(Info.id))
    user = relationship(Info, backref=backref("movies"))

class Groups(Base):
    __tablename__='groups'
    id = Column(Integer, primary_key=True)
    code = Column(Unicode(100))
    frnd_emails = Column(Unicode(100))
    movie_member = Column(Integer)
    movie_name = Column(Unicode(100))
    movie_id = Column(Integer, ForeignKey(Movies.id))

