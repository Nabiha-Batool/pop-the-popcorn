from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound
import smtplib
from smtplib         import SMTP_SSL
from getpass         import getpass
import os, re
import subprocess
import uuid
from ..models import (
    DBSession,
    )
from pyck.forms import model_form
from ..models import *

from ..forms import ContactForm,SignupForm,JoingroupForm,InviteForm,SigninForm



@view_config(route_name='home', renderer='index.mako')
def my_view(request):
    f = SignupForm(request.POST)
           
    if 'POST' == request.method and 'form.submitted' in request.params:
        if f.validate():
            I = Info()
            I.password = request.POST['password']
            I.first_name = request.POST['first_name']
            I.last_name = request.POST['last_name']
            user = DBSession.query(Info).filter_by(email=request.POST['email']).first()
            if not user:
                I.email = request.POST['email']
            else:
                return{'msg':"email id already exists!",'signup_form': f}
            DBSession.add(I)
        
            request.session['logged_in'] = True
            request.session['user_name'] = I.first_name
            request.session ['user_email'] = I.email
            request.session.flash("Sign up Successfully!")
            return HTTPFound(location=request.route_url('userhome',page=1))
    
    
    return {'signup_form': f}

@view_config(route_name='player', renderer='player.mako')
def player(request):
    
    movie_name = request.matchdict['movie_name']
    movie_url= 'mj:static/playerfiles/'+ movie_name
    #movie_url = 
    return {'movie_play':request.static_url(movie_url)}

@view_config(route_name='upload', renderer='upload.mako')
def upload(request):
    
    if 'POST' == request.method:
        user = DBSession.query(Info).filter_by(email=request.session['user_email']).first()
        movie = Movies()
        
        fname = request.POST['movie'].filename
        fname = re.sub(r'[^\w.\w]', '_', fname)
        input_file = request.POST['movie'].file
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
        if(fileExtension!= '.mp4'):
            # Use os.fchdir() method to change the dir
            #ch=os.open(os.getcwd()+'/mj/static/playerfiles/',os.O_RDONLY)
            #os.fchdir(ch)
            os.system('ffmpeg -i '+path+ fname +' -codec:v libx264 -profile:v high -b:v 500k -maxrate 500k -bufsize 1000k -vf scale=-1:480 -threads 0 -codec:a libfdk_aac -b:a 128k '+path+ fileName +'.mp4')
        movie.user_id = user.id #request.session['user_name']
        movie.movie_name = fileName +'.mp4'
        movie.movie_path = temp_file_path
        
        DBSession.add(movie)
        request.session.flash("Uploading ComPleteD :)!")
        return HTTPFound(location=request.route_url('userhome',page=1))
    return {}

@view_config(route_name='invite', renderer='invite.mako')
def invite(request):
    f = InviteForm(request.POST)
    movie=request.matchdict['movie_name']
    if 'POST' == request.method and 'form.submitted' in request.params:
        if request.session.get('logged_in', None):
            
            to = request.POST['email']
            me = ('moviex.junction@gmail.com')
            code = request.POST['code']
            g = Groups()
            g.code = code
            g.movie_name = movie
            g.movie_member = 0
            DBSession.add(g)
            msg = str (request.session['user_name'])+ " is inviting you to watch "+movie+" on date_user at time_user " + str(code)
            msg = 'Subject: Movie Invitation \n\n%s' % (msg)
            password= 'movies.junction'
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
        
    return {'invite_form':f,'user_name':request.session['user_name'],'movie_name':movie}

@view_config(route_name='signup', renderer='json')
def signup_form(request):
    
    ##i = InfoForm(request.POST)
    #InfoModelForm = model_form(Info, DBSession, exclude=['id','password','code','movies'])
    f = SignupForm(request.POST)
           
    if 'POST' == request.method and 'form.submitted' in request.params:
        if f.validate():
            I = Info()
            I.password = request.POST['password']
            I.first_name = request.POST['first_name']
            I.last_name = request.POST['last_name']
            
            DBSession.add(I)
        
            request.session['logged_in'] = True
            request.session['user_name'] = I.first_name
        
            request.session.flash("Sign up Successfully!")
            return HTTPFound(location=request.route_url('userhome', page=1))
    
    
    return {'signup_form': f}

@view_config(route_name='joingroup', renderer="joingroup.mako")
def joingroup(request):
   
    f = JoingroupForm(request.POST)
           
    if 'POST' == request.method and 'form.submitted' in request.params:
        if f.validate():
            movie = DBSession.query(Groups).filter_by(code=request.POST['code']).first()
            if movie is None:
                    request.session.flash("invalid group CODE!")
                    return HTTPFound(location=request.route_url('joingroup'))
            else:    
                #movie_member=movie.movie_member
                if movie.movie_member == 0:#is None:
                    movie.movie_member = movie.movie_member + 1
                    #movie.movie_member= 0
                    return HTTPFound(location=request.route_url('play_master',movie_name=movie.movie_name))
                else:
                    movie.movie_member = movie.movie_member + 1
                    return HTTPFound(location=request.route_url('play_slave',movie_name=movie.movie_name))
    
    return {'joingroup':f}

@view_config(route_name='signin', renderer='sign-in.mako')
def signin(request):
    f = SigninForm(request.POST)
    if 'POST' == request.method and 'form.submitted' in request.params:
        #if f.validate():
            user = DBSession.query(Info).filter_by(email=request.POST['email'],password=request.POST['password']).first()
            if (user is None):
                request.session.flash("invalid email id or password!")
                return{'msg':"invalid email id or password!"}
            else:
                request.session['logged_in'] = True
                request.session ['user_name'] = user.first_name
                request.session ['user_email'] = user.email
                return HTTPFound(location=request.route_url('userhome',page=1))
            
    return{'signin_form':f}

@view_config(route_name='userhome', renderer='userhome.mako')
def userhome(request):
    if request.session.get('logged_in', None) :
        name = request.session['user_name']
        user = DBSession.query(Info).filter_by(email=request.session['user_email']).first()
        total_movie = DBSession.query(Movies).filter_by(user_id=user.id).count()
        
        page=request.matchdict['page']
        page=int(page)
        start = ((page - 1) * 4)
        end = (start + 4)
        temp=end-1
        user_movie = DBSession.query(Movies).filter_by(user_id=user.id)[start:end]
        if total_movie == end:
            temp=end-1
            last = DBSession.query(Movies).filter_by(user_id=user.id)[temp]
        elif total_movie == start:
            return{'user_movie':user_movie,'next':page,'page':page,'username':name}
        else:
            for i in range(1,5):
                end1=end-i
                if total_movie == end1:
                    temp=end1-1
            last = DBSession.query(Movies).filter_by(user_id=user.id)[temp]
        
        
        last_rec = DBSession.query(Movies).filter_by(user_id=user.id)[-1]
        if last.id==last_rec.id:
            return{'user_movie':user_movie,'next':page,'page':page,'username':name}
        else:
            return{'user_movie':user_movie,'next':page+1,'page':page,'username':name}
    
    else:
        return HTTPFound(location=request.route_url('home'))

@view_config(route_name='signout')
def signout(request):
    
    #request.session ['logged_in'] = False
    del request.session ['logged_in']
    #request.session ['user_name']= None
    del request.session ['user_name']
    return HTTPFound(location=request.route_url('home'))

    
    
    
@view_config(route_name='contact', renderer="contact.mako")
def contact_form(request):

    f = ContactForm(request.POST)   # empty form initializes if not a POST request

    if 'POST' == request.method and 'form.submitted' in request.params:
        if f.validate():
            #TODO: Do email sending here.
            to = 'nabiha_batool99@hotmail.com,great.nabiha@gmail.com'
            user_from = request.POST['email']
            me = ('moviex.junction@gmail.com')
            subject = request.POST['subject']
            msg = str (request.POST['message']+"\n\nFrom : "+user_from)
            msg = 'Subject: %s' % (subject) + ' \n\n%s' % (msg)
            password= 'movies.junction'
            # send it via gmail
            s = SMTP_SSL('smtp.gmail.com', 465)
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

    return {'contact_form': f}
