<%inherit file="base.mako"/>

<%def name="javascript()">

<script>
window.onload = function() {

  // Video
  var video = /*videojs("video1");//*/document.getElementById("video");

  
  window.setTimeout(update_position, 1000);
}

function update_position(){
  timec=video.currentTime;
  //document.getElementById("vpos").innerHTML = timec;
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
</%def>
<body id="page3">
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
				    <div class="player" id="player">
<video id="video" height="400" width="700" controls="controls">
  <source src="${request.static_url('mj:static/playerfiles/' + movie_name)}" type="video/mp4">
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


<!--<video id="video" class="video-js vjs-default-skin" controls preload="auto" width="640" height="264" >
  <source src="${request.static_url('mj:static/playerfiles/' + movie_name)}" type="video/mp4">
  Your browser does not support the video tag.
  <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
    <!--<track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 
</video>-->

<br />

<div>
    Video Position: <span id="vpos">0</span>
</div>
