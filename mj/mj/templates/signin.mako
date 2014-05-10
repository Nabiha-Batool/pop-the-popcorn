<!--<%inherit file="base.mako"/>-->
<%def name="title()">SignIn - Movie Junction</%def>

<%def name="header()"></%def>				
<%def name="footer()"></%def>

<body id="page1">
<form action="${request.route_url('signin')}" method="POST">
<div class="apple_overlay" id="facebox" style="background-image:url(static/images/banner-img.png);">
<div class="contentWrap" >

<h3>User <span>Name : </span>

<input name="user_name" type="text" value="user_name" /></h3>
							  <p>&nbsp;</p>
<h3>Pass<span>word : <input name="password" type="password" value="password" /></span></h3>
<p><input name="SignIn" type="submit" value="signin" style="width:100px;height50px" />&nbsp;</p>

</div>
</div>
</form>
<script>
$(function() {
  

    // select the overlay element - and "make it an overlay"
  $("#facebox").overlay({

    // custom top position
    //top: 260,

    // some mask tweaks suitable for facebox-looking dialogs
    mask: {

    // you might also consider a "transparent" color for the mask
    color: 'darkred',

    // load mask a little faster
    loadSpeed: 200,

    // very transparent
    opacity: 0.5
    },
    effect: 'apple',
    // disable this for modal dialog-type of overlays
    closeOnClick: false,

    // load it immediately after the construction
    load: true

    });
    });
</script>
</body>