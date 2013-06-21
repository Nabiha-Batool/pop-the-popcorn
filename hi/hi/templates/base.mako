<!DOCTYPE html>
<html>
<head>
  
  <title>${self.title()}</title>
  ${self.meta()}
  
  <link rel="shortcut icon" href="${request.static_url('hi:static/favicon.ico')}" />
  <link rel="stylesheet" href="${request.static_url('hi:static/pylons.css')}" type="text/css" media="screen" charset="utf-8" />
  <link rel="stylesheet" href="http://static.pylonsproject.org/fonts/nobile/stylesheet.css" media="screen" />
  <link rel="stylesheet" href="http://static.pylonsproject.org/fonts/neuton/stylesheet.css" media="screen" />
  <!--[if lte IE 6]>
  <link rel="stylesheet" href="${request.static_url('hi:static/ie6.css')}" type="text/css" media="screen" charset="utf-8" />
  <![endif]-->
</head>

<body class="${self.body_class()}" ${self.body_attrs()}>
  <div id="wrap">
  ${self.header()}
  ${self.main_menu()}
  ${self.content_wrapper()}
  ${self.footer()}
  </div>
</body>
</html>

<%def name="title()">The PyCK Web Application Development Framework</%def>

<%def name="meta()">
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <meta name="keywords" content="python web application" />
  <meta name="description" content="PyCK web application" />
</%def>

<%def name="body_class()">
</%def>
<%def name="body_attrs()">
</%def>
<%def name="header()">
  <div id="top-small"><img src="${request.static_url('hi:static/pyck-small.png')}"  alt="pyck"/></div>
</%def>
  
<%def name="content_wrapper()">
  <div id="content">
    <div class="flash">
      <% flash_msgs = request.session.pop_flash() %>
      
      %for flash_msg in flash_msgs:
        ${flash_msg}<br />
      %endfor
    </div>
  ${self.body()}
  </div>
</%def>
    
<%def name="main_menu()">
<p>
  <a href="${request.route_url('home')}">Home</a> |
  <a href="${request.route_url('myapp.home')}">A sample App</a> |
  <a href="${request.route_url('contact')}">Contact Us</a>
</p>
</%def>
<%def name="footer()">
  <div id="footer">
    <div class="footer">&copy; Copyright 2008-2012, Set your company name here</div>
  </div>
</%def>

