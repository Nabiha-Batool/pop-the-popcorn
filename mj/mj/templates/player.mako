<%inherit file="base.mako"/>

<%def name="title()">Video player working with pyck and mako</%def>

<%def name="css()">
</center>
<link href="${request.static_url('mj:static/playerfiles/video-js.css')}" rel="stylesheet" type="text/css">
</center>
</%def>


<%def name="javascript()">
<center>
<script src="${request.static_url('mj:static/playerfiles/video.js')}"></script>
  <!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->
  <script>
    // get
    var whereYouAt = myPlayer.currentTime();

    videojs.options.flash.swf = "${request.static_url('mj:static/playerfiles/sample.swf')}";
  </script>
</center>
</%def>


  <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="640" height="264"
      
      data-setup="{}">
    <source src="${movie_play}" type='video/mp4' />
    
    <!--
    <source src="http://video-js.zencoder.com/oceans-clip.webm" type='video/webm' />
    <source src="http://video-js.zencoder.com/oceans-clip.ogv" type='video/ogg' />-->
    <track kind="captions" src="demo.captions.vtt" srclang="en" label="English" />
  </video>
