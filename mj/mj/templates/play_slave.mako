<%inherit file="base.mako"/>

<%def name="title()">Video player working with pyck and mako</%def>

<%def name="css()">
</center>
<link href="${request.static_url('mj:static/playerfiles/video-js.css')}" rel="stylesheet" type="text/css">
</center>
</%def>

<%def name="javascript()">
<script>
    videojs.options.flash.swf = "video-js.swf";
</script>
<script>
videojs.Control = videojs.Component.extend();
videojs.Button = videojs.Control.extend();
videojs.PlayToggle = videojs.Button.extend();
videojs.PlayToggle.off();
</script>
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
                
            }else{
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


<video id="video" class="video-js vjs-default-skin" controls preload="auto" width="640" height="264" poster="http://video-js.zencoder.com/oceans-clip.png"
      data-setup="{}">
  <source src="${request.static_url('mj:static/playerfiles/' + movie_name)}" type="video/mp4">
  Your browser does not support the video tag.
  <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
    <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
</video>

<br />

<div>
    Video Position: <span id="vpos">0</span>
</div>
<br />
<input type="text" id="ct" />
<button type="button" Value="" onclick="video.currentTime=parseInt(document.getElementById('ct').value);">Set Current Time</button>
