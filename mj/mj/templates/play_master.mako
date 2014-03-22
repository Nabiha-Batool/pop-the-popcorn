<%inherit file="base.mako"/>

<%def name="title()">Video player working with pyck and mako</%def>


<%def name="javascript()">

<script>
window.onload = function() {

  // Video
  var video = document.getElementById("video");

  
  window.setTimeout(update_position, 1000);
}

function update_position(){
  document.getElementById("vpos").innerHTML = video.currentTime;
  require(["dojo/request"], function(request){
    request("/set_position/${movie_name}/" + parseInt(video.currentTime)).then(
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


<video id="video" width="640" height="365" controls>
  <source src="${request.static_url('mj:static/playerfiles/' + movie_name)}" type="video/mp4">
  Your browser does not support the video tag.
</video>

<br />

<div>
    Video Position: <span id="vpos">0</span>
</div>
