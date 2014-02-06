<%inherit file="base.mako"/>

<%def name="header()">

<%def name="javascript()">
<script src=${request.static_url('chat:static/jquery-1.4.3.min.js')}" type="text/javascript"></script>
<script type="text/javascript">
<!--

/*function MM_closeBrWindow() { //v2.0
  window.close();
}

 $(document).ready(function ()
        {
            
            
                ShowDialog(true);
                e.preventDefault();
            

            $("#btnClose").click(function (e)
            {
                HideDialog();
                e.preventDefault();
            });

            $("#btnSubmit").click(function (e)
            {
                HideDialog();
                e.preventDefault();
            });
        });

        function ShowDialog(modal)
        {
            $("#overlay").show();
            $("#dialog").fadeIn(300);

            if (modal)
            {
                $("#overlay").unbind("click");
            }
            else
            {
                $("#overlay").click(function (e)
                {
                    HideDialog();
                });
            }
        }

        function HideDialog()
        {
            $("#overlay").hide();
            $("#dialog").fadeOut(300);
        }*/
</script>
</script>
</%def>
</%def>
<h1>Group invitation</h1>

<!--<div id="overlay" class="web_dialog_overlay"></div>
    
<div id="dialog" class="web_dialog"> -->

<div style="margin-left: 50px;" align= "center">

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

<tr><td></td><td></td><td></td><td><input type="submit" value="Sent" name="form.submitted" onclick ="MM_closeBrWindow()" /></td></tr>
</table>
</form></div></center>
