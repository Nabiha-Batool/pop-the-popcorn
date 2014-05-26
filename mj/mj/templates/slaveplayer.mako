<%inherit file="base.mako"/>

<%def name="javascript()">

<script>

window.onload = function() {

  // Video
  var video = document.getElementById("video");
  //video.controls=false;
  /**/
  
  window.setTimeout(update_position, 1000);
}

function update_position(){
  
  require(["dojo/request"], function(request){
    request("/get_position/${movie_name}", { handleAs: "json"}).then(
        function(data){
            // nothing to do here
            console.log(data);
            var pos = parseInt(data['position']);
	    //if(video.playing){
		//video.;
	    //}
            if (pos < 1 || video.playing) {
                document.getElementById("vpos").innerHTML = "Video not playing yet";
                video.pause();
		video.currentTime = 0;
                
            }
	    else if (pos == Math.floor(video.currentTime) || pos == Math.ceil(video.duration) ) {
		video.pause();
	    }
	    else{
                if (video.paused) {
                    video.play();
                }
                // if current time difference from master is less than 3 seconds, don't change it
                if (Math.abs(video.currentTime - pos) > 3) {
                    video.currentTime = pos;
                }
                
                document.getElementById("vpos").innerHTML = pos;
            }
            
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
				</div>
			
