from sqlalchemy.orm import relationship, backref
from sqlalchemy import Column, Integer, Unicode, UnicodeText, ForeignKey

from . import DBSession, Base


# Create your models here.
class Info(Base):
    __tablename__='info'
    id = Column(Integer, primary_key=True)
    first_name = Column(Unicode(100))
    last_name = Column(Unicode(100))
    email = Column(Unicode(100))
    password = Column(Unicode(100))
    country = Column(Unicode(100))
    code = Column(Unicode(100))
    
class Movies(Base):
    __tablename__='movies'
    id = Column(Integer, primary_key=True)
    movie_name = Column(Unicode(100))
    movie_path = Column(Unicode(1000))
    code = Column(Unicode(100))
    user_id = Column(Integer, ForeignKey(Info.id))
    
    user = relationship(Info, backref=backref("movies"))
    
class Friends(Base):
    __tablename__='friends'
    id = Column(Integer, primary_key=True)
    frnd_emails = Column(Unicode(100))
    user_id = Column(Integer, ForeignKey(Info.id))
    '''movie_path = Column(Unicode(1000))
    user_id = Column(Integer, ForeignKey(Info.id))
    
    user = relationship(Info, backref=backref("movies"))'''