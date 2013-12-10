from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound
import smtplib
from smtplib         import SMTP_SSL
from getpass         import getpass

from ..models import (
    DBSession,
    )

from ..forms import ContactForm

@view_config(route_name='invihome', renderer='invihome.mako')
def my_view(request):
    one = None
    return {}

@view_config(route_name='home', renderer='invihome.mako')
def my_view(request):
    one = None
    return {'one': one, 'project': 'chat'}



@view_config(route_name='invite', renderer='invite.mako')
def upload(request):
    
    if 'POST' == request.method:
        to = request.POST['to']
        me = request.POST['from']
        code = request.POST['code']
        msg = "User_name is inviting you to watch movie_name on date_user at time_user " + str(code)
        
        password= getpass('Gmail password:')
        # send it via gmail
        s = SMTP_SSL('smtp.gmail.com', 465, timeout=10)
        #s = smtplib.SMTP('smtp.live.com', 25) #4 hotmail
        s.set_debuglevel(0)
        #s = smtplib.SMTP('localhost')
        try:
            s.login(me, password)
            s.sendmail(me, to.split(","), msg)
        finally:
            s.quit()
        request.session.flash("Your message has been sent!")
        return HTTPFound(location=request.route_url('home'))
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
