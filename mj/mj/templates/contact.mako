<%inherit file="base.mako"/>
<%def name="title()">Contact Us - Movie Junction</%def>
<%def name="main_menu()">

<div class="row-2">
					<ul>
						<li><a href="${request.route_url('home')}">Home</a></li>
						<li><a href="${request.route_url('joingroup')}">Join Group</a></li>
						<li><a href="${request.route_url('signin')}" rel="#overlay" style="text-decoration:none"> Sign In </a></li>
						<li><a href="${request.route_url('contact')}" class="active">Contacts</a></li>
						
					</ul>
				</div>
</%def>
<body id="page1">
<!-- CONTENT -->
			<div id="content"><div class="ic">More Website Templates at TemplateMonster.com!</div>
				<div class="line-hor"></div>
				<div class="box">
					<div class="border-right">
						<div class="border-left">
							<div class="inner">
								<h3>Our <span>Contacts</span></h3>
								<div class="address">
									<div class="fleft"><span>Zip Code:</span>50122<br />
										<span>Country:</span>USA<br />
										<span>Telephone:</span>+354 5635600<br />
										<span>Fax:</span>+354 5635610</div>
									<div class="extra-wrap"><span>Miscellaneous info:</span><br />
										Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="content">
					<h3>Contact <span>Form</span></h3>
					<form action="${request.current_route_url()}" method="POST">
${contact_form.as_p(labels="top", errors="bottom") | n }
						<div class="wrapper">
							<input type="submit" value="Sent" name="form.submitted" style="width:100px;height50px;" align="right" />	
								<span>
									<span>Send Your Message</span>
								</span>
							</a>
						</div>
						</fieldset>
					</form>
				</div>
			</div>

</body>
