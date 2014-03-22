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
  
  require(["dojo/request"], function(request){
    request("/get_position/${movie_name}", { handleAs: "json"}).then(
        function(data){
            // nothing to do here
            console.log(data);
            var pos = parseInt(data['position']);
            if (pos < 1) {
                document.getElementById("vpos").innerHTML = "Video not playing yet";
                video.pause();
                
            }else{
                if (video.paused) {
                    video.play();
                }
                // if current time difference from master is less than 2 seconds, don't change it
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


<video id="video" width="640" height="365" controls preload="auto">
  <source src="${request.static_url('mj:static/playerfiles/' + movie_name)}" type="video/mp4">
  Your browser does not support the video tag.
</video>

<br />

<div>
    Video Position: <span id="vpos">0</span>
</div>
<br />
<input type="text" id="ct" />
<button type="button" Value="" onclick="video.currentTime=parseInt(document.getElementById('ct').value);">Set Current Time</button>
