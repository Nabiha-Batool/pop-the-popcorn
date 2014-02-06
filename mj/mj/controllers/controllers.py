from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound
import os
import subprocess
import uuid
from ..models import (
    DBSession,
    )
from pyck.forms import model_form
from ..models import *

from ..forms import ContactForm



@view_config(route_name='home', renderer='moviegrid.mako')
def my_view(request):
    
    return {}

@view_config(route_name='player', renderer='player.mako')
def player(request):
    
    movie_name = request.matchdict['movie_name']
    movie_url= 'mj:static/playerfiles/'+ movie_name
    #movie_url = 
    return {'movie_play':request.static_url(movie_url)}

@view_config(route_name='upload', renderer='upload.mako')
def upload(request):
    
    if 'POST' == request.method:
        movie = Movies()
        
        fname = request.POST['userfile'].filename
        input_file = request.POST['userfile'].file
        path = os.getcwd()+'/mj/static/playerfiles/'
        file_path = os.path.join(path, fname +'' % uuid.uuid4())
        #file_path = 'static/playerfiles/' + fname
        temp_file_path = file_path + '~'
              
        output_file = open(temp_file_path, 'wb')
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
        fileName, fileExtension = os.path.splitext(fname)
        if(fileExtension!= '.webm'):
            # Use os.fchdir() method to change the dir
            #ch=os.open(os.getcwd()+'/mj/static/playerfiles/',os.O_RDONLY)
            #os.fchdir(ch)
            os.system('ffmpeg -i '+ path + fname +' -acodec copy -vcodec copy '+ path + fileName +'.mp4')
        movie.movie_name = fileName +'.mp4'
        movie.movie_path = temp_file_path
        
        DBSession.add(movie)
        request.session.flash("Uploading ComPleteD :)!")
        return HTTPFound(location=request.route_url('player',movie_name=fileName +'.mp4'))
    return {}

@view_config(route_name='invite', renderer='invite.mako')
def invite(request):
    '''if request.session['logged_in'] == True:'''
    if 'POST' == request.method:
            to = request.POST['to']
            me = ('moviex.junction@gmail.com')
            code = request.POST['code']
            I = Info()
            I.code = code
            msg = str (request.session['user_name'])+ " is inviting you to watch movie_name on date_user at time_user " + str(code)
            
            password= ('movies.junction')
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

@view_config(route_name='signup', renderer='signup.mako')
def signup(request):
    
    ##i = InfoForm(request.POST)
    InfoModelForm = model_form(Info, DBSession, exclude=['id','password','code','movies'])
    i = InfoModelForm(request.POST)
           
    if "POST" == request.method and i.validate():
        
        I = Info()
        I.password = request.POST['password']
        i.populate_obj(I)
        DBSession.add(I)
        
        request.session['logged_in'] = True
        request.session['user_name'] = I.first_name
        
        request.session.flash("Sign up Successfully!")
        return HTTPFound(location=request.route_url('home'))
    
    
    return {'i': i}

@view_config(route_name='joingroup', renderer="joingroup.mako")
def joingroup(request):
   
    if 'POST' == request.method:
        
        I = Info()
        I.code = request.POST['code']
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
