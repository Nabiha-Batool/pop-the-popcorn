<%inherit file="base.mako"/>

<%def name="title()">Video player working with pyck and mako</%def>

<%def name="css()">
</center>
<link href="${request.static_url('mj:static/playerfiles/video-js.css')}" rel="stylesheet" type="text/css">
</center>
</%def>

<%def name="javascript()">

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
