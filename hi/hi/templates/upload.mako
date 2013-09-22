<%inherit file="base.mako"/>

<%def name="header()">


<table><tr><td><center>
<form enctype="multipart/form-data" action="${request.current_route_url()}" method="POST">
    
    Send this file: <input type="file" name="userfile"  />
    
<input type="submit" value="Send File" name="form.submitted" />

</form></center></td></tr>
</table>
