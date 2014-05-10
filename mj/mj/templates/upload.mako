
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="${request.static_url('mj:static/jquery.validate.min.js')}" type="text/javascript"></script>
<script>
/**
  * Basic jQuery Validation Form Demo Code
  * Copyright Sam Deering 2012
  * Licence: http://www.jquery4u.com/license/
  */
(function($,W,D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
            //form validation rules
            $("#register-form").validate({
                rules: {
                    movie: {
                        required: true,
                        
                    },
                    password: {
                        required: true,
                        minlength: 5
                    },
                    
                },
                messages: {
                    
                    password: {
                        required: "Please provide a password",
                        minlength: "Your password must be at least 5 characters long"
                    },
                    email: "Please enter a valid email address",
                    
                },
                submitHandler: function(form) {
                    form.submit();
                }
            });
        }
    }

    //when the dom has loaded setup form validation rules
    $(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
    });

})(jQuery, window, document);
</script>
<h2 style="color:white">UpLoad Movie</h2>
<div style="margin:70px;">

<h3 style="color:white">Movie <span>Name : <input id="movie_name" type="text" /></span></h3>
<form id="register-form" novalidate="novalidate" enctype="multipart/form-data" action="${request.route_url('upload')}" method="POST">


    <div id="form-content">
        <fieldset>
            <div class="fieldgroup">
                                <h3 style="color:white">Mov<span>ie : 
                                    <input id="movie" name="movie" type="file" /></span></h3></div>
                  
<div class="fieldgroup">                                
<h3 style="color:white">Movie <span>Picture : 
                                    <input id="movie_img" name="movie_img" type="file" /></span></h3></div>
<div class="fieldgroup"></br>
              
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="Upload" type="submit" value="upload" style="width:100px;height50px" />
                          </div>
</form>
						
</div>
<script>
document.getElementById('movie').onchange =function ()
{
  var name=document.getElementById("movie").value;
  name= name.replace(/^.*[\\\/]/, '');
  document.getElementById("movie_name").value= name;
  

};
//*///player.play();*/

</script>
