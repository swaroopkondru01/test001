<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WLAS - Register</title>


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
	 
	

	
	 $("#registerForm").validationEngine({showOneMessage: true});
	
});

</script>
</head>
<body >
<div id="maindiv">
<div>
<img alt="WLAS" src="images/home.png" style="display: inline-block;"/>
<h1 style="font-family:sans-serif; color: #4c92ca; display: inline-block; width: 60%" align="center">  Web Legal Advice System</h1></div>
		<table id="mainTbl" style="width: 100%;">
		
		
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
				<td align="center" style="border: 1px solid black"><a href="Contact.html" style="color: black;">CONTACT US </a></td>
				<td align="center" style="border: 1px solid black"><a href="AboutUs.html" style="color: black;">ABOUT US</a></td>
			</tr>
		</table>
		<form action="RegisterServlet" method="post" id="registerForm">
		<table style="width: 100%;" >
			<tr align="center">
				<td><h3><%=request.getParameter("tl")%> REGISTRATION PAGE</h3></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstName" class="validate[required]"></td>
				<td>Password</td>
				<td><input type="password" name="pwd" class="validate[required]" id="pwd"></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastName" class="validate[required]"></td>
				<td>Confirm Password</td>
				<td><input type="password" name="confirmPassword" class="validate[required,equals[pwd]]"></td>
			</tr>
			
			<tr>
			
			<td>User ID</td>
				<td><input type="text" name="userId" class="validate[required]"></td>
				
				<td hidden="hidden">Role</td>
				<td><input type= "hidden" name ="role" value=<%=request.getParameter("role")%>></td>
				
			</tr>
			<tr>
				<td>Phone Number</td>
				<td><input type="text" name="phone" class="validate[required]"></td>
				<td>Confirm Email ID</td>
				<td><input type="text" name="confirmEmail" class="validate[required,equals[emailID]]"></td>
			</tr>
			
			<tr>
				<td>Email ID</td>
				<td><input type="text" name ="emailID" class="validate[required,custom[email]]" id="emailID"></td>
				<!-- <td>Payment</td>
				<td><a href="#">PAY HERE</a></td> -->
			</tr>
			
				
			

			<tr>
				<td></td>	<td></td>	<td></td>
				<td align="left" height="100px;"><input type="submit"
					value="SUBMIT"></td>

			</tr>
		</table>
</form>
	</div>
</body>
</html>