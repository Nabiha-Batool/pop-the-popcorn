<%inherit file="base.mako"/>

<%def name="header()">
<link rel="stylesheet" href="${request.static_url('chat:static/overlay-apple.css')}" type="text/css" media="screen" charset="utf-8" />
<%def name="javascript()">

<script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>

<script type="text/javascript">
$(function() {
 
    // if the function argument is given to overlay,
    // it is assumed to be the onBeforeLoad event listener
    $("a[rel]").overlay({
 
        mask: 'grey',
        effect: 'apple',
 
        onBeforeLoad: function() {
 
            // grab wrapper element inside content
            var wrap = this.getOverlay().find(".contentWrap");
 
            // load the page specified in the trigger
            wrap.load(this.getTrigger().attr("href"));
        }
 
    });
});
</script>
</%def>
</%def>

<!-- external page is given in the href attribute (as it should be) -->
<a href="${request.route_url('invite')}" rel="#overlay" style="text-decoration:none">
  <!-- remember that you can use any element inside the trigger -->
  <button type="button">Show external page in overlay</button>
</a>
 
<!-- another link. uses the same overlay -->
<a href="${request.route_url('invite')}" rel="#overlay" style="text-decoration:none">
  <button type="button">Show another page</button>
</a>
 
<!-- overlayed element -->
<div class="apple_overlay" id="overlay">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>