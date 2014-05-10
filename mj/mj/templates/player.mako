<%inherit file="base.mako"/>

<%def name="title()">Video player working with pyck and mako</%def>

  <!-- Chang URLs to wherever Video.js files will be hosted -->
  <link href="${request.static_url('mj:static/playerfiles/video-js.css')}" rel="stylesheet" type="text/css">

<%def name="javascript()">

  <!-- video.js must be in the <head> for older IEs to work. -->
  <script> src="video.js"</script>

  <!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->
  <script>
    videojs.options.flash.swf = "video-js.swf";
  </script>
<script>
videojs.Control = videojs.Component.extend();
videojs.Button = videojs.Control.extend();
//videojs.BigPlayButton/*videojs.PlayToggle */= videojs.Button.extend();

videojs.PlayToggle = videojs.Button.extend();
videojs.PlayToggle.off();

function time ()
{
  var player = videojs("example_video_1");
  //player.currentTime(300);
  //player.play();
  var lengthOfVideo=player.duration();  
  //var lengthOfVideo=player.duration();
  document.getElementById("demo").innerHTML= lengthOfVideo;
  var timep= player.currentTime();
  document.getElementById("democ").innerHTML= timep;
    //myVar=setInterval(function(){ctime()},1000);
  //myVar=setInterval(function(){ctime(lengthOfVideo)},1000);  
  //ctime(lengthOfVideo);

}

</script>
</%def>

  <video id="example_video_1" class="video-js vjs-default-skin" controls=false preload="auto" width="640" height="264"
      poster="http://video-js.zencoder.com/oceans-clip.png"
      data-setup="{}">
    <source src="http://video-js.zencoder.com/oceans-clip.mp4" type='video/mp4' />
    <source src="http://video-js.zencoder.com/oceans-clip.webm" type='video/webm' />
    <source src="http://video-js.zencoder.com/oceans-clip.ogv" type='video/ogg' />
    <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
    <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
  </video>
</br></br></br></br></br>
<button type = "button" onclick = " time() ">Show another page</button></br></br>
<p id="demo" color = white ></p></br></br></br></br>
<p id="democ"  color = white></p>