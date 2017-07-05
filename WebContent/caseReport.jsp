<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WLAS - Advice Plan</title>

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
		<table id="mainTbl" style="width: 100%;">
			<tr>
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
		</table>	
		
		
		<h3>ADVICE PLAN</h3>
		<table style="width: 70%; display: inline-block;" >
			<tr align="center">
				<td><h3>CASE DETAILS</h3></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td>Alex</td>
				<td>Case Type</td>
				<td>CIVIL</td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td>Boyle</td>
				<td>Case ID</td>
				<td>0012054</td>
			</tr>
			<tr>
				<td>Email ID</td>
				<td>test@wlas.com</td>
				<td></td> 
				<td rowspan="5"><textarea cols="30" rows="10"></textarea></td>
			</tr>
			
			<tr>
				<td>Phone Number</td>
				<td>1-526-5785</td>
			</tr>
			
			
			<tr>
				<td>Business Name</td>
				<td>Dr. Alex</td>
			</tr>
			
			
			<tr>
				<td>Return Date</td>
				<td>11/25/2015</td>
			</tr>
			
			
			<tr>
				<td>Address</td>
				<td>Colarado, United States</td>
			</tr>

			
		</table>
		
		
		<table style="display: inline-block;" >
	<tr>
				<td></td>
			</tr>
			<tr>
				<td><h3> ADVICE</h3></td>
			</tr>
			
			<tr>
				<td><textarea rows="15" cols="30"></textarea> </td>
			</tr>
			
			
		</table>
		
		<table style="width:80%; ">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td align="center" height="100px;"><a href="Home.jsp"><input type="button"
					value="BACK"></a></td> 
				<td align="center" height="100px;"><a href="caseReport_submit.jsp"><input type="button"
					value="SAVE"></a></td>
					
				<td align="center" height="100px;"><a href="Home.jsp"><input type="button"
					value="EXIT"></a></td>
				
			</tr>

		</table>
	</div>
</body>
</html>