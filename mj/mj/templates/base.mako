<%!
from mj.auth import is_allowed
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  
  <title>${self.title()}</title>
  ${self.meta()}
  
  <link rel="shortcut icon" href="${request.static_url('mj:static/favicon.ico')}" />
  
  <!--<link rel="stylesheet" href="http://static.pylonsproject.org/fonts/nobile/stylesheet.css" media="screen" />
  <link rel="stylesheet" href="http://static.pylonsproject.org/fonts/neuton/stylesheet.css" media="screen" />-->
  <!--[if lte IE 6]>
  <link rel="stylesheet" href="${request.static_url('mj:static/ie6.css')}" type="text/css" media="screen" charset="utf-8" />
  <![endif]-->
  <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.8.3/dojo/resources/dojo.css" type="text/css" charset="utf-8" />
  <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.8.3/dijit//themes/claro/claro.css" type="text/css" charset="utf-8" />
  <script src="//ajax.googleapis.com/ajax/libs/dojo/1.8.3/dojo/dojo.js" data-dojo-config="isDebug: true, async: true, parseOnLoad: true"></script>
  <script type="text/javascript">
        require(['dojo/parser', 'dojo/domReady'],function(parser,ready){ready(function(){
          parser.parse();
          });});
  </script>
<link rel="stylesheet" href="${request.static_url('mj:static/main.css')}" type="text/css" media="screen" charset="utf-8" />

<script src="${request.static_url('mj:static/js/jquery-1.4.2.min.js')}" type="text/javascript"></script>
<script src="${request.static_url('mj:static/js/cufon-yui.js')}" type="text/javascript"></script>
<script src="${request.static_url('mj:static/js/cufon-replace.js')}" type="text/javascript"></script>
<script src="${request.static_url('mj:static/js/Gill_Sans_400.font.js')}" type="text/javascript"></script>
<script src="${request.static_url('mj:static/js/script.js')}" type="text/javascript"></script>
<!-- jquery overlay -->

<link rel="stylesheet" href="${request.static_url('mj:static/overlay-apple.css')}" type="text/css" media="screen" charset="utf-8" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script> 
<script>
$(function() {
 
    // if the function argument is given to overlay,
    // it is assumed to be the onBeforeLoad event listener
    $("a[rel=#overlay]").overlay({
 
        mask: '#3B0B0B',
        effect: 'apple',
	closeOnClick: false,
 
        onBeforeLoad: function() {
 
            // grab wrapper element inside content
            var wrap = this.getOverlay().find(".contentWrap");
 
            // load the page specified in the trigger
            wrap.load(this.getTrigger().attr("href"));
        }
 
    });
});
</script>
  ${self.javascript()}
</head>

<body class="${self.body_class()}" ${self.body_attrs()}>
  
  ${self.header()}
  <!-- overlayed element --> 
<div class="apple_overlay" id="overlay" style="background-image:url(/static/images/banner-img.png);">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>
  ${self.content_wrapper()}
  ${self.footer()}
  <script type="text/javascript"> 
Cufon.now();
</script>
</body>
</html>

<%def name="title()">Movie Junction</%def>

<%def name="meta()">
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <meta name="keywords" content="MJ" />
  <meta name="description" content="Movie Junction" />
  <meta name="viewport" content="width=device-width">
</%def>

<%def name="javascript()">
</%def>

<%def name="body_class()">
</%def>
<%def name="body_attrs()">
</%def>
<%def name="header()">
  <div class="tail-top">
	<div class="tail-bottom">
		<div id="main">
<!-- HEADER -->
			<div id="header">
  <div class="row-1">
					<div class="fleft"><img src="${request.static_url('mj:static/images/mjlogo.gif')}" alt="" width="250" height="100" /></div>
					
				</div>
${self.main_menu()}
</div></div></div></div>
</%def>
  
<%def name="content_wrapper()">
  <div class="tail-top">
	<div class="tail-bottom">
		<div id="main">
  <div id="content">
    <div class="flash">
      
      <% flash_msgs = request.session.pop_flash() %>
      
      %for flash_msg in flash_msgs:
        <br /><br /><br />${flash_msg}<br />
      %endfor
    </div>
  ${self.body()}
  </div>
</div></div></div>
</%def>
    
<%def name="main_menu()">

<div class="row-2">
					<ul>
						<li><a href="${request.route_url('home')}" class="active">Home</a></li>
						<li><a href="${request.route_url('joingroup')}">Join Group</a></li>
						<li><a href="${request.route_url('signin')}" rel="#overlay" style="text-decoration:none"> Sign In </a></li>
						<li><a href="${request.route_url('contact')}">Contacts</a></li>
						
					</ul>
				</div>



<!--<p align="center">
  
  <a href="${request.route_url('home')}">Home</a> |
  <a href="${request.route_url('contact')}">Contact Us</a> |
  <a href="${request.route_url('upload')}">Upload File</a> |
  
  <a href="${request.route_url('signup')}">SignUp</a> |
%if is_allowed(request, 'pyckauth_manager'):
  <a href="${request.route_url('pyckauth_manager')}">Auth Manager</a> |
  %endif
  
  %if is_allowed(request, 'admin.admin_index'):
  <a href="${request.route_url('admin.admin_index')}">Admin Section</a> |
  %endif
  
  %if request.session.get('logged_in_user', None):
  <a href="${request.route_url('pyckauth_logout')}">Logout</a>
  %else:
  <a href="${request.route_url('pyckauth_login')}">Login</a>
  %endif
  
</p>-->
</%def>
<%def name="footer()">
  <!-- FOOTER -->
<div class="tail-top">
	<div class="tail-bottom">
		<div id="main">
			<div id="footer">
				<div class="left">
					<div class="right">
						<div class="inside">Copyright - Movie Junction<br />
							<a rel="nofollow" href="http://www.templatemonster.com/" class="new_window">Website template</a> designed by TemplateMonster.com<br />
							<a href="http://www.templates.com/product/3d-models/" class="new_window">3D Models</a> provided by Templates.com 
						</div>
					</div>
				</div>
			</div>

</div></div>
</div>
</%def>

