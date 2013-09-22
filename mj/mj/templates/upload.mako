<%inherit file="base.mako"/>

<%def name="header()">


<table><tr><td><center>
<form enctype="multipart/form-data" action="${request.current_route_url()}" method="POST">
    <!-- MAX_FILE_SIZE must precede the file input field -->
    <!--<input type="hidden" name="MAX_FILE_SIZE" value="30000" />-->
    <!-- Name of input element determines name in $_FILES array -->
    Send this file: <input name="userfile" type="file" />
    <input type="submit" value="Send File" name="form.submitted" />
</form></center></td></tr>
</table>
