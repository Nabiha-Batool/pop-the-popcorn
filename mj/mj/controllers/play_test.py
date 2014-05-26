from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound, HTTPNotFound

from ..models import DBSession, Play
import re

@view_config(route_name='play_master', renderer='play_master.mako')
def play_master(request):
    "Controller for master player who controls video playing"

    movie = request.matchdict.get('movie_name', None)
    if not movie:
        return HTTPNotFound(detail="No movie name given")

    return dict(movie_name=movie)


@view_config(route_name='play_slave', renderer='slaveplayer.mako')
def play_slave(request):
    "Controller for slave players who just watch and can't control playback"

    movie = request.matchdict.get('movie_name', None)
    if not movie:
        return HTTPNotFound(detail="No movie name given")

    return dict(movie_name=movie)


@view_config(route_name='set_position', renderer="json")
def set_position(request):
    "Controller for receiving current play position. Used by master player"

    movie_name = request.matchdict['movie_name']
    position = int(request.matchdict['position'])

    movie = DBSession.query(Play).filter_by(filename=movie_name).first()
    if not movie:
        movie = Play()
        movie.filename = movie_name
        movie.current_position = position
        DBSession.add(movie)
    else:
        #if position == movie.current_position:
            #movie.current_position = -1
        #else:
        movie.current_position = position

    return {"msg": "OK"}


@view_config(route_name='get_position', renderer="json")
def get_position(request):
    "Controller for telling current play position. Used by slave players"

    movie_name = request.matchdict['movie_name']

    movie = DBSession.query(Play).filter_by(filename=movie_name).first()

    if not movie:
        return dict(position=-1)
    else:
        return dict(position=movie.current_position)
