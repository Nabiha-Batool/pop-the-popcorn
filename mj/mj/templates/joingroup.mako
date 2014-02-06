<%inherit file="base.mako"/>

<%def name="header()">

</%def>

<form action="${request.current_route_url()}" method="POST">
<table><tr><td>
         name:  </td><td>&nbsp;&nbsp;&nbsp;
              <input type="text" name="name"  /> <br /><br /></tr>
     
 <tr><td>code:</td><td>  &nbsp;&nbsp;&nbsp;
              <input type="text" name="code"  /> <br /><br /></td></tr>
  
  
<tr><td></td><td></td><td></td><td><input type="submit" value="Sent" name="form.submitted" onclick ="MM_closeBrWindow()" /></td></tr>
</table>
</form></div></center>