<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>WLAS</title>

<script src="js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="js/jquery.validationEngine-en.js" type="text/javascript"></script>
<script src="js/jquery.validationEngine.js" type="text/javascript"></script>

<link rel="stylesheet" href="css/validationEngine.jquery.css" type="text/css">

<style type="text/css">

#maindiv {
height: auto; /*if more info comes on the page, it will stretch down*/
width: 1000px;
margin: 0 auto; /*this will cause the div to be in the center*/

}

</style>

<script type="text/javascript">

$(document).ready(function(){
	 
	
	 $("#loginform").validationEngine({showOneMessage: true});
	 
});


</script>

</head>
<body >
<div id="maindiv">
<div>
<img alt="WLAS" src="images/home.png" style="display: inline-block;"/>
<h1 style="font-family:sans-serif; color: #4c92ca; display: inline-block; width: 60%" align="center">Web Legal Advice System</h1></div>
		<table id="mainTbl" style="width: 100%;" >
			<tr >
				<td align="center" style="border: 1px solid black"><a href="#" style="color: black;">HOME</a></td>
				<td align="center" style="border: 1px solid black"><div class="dropdown"><a href="#" style="color: black;">LOGIN &#x25BC;</a>
				<div class="dropdown-content">
				    <a href="Login.jsp?tr=ATTORNEY">Attorney Login</a>
				    <a href="Login.jsp?tr=PLANTIFF">Plantiff Login</a>
				     <a href="Login.jsp?tr=ADMIN">Admin Login</a>
				  </div>
				</div>
				</td>
<td align="center" style="border: 1px solid black"><div class="dropdown"><a href="#" style="color: black;">REGISTER &#x25BC;</a>
				<div class="dropdown-content">
				    <a href="Register.jsp?role=2&tl=ATTORNEY">Attorney Registration</a>
				    <a href="Register.jsp?role=1&tl=PLANTIFF">Plantiff Registration</a>
				     <a href="Register.jsp?role=3&tl=ADMIN">Admin Registration</a>
				  </div>
				</div>
				</td>				<td align="center" style="border: 1px solid black"><a href="QueryRequest.jsp" style="color: black;">QUERY REQUEST</a></td>
				<td align="center" style="border: 1px solid black"><div class="dropdown"><a href="#" style="color: black;" class="dropbtn">REPORT &#x25BC; </a>
				  <!-- <button >Dropdown</button> -->
				  <div class="dropdown-content">
				    <a href="MA_nonLoggedIn.jsp">My Account</a>
				    <a href="MA_nonLoggedIn.jsp">Database Update</a>
				  </div>
				</div>
				</td>
				
				<td align="center" style="border: 1px solid black"><a href="#" style="color: black;">CONTACT US </a></td>
				<td align="center" style="border: 1px solid black"><a href="AboutUs.html" style="color: black;">ABOUT US</a></td>
			</tr>
		</table>
		
		<form action="LoginServlet" id="loginform" >	
		<table style="margin-left: 30%; width: 50%;" >
			<tr align="center">
				<td><h3>LOGIN</h3></td>
			</tr>
			<tr>
			<td colspan="2">
			
			</td>
			</tr>
			
			<tr>
			<td>
			Please enter Unique Password *
			</td>
			<td>
			<input type="password" class="validate[required]" name="pwd">
			</td>
			</tr>
			<tr>
			<td></td>
				<td><input type="hidden" name ="action" value ="dbuser"></td>


			</tr>
			
			<tr >
			<td></td>
			<td align="left" height="50px;">
			
			<input type="submit" value="LOGIN" >
			</td>
			
			</tr>
		</table>
		</form>
	</div>

</body>
</html>