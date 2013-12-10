<%inherit file="base.mako"/>

<%def name="header()">

</%def>
<h1>Group invitation</h1>

<div style="margin-left: 50px;" align= "center">

<!--<div id="overlay" class="web_dialog_overlay"></div>
    
<div id="dialog" class="web_dialog"> -->



<form action="${request.current_route_url()}" method="POST">
<table><tr><td>
         To:  </td><td>&nbsp;&nbsp;&nbsp;
              <input type="text" name="to"  /> <br /><br /></tr>
     
 <tr><td>From:</td><td>  &nbsp;&nbsp;&nbsp;
              <input type="text" name="from"  /> <br /><br /></td></tr>
  
  
    <tr><td>Message: </td><td> &nbsp;&nbsp;&nbsp;
             User_name is inviting you to watch 
             <br />&nbsp;&nbsp;&nbsp;movie_name on date_user at time_user 
             <br />&nbsp;&nbsp;&nbsp;invitation code : <input type="text" name="code" maxlength="5" style="width:50px;"  /> <br /><br /></td></tr>

<tr><td></td><td></td><td></td><td><input type="submit" value="Sent" name="form.submitted" /></td></tr>
</table>
</form></div></center>
