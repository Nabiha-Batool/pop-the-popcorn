<%inherit file="base.mako"/>

<%def name="title()">
PyCK Web Development Framework
</%def>

<%def name="header()">
  <div id="top" style="text-align: center">
    <br /><br />
    <img src="${request.static_url('chat:static/pyck-admin.png')}"  alt="pyck"/>
    <link rel="stylesheet" href="${request.static_url('chat:static/overlay-apple.css')}" type="text/css" media="screen" charset="utf-8" />
    
  </div>


<%def name="javascript()">

<script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>

<script>
$(function() {
 
    // if the function argument is given to overlay,
    // it is assumed to be the onBeforeLoad event listener
    $("a[rel]").overlay({
 
        mask: 'darkred',
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
<script type="text/javascript">

function MM_openBrWindow() { //v2.0
  window.open("${request.route_url('invite')}","Invite Group","width=500,height=200");
}


</script>
  ${self.main_menu()}
</%def></%def>
    
    <div>
      <div class="middle align-center">
        <p class="app-welcome">
          Welcome to <span class="app-name">${project}</span>, an application generated by<br/>
          the PyCK web application development framework.

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




          <input type="button" value = "Click Me!" onClick='javascript:window.open("${request.route_url('invite')}","Invite Group","width=500,height=200");'/>
          

        </p>
      </div>
    </div>
    <div id="bottom">
      <div class="bottom">
        <div id="left" class="align-right">
          <h2>Search documentation</h2>
          <form class="search" action="http://pythonhosted.org/PyCK/search.html" method="get">
            <input type="text" name="q" />
            <input type="submit" value="Go" />
            <input type="hidden" name="check_keywords" value="yes" />
            <input type="hidden" name="area" value="default" />
          </form>
        </div>
        <div id="right" class="align-left">
          <h2>PyCK links</h2>
          <ul class="links">
            <li>
              <a href="http://pyck.compulife.com.pk">PyCK Website</a>
            </li>
            <li>
              <a href="http://packages.python.org/PyCK/">Documentation</a>
            </li>
            <li>
              <a href="http://pypi.python.org/pypi/PyCK">PyCK at PyPi</a>
            </li>
            <li>
              <a href="irc://irc.freenode.net#pyck">IRC Channel</a>
            </li>
            </ul>
        </div>
      </div>
    </div>