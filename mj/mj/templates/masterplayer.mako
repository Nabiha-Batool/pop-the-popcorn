<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Articles - Articles | Cinema - Free Website Template from Templates.com</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="Place your description here" />
<meta name="keywords" content="put, your, keyword, here" />
<meta name="author" content="Templates.com - website templates provider" />

<link rel="stylesheet" href="${request.static_url('mj:static/mjstyle.css')}" type="text/css" media="screen" charset="utf-8" />
<script src="${request.static_url('mj:static/js/jquery-1.4.2.min.js')}" type="text/javascript"></script>
<script src="${request.static_url('mj:static/js/cufon-yui.js')}" type="text/javascript"></script>
<script src="${request.static_url('mj:static/js/cufon-replace.js')}" type="text/javascript"></script>
<script src="${request.static_url('mj:static/js/Gill_Sans_400.font.js')}" type="text/javascript"></script>
<script src="${request.static_url('mj:static/js/script.js')}" type="text/javascript"></script>

<script>
window.onload = function() {

  // Video
  var video = /*videojs("video1");//*/document.getElementById("video");

  
  window.setTimeout(update_position, 1000);
}

function update_position(){
  timec=video.currentTime;
  document.getElementById("vpos").innerHTML = timec;
  require(["dojo/request"], function(request){
    request("/set_position/${movie_name}/" + parseInt(timec)).then(
        function(text){
            // nothing to do here
        },
        function(error){
            console.log("An error occurred: " + error);
        }
    );
  });
  window.setTimeout(update_position, 1000);
}

</script>

<!--[if lt IE 7]>
	<script type="text/javascript" src="js/ie_png.js"></script>
	<script type="text/javascript">
		 ie_png.fix('.png, .link1 span, .link1');
	</script>
	<link href="ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
</head>
<body id="page3">
<div class="tail-top">
	<div class="tail-bottom">
		<div id="main">
<!-- HEADER -->
			<div id="header">
				<div class="row-1">
					<div class="fleft"><img src="images/mjlogo.gif" alt="" width="250" height="100" /></div>
					<ul>
						<li><a href="index.html"><img src="images/icon1.gif" alt="" /></a></li>
						<li><a href="contact-us.html"><img src="images/icon2.gif" alt="" /></a></li>
						<li><a href="sitemap.html"><img src="images/icon3.gif" alt="" /></a></li>
					</ul>
				</div>
				<div class="row-2">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="about-us.html">About</a></li>
						<li><a href="articles.html" class="active">Articles</a></li>
						<li><a href="contact-us.html">Contacts</a></li>
						<li class="last"><a href="sitemap.html">Sitemap</a></li>
					</ul>
				</div>
			</div>
<!-- CONTENT -->
			<div id="content"><div class="ic">More Website Templates at TemplateMonster.com!</div>
				<div class="line-hor"></div>
				<!--<div class="box">
					<div class="border-right">
						<div class="border-left">
							<div class="inner">
								<h3>Our <span>Articles</span></h3>
								<p>Praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>
							</div>
						</div>
					</div>
				</div>-->
				<div class="content" style="background:url(/static/images/movietheater2.jpg)">
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				  <div class="playercontainer" id="playercontainer">
				    <div class="player" id="player"><video height="400" width="700" controls="controls">
  <source src="http://video-js.zencoder.com/oceans-clip.mp4" type='video/mp4'  />
  </video></div>
				  </div>
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				  <p>&nbsp;</p>
				</div>
			
<!-- FOOTER -->
			<div id="footer">
				<div class="left">
					<div class="right">
						<div class="inside">Copyright - Type in your name here<br />
							<a rel="nofollow" href="http://www.templatemonster.com/" class="new_window">Website template</a> designed by TemplateMonster.com<br />
							<a href="http://www.templates.com/product/3d-models/" class="new_window">3D Models</a> provided by Templates.com 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"> Cufon.now(); </script>
</body>
</html>