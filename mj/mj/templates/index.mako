<%inherit file="base.mako"/>
<%def name="title()">Home - Movie Junction</%def>
<body id="page1">
<!-- CONTENT -->
			<div id="content"><!--<div class="ic">More Website Templates at TemplateMonster.com!</div>-->
				<div id="slogan">
					<div class="image png"></div>
					<div class="inside">
					  <h2>We are breaking<span>All Limitations</span></h2>
						<p>Enjoy your favourite movies with your friends and family from ur device :)</p>
						<div class="wrapper"><a href="#" class="link1"><span><span>Learn More</span></span></a></div>
					</div>
				</div>
				<div class="box">
					<div class="border-right">
						<div class="border-left">
							<div class="inner">
								<h3>&nbsp;&nbsp;&nbsp;Welcome </h3>
								<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to </h3>
								<h3><b>&nbsp;&nbsp;&nbsp;Movie</b> <span>Junction </span></h3>
								<div class="signup" id="signup">
								  <div class="innersignup" id="innersignup"><h3>Sign Up</h3>
%if msg:
<h4 style="color:red">${msg}</h4>
%endif
								    <div class="signupheader">
<form action="${request.current_route_url()}" method="POST">
${signup_form.as_p(labels="top", errors="bottom") | n }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Sent" name="form.submitted" style="width:100px;height50px;" align="right" /></form>
</div>
								  </div>
								</div>
</br></br></br></br></br></br>
</br></br></br></br></br></br>
</br></br></br></br></br></br>
</br></br></br></br></br></br>
</br></br></br></br></br></br>
</br></br></br></br></br></br>
							</div>
						</div>
					</div>
				</div>
			</div>	<!--<div class="content"></div>-->
			
</body>