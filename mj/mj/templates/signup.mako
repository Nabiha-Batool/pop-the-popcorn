<%inherit file="base.mako"/>

<div style="margin-left: 50px;" align= "center">
<h1>Sign up</h1>
</div>
<div style="margin-left: 50px;" align= "center">
<form method="POST">
    
    ${i.as_table(labels="top", errors="right")|n}
</div>&nbsp;&nbsp;
                              
         Password</br>
<div style="margin-left: 50px;" align= "center">
<input type="password" name="password"  />
    <br /><br />
    <input type="submit" value=" Submit" />
</form>
</div>

