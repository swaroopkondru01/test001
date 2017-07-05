<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		
		<h3>ADVICE PLAN</h3>
	<table style="width: 100%;" >
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Case Type</th>
				<th>Case ID</th>
				<th>Email</th>
				<th>Phone Number</th>
				<th colspan="1">Action</th>
			</tr>
			 <c:forEach var="cases" items="${caseList}">
                <tr>
                    <td><c:out value="${cases.firstname}"  /></td>
                    <td><c:out value="${cases.lastname}" /></td>
                    <td><c:out value="${cases.caseType}" /></td>
                    <td><c:out value="${cases.caseID}"  /></td>
                     <td><c:out value="${cases.email}"  /></td>
                      <td><c:out value="${cases.phonenumber}"  /></td>
                      <td><a href="CaseAdvice?action=update&id=${cases.id}"> <input type="button" value="Advice"></a>
                      
                </tr>
                </c:forEach>
			<tr>
					
				<td align="center" height="100px;" colspan="7"><a href="Home.jsp" ><input type="button"
					value="BACK"> </a></td> 
				
				
			</tr>
		</table>
	</div>
</body>
</html>