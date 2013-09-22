from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound

from ..models import (
    DBSession,
    #Site,
    )

from ..forms import ContactForm
import os
import uuid


@view_config(route_name='home', renderer='player.mako')
def my_view(request):
    #one = DBSession.query(Site).filter(Site.name=='one').first()
    one=None
    return {'one':one, 'project':'hi'}


@view_config(route_name='player', renderer='player.mako')
def player(request):
    return {}

@view_config(route_name='upload', renderer='upload.mako')
def upload(request):
    filename = request.POST['userfile'].filename
    input_file = request.POST['userfile'].file
    file_path = os.path.join('hi:static/playerfiles/', '%s.swf' % uuid.uuid4())
    output_file = open(file_path, 'wb')
    input_file.seek(0)
    while True:
        data = input_file.read(2<<16)
        if not data:
            break
        output_file.write(data)

    # If your data is really critical you may want to force it to disk first
    # using output_file.flush(); os.fsync(output_file.fileno())

    output_file.close()

    # Now that we know the file has been fully saved to disk move it into place.

    os.rename(temp_file_path, file_path)
    
    return {}

@view_config(route_name='contact', renderer="contact.mako")
def contact_form(request):
    
    f = ContactForm(request.POST)   #empty form initializes if not a POST request
    
    if 'POST' == request.method and 'form.submitted' in request.params:
        if f.validate():
            #TODO: Do email sending here.
            
            request.session.flash("Your message has been sent!")
            return HTTPFound(location=request.route_url('home'))
    
    return {'contact_form': f}