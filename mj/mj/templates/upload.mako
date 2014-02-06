<%inherit file="base.mako"/>


<table><tr><td><center>
<form enctype="multipart/form-data" action="${request.current_route_url()}" method="POST">
    
    Send this file: <input type="file" name="userfile"  /></br></br>
    
<input type="submit" value="UpLoad" name="form.submitted" />

</form></center></td></tr>
</table>
