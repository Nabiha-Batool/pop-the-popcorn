<%inherit file="base.mako"/>
<%def name="title()">User home - Movie Junction</%def>


<%def name="main_menu()">				
<div class="row-2">
					<ul>
						<li><a href="${request.route_url('home')}" class="active">Home</a></li>
						<li><a href="${request.route_url('joingroup')}">Join Group</a></li>
						<li><a href="${request.route_url('upload')}" rel="#overlay" style="text-decoration:none"> Upload Movie </a></li>
						<li><a href="${request.route_url('signout')}">SignOut</a></li>
						
					</ul>
				</div>
<!-- overlayed element -->
<div class="apple_overlay" id="overlay" style="background-image:url(/static/images/upload.jpg);height:650px;">
  <!--the external content is loaded inside this tag --> 
  <div class="contentWrap"></div>
</div>
</%def>
<body id="page1">
<!-- CONTENT -->
			<div id="content">
				<div class="line-hor"></div>
                    <div class="box">
                        <div class="border-right">
                            <div class="border-left">
                              <div class="inner">
                                    <h3>${username}'s <span>Home</span></h3>
                                    <p>&nbsp;								 </p>
                                    <ul class="movies" style="margin:70px">
%if user_movie is None:


%else:
<p> 
<li>

%for movie in user_movie:
      
    <li> <p>&nbsp;<h4>${movie.movie_name}&nbsp;&nbsp;&nbsp;</h4>				&nbsp;&nbsp;&nbsp;<img src="${request.static_url('mj:static/images/1page-img2.jpg')}" alt="" width="286" height="190" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div class="wrapper"><a href="${request.route_url('invite',movie_name=movie.movie_name)}" rel="#overlay" style="text-decoration:none" class="link2"><span><span>Invite</span></span></a></div>

%endfor

</p></li>
%if page == 1 and page == next:

%elif page == next: 
<a href="${request.route_url('userhome',page= next-1)}">Previous page</a>
%elif page == 1:
<a href="${request.route_url('userhome',page= page+ 1)}">Next page</a>
%else:
<a href="${request.route_url('userhome',page= page- 1)}">Previous page</a>
<a href="${request.route_url('userhome',page= page+ 1)}">Next page</a>
%endif                                   

</li></p>
%endif
</br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>

</body>