<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WLAS</title>
<link rel="stylesheet" href="css/validationEngine.jquery.css" type="text/css">
<style type="text/css">

#maindiv {
height: auto; /*if more info comes on the page, it will stretch down*/
width: 1000px;
margin: 0 auto; /*this will cause the div to be in the center*/

}

</style>
</head>
<body >
<div id="maindiv">
<div>
<img alt="WLAS" src="images/home.png" style="display: inline-block;"/>
<h1 style="font-family:sans-serif; color: #4c92ca; display: inline-block; width: 60%" align="center">  Web Legal Advice System</h1></div>
		<table id="mainTbl" style="width: 100%;" >
			<tr >
				<td align="center" style="border: 1px solid black"><a href="Home_NL.jsp" style="color: black;">HOME</a></td>
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
		
		<form action="ForgotPassword">
		<table style="margin-left: 30%; width: 50%;" >
			<tr align="center">
				<td><h3>FORGOT PASSWORD</h3></td>
			</tr>
			
			<tr>
			<td align="center">
			
			</td>
			</tr>
			
			<tr>
			<td>
			
			<br>
			Enter  User ID
			</td>
			<td>
			<input type="text" name="userId" id="userId">
			</td>
			</tr>
			<tr>
			<td>
			Enter E-mail ID 
			</td>
			<td>
			<input type="text" name="email" id="email">
			</td>
			</tr>
			<tr>
			<td></td>
				

			</tr>
			
			<tr >
			
			
			
			<td align="right" height="50px;">
			
			<a href="Login.jsp"><input type="button" value="BACK"></a>
			</td>
			<td align="center" height="50px;">
			
			<input type="submit" value="SUBMIT" >
			</td>
			
			</tr>
		</table>
</form>
	</div>
</body>
</html>