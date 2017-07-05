<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WLAS</title>
<link rel="stylesheet" href="css/validationEngine.jquery.css" type="text/css">
<style type="text/css">

#maindiv {
height: auto; /*if more info comes on the page, it will stretch down*/
width: 1000px;
margin: 0 auto; /*this will cause the div to be in the center*/

}

</style>

<script type="text/javascript">



</script>

</head>
<body >
<div id="maindiv">
<div>
<img alt="WLAS" src="images/home.png" style="display: inline-block;"/>
<h1 style="font-family:sans-serif; color: #4c92ca; display: inline-block; width: 60%" align="center">  Web Legal Advice System</h1></div>
		<table id="mainTbl" style="width: 100%;">
				<tr>
				<td align="center" style="border: 1px solid black"><a href="Home.jsp" style="color: black;">HOME</a></td>
				<!-- <td align="center" style="border: 1px solid black"><a href="caseDetails.jsp" style="color: black;">CASE DETAILS</a></td>
				<td align="center" style="border: 1px solid black"><a href="caseAdvice.jsp" style="color: black;">CASE ADVICE</a></td>
				 -->
				 <td align="center" style="border: 1px solid black"><a href="UserUpdate" style="color: black;">User Update</a></td>
				 <td align="center" style="border: 1px solid black"><a href="CaseDetailServlet?action=get" style="color: black;">Case Update</a></td>
				
				<td align="center" style="border: 1px solid black"><a href="Home_NL.jsp" style="color: black;">LOGOUT</a></td>
			</tr>
		</table>
		
		<form action="UserUpdate?action=save" method="post" id="registerForm">
		<table style="width: 100%;" >
			<tr align="center">
				<td><h3>User Details Update</h3></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstName" value=<%=session.getAttribute("firstname") %>></td>
				<td>User ID</td>
				<td><%=session.getAttribute("uname") %></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastName" value=<%=session.getAttribute("lastname") %>></td>
				<td>Role</td>
				<td><%=session.getAttribute("role") %>
				 </td>
			
			
			<tr>
				<td>Phone Number</td>
				<td><input type="text" name="phone"  value=<%=session.getAttribute("phone") %>></td>
				<td>Email ID</td>
				<td><input type="text" name ="emailID"  id="emailID"  value=<%=session.getAttribute("emailID") %>></td>
			</tr>
			

			<tr>
				<td></td>	<td></td>	<td>
				<td align="left" height="100px;"><a href="UserUpdate"> <input type="button"
					value="Back"></a></td>
				</td>
				<td align="left" height="100px;"><input type="submit"
					value="Save"></td>

			</tr>
		</table>
</form>	
</div>
</body>
</html>