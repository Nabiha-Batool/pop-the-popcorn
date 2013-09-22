import os
import shutil
from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound

from ..models import *

from ..forms import ContactForm #,InfoModelForm #,ProductForm, DojoTestForm
from pyck.forms import model_form, dojo_model_form
from pyck.controllers import CRUDController

'''class InfoCRUDController(CRUDController):
    model = Info
    db_session = DBSession'''

@view_config(route_name='home', renderer='home.mako')
def my_view(request):
    one = None
    return {'one': one, 'project': 'mj'}

@view_config(route_name='player', renderer='player.mako')
def player(request):
    return {}

@view_config(route_name='login', renderer='pyckauth_login.mako')
def login(request):
    if 'POST' == request.method:
        user_list = DBSession.query(Info.user_name, Info.password).all()
        for users in user_list:
            if users.user_name == request.POST['user_id'] and users.password == request.POST['password']:
                request.session['logged_in'] = True
                request.session.flash('Login Successful!')
                return HTTPFound(location=request.route_url('home'))
        request.session.flash('Login Failed!')
    #else:
        #request.session['logged_in'] = False
        
        
    return {'post_url': request.route_url('login')}

@view_config(route_name='signup', renderer='signup.mako')
def signup(request):
    
    ##i = InfoForm(request.POST)
    InfoModelForm = model_form(Info, DBSession, exclude=['id'])
        
    i = InfoModelForm(request.POST)
           
    if "POST" == request.method and i.validate():
        
        I = Info()
        i.populate_obj(I)
        DBSession.add(I)
        
        request.session.flash("Sign up Successfully!")
        return HTTPFound(location=request.route_url('home'))
    
    
    return {'i': i}

@view_config(route_name='upload', renderer='upload.mako')
def upload(request):
    
    destpath = 'mj:static/playerfiles/ ' 
    shutil.move(request.POST['userfile'], destpath)
    
    return {}

@view_config(route_name='contact', renderer="contact.mako")
def contact_form(request):

    f = ContactForm(request.POST)   # empty form initializes if not a POST request

    if 'POST' == request.method and 'form.submitted' in request.params:
        if f.validate():
            #TODO: Do email sending here.

            request.session.flash("Your message has been sent!")
            return HTTPFound(location=request.route_url('home'))

    return {'contact_form': f}
