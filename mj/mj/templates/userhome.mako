<%inherit file="base.mako"/>
<%def name="title()">User home - Movie Junction</%def>
<body id="page6">

<%def name="main_menu()">				
				<div class="row-2">
					<ul>
						<li><a href="${request.route_url('userhome')}" class="active">Home</a></li>
						<li><a href="${request.route_url('joingroup')}">Join Group</a></li>
						<li><a href="${request.route_url('upload')}" rel="#overlay" style="text-decoration:none">UpLoad Movie</a></li>
                        <li><a href="${request.route_url('signout')}">LogOut</a></li>
						<li class="last"><a href="sitemap.html" >Sitemap</a></li>
					</ul>
				</div>
			</div>
<!-- overlayed element -->
<div class="apple_overlay" id="overlay" style="background-image:url(static/images/upload.jpg);height:650px;">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>
</%def>
<!-- CONTENT -->
			<div id="content"><div class="ic">More Website Templates at TemplateMonster.com!</div>
				<div class="line-hor"></div>
                    <div class="box">
                        <div class="border-right">
                            <div class="border-left">
                              <div class="inner">
                                    <h3>${username}'s <span>Home</span></h3>
                                    <p>&nbsp;								 </p>
                                    <ul class="movies">
<p> 
<li>
%for movie in user_movie:
      
    <li> <p>&nbsp;${movie.movie_name}								 </p></li>
%endfor                                   
</li></p>
<li>
                                    <h4>Toy Story 3</h4>
              <img src="${request.static_url('mj:static/images/1page-img2.jpg')}" alt="" width="286" height="190" />
            <p>Check out Disney-Pixar's official Toy Story site, watch the <span>Toy Story 3</span> trailer, and meet new characters. Remember, no toy gets left behind!</p>
            <div class="wrapper"><a href="${request.route_url('invite')}" rel="#overlay" style="text-decoration:none" class="link2"><span><span>Invite</span></span></a></div>
          </li> 
            
            <li>
            <h4>Prince of Percia: Sands of Time</h4>
            <img src="${request.static_url('mj:static/images/1page-img3.jpg')}" alt="" />
            <p>A young fugitive prince and princess must stop a villain who unknowingly threatens to destroy the world with a special dagger.</p>
            
            <div class="wrapper"><a href="${request.route_url('invite')}" rel="#overlay" style="text-decoration:none" class="link2"><span><span>Invite</span></span></a></div>
          </li>
          <li class="last">
            <h4>The Twilight Saga: Eclipse</h4>
            <img src="${request.static_url('mj:static/images/1page-img4.jpg')}" alt="" width="286" height="190" />
            <p>As a string of mysterious killings grips Bella is forced to choose between her love for vampire Edward and her friendship with werewolf Jacob.</p>
            <div class="wrapper"><a href="${request.route_url('invite')}" rel="#overlay" style="text-decoration:none" class="link2"><span><span>Invite</span></span></a></div>
          </li>
<!-- overlayed element -->
<div class="apple_overlay" id="overlay" style="background-image:url(static/images/banner-img.png);">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>
          <li class="clear">&nbsp;</li>
      </ul>
                                </div>
                            </div>
                        

</body>