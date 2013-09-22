<%inherit file="base.mako"/>

<%def name="title()">Video player working with pyck and mako</%def>

<%def name="css()">
<link href="${request.static_url('mj:static/playerfiles/video-js.css')}" rel="stylesheet" type="text/css">
</%def>

<br /><br /><br /><br /><br /><br /><br /><br />
<%def name="javascript()">
<center>
<div id="top" style="text-align">
    <br /><br />
<script src="${request.static_url('mj:static/playerfiles/video.js')}"></script>
  <!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->
  <script>
    videojs.options.flash.swf = "${request.static_url('mj:static/playerfiles/video-js.swf')}";
  </script>
</div>
</center>
</%def>


  <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="640" height="264"
      poster="http://video-js.zencoder.com/oceans-clip.png"
      data-setup="{}">
    <source src="http://video-js.zencoder.com/oceans-clip.mp4" type='video/mp4' />
    <source src="http://video-js.zencoder.com/oceans-clip.webm" type='video/webm' />
    <source src="http://video-js.zencoder.com/oceans-clip.ogv" type='video/ogg' />
    <track kind="captions" src="demo.captions.vtt" srclang="en" label="English" />
  </video>
