<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
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
			<tr >
				<td align="center" style="border: 1px solid black"><a href="Home.jsp" style="color: black;">HOME</a></td>
					<%
			String rv=(String)session.getAttribute("disp");
			%>
			<c:set var="r" value="<%=rv %>"></c:set>
			<c:if test="${(r=='1')}">
			<td align="center" style="border: 1px solid black"><a href="caseDetails.jsp" style="color: black;">CASE DETAILS</a></td>
			</c:if>
			<c:if test="${(r=='2')}">
			<td align="center" style="border: 1px solid black"><a href="CaseAdvice?action=get" style="color: black;">CASE ADVICE</a></td>
			</c:if>
				<td align="center" style="border: 1px solid black"><a href="QueryRequest_logged.jsp" style="color: black;">QUERY REQUEST</a></td>
				<td align="center" style="border: 1px solid black"><div class="dropdown"><a href="#" style="color: black;" class="dropbtn">REPORT &#x25BC; </a>
				  <!-- <button >Dropdown</button> -->
				  <div class="dropdown-content">
				    <a href="MyAccount.jsp">My Account</a>
				    <a href="DBUpdate.jsp">Database Update</a>
				  </div>
				</div>
				</td>
				<td align="center" style="border: 1px solid black"><a href="Home_NL.jsp" style="color: black;">LOGOUT</a></td>
			</tr>
		</table>
		
		<form action="MA_result.jsp" method="post" id="registerForm">
		<table style="width: 100%;" >
			<tr align="center">
				<td><h3>My Account</h3></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstName" ></td>
				<td>User ID</td>
				<td><%=session.getAttribute("loginName") %></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastName"></td>
				<td>Role</td>
				<td><select name="role" class="validate[required]">
				<option value="0" selected="selected"> Select Role..  </option>
				<option value="1"> Plantiff </option>
				<option value="2"> Attorney</option>
				
				 </select>
				 </td>
			
			
			<tr>
				<td>Phone Number</td>
				<td><input type="text" name="phone" ></td>
				<td>Email ID</td>
				<td><input type="text" name ="emailID"  id="emailID"></td>
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