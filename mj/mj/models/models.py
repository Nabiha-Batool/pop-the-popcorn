from sqlalchemy.orm import relationship, backref
from sqlalchemy import Column, Integer, Unicode, UnicodeText, ForeignKey

from . import DBSession, Base


# Create your models here.
class Info(Base):
    __tablename__ = 'info'
    
    id = Column(Integer, primary_key=True)
    first_name = Column(Unicode(100))
    last_name = Column(Unicode(100))
    user_name = Column(Unicode(100))
    password = Column(Unicode(100))