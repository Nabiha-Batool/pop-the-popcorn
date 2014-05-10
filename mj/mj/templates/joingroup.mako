<%inherit file="base.mako"/>
<%def name="title()">Join Movie Group- Movie Junction</%def>
<body id="page2">
<%def name="main_menu()">
				<div class="row-2">
					<ul>
						<li>
%if request.session.get('logged_in', None):
<a href="${request.route_url('userhome')}">Home</a>
%else:
<a href="${request.route_url('home')}"> Home </a>
%endif
</li>
						<li><a href="${request.route_url('joingroup')}" class="active">Join Group</a></li>
						<li>
%if request.session.get('logged_in', None):
<a href="${request.route_url('signout')}"> Sign Out </a>
%else:
<a href="${request.route_url('signin')}" rel="#overlay" style="text-decoration:none"> Sign In </a>
%endif

</li>
						<li><a href="contact-us.html">Contacts</a></li>
						<li class="last"><a href="sitemap.html">Sitemap</a></li>
					</ul>
				</div>
<!-- overlayed element--> 
<div class="apple_overlay" id="overlay" style="background-image:url(static/images/banner-img.png);">
  <!-- the external content is loaded inside this tag--> 
  <div class="contentWrap"></div>
</div>
</%def>

<!-- CONTENT -->
			
				<div class="line-hor"></div>
				<div class="box" style="background:url(static/images/Untitled.png)">
					<div class="border-right">
					  <div class="border-left">
							<div class="inner">
								<h3>&nbsp;</h3>
                              <p>&nbsp;</p>
<form action="${request.route_url('joingroup')}" method="POST">
                              <div class="abcodebox" id="abcodebox">
                                <div class="relcodebox" id="relcodebox">
${joingroup.code(cols="17",rows="6",placeholder="Enter Movie Code")}
%for fieldName, errorMessages  in joingroup.errors.iteritems():

%for err in errorMessages:
<br />
<div class="errors" style="color:white;">    
&nbsp;&nbsp;&nbsp;${err}
</div>
%endfor

%endfor 
</div>
                              </div>
                              <p>&nbsp;</p>
                              <p>&nbsp;</p>
                              <p>&nbsp;</p>
                              <p>&nbsp;</p>
                              <div class="abbutton" id="abbutton">
                                <div class="relbutton" id="relbutton"><input name="submit" type="submit" value="submit" style="width:100px;height50px" /></div>
                              </div></form>
                              <p>&nbsp;</p>
                              <p>&nbsp;</p>
                              <p>&nbsp;</p>
                              <p>&nbsp;</p>
                              <p>&nbsp;</p>
                              <p>&nbsp;</p>
                              <p>&nbsp;</p>
					    </div>
						</div>
					</div>
				</div>
				<!--<div class="content">
				</div>-->
		  </div>

</body>