<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>WLAS - Home</title>
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
<h4 style="margin-left: 70%"> Dear  <%=session.getAttribute("uname") %> , Welcome to WLAS!</h4>
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
	<table style="width: 100%;" >
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Case Type</th>
				<th>Case ID</th>
				<th>Email</th>
				<th>Phone Number</th>
				<th colspan="2">Action</th>
			</tr>
			 <c:forEach var="cases" items="${caseList}">
                <tr>
                    <td><c:out value="${cases.firstname}"  /></td>
                    <td><c:out value="${cases.lastname}" /></td>
                    <td><c:out value="${cases.caseType}" /></td>
                    <td><c:out value="${cases.caseID}"  /></td>
                     <td><c:out value="${cases.email}"  /></td>
                      <td><c:out value="${cases.phonenumber}"  /></td>
                      <td><a href="CaseDetailServlet?action=update&id=${cases.id}"> <input type="button" value="Update"></a>
                      <td><a href="CaseDetailServlet?action=delete&id=${cases.id}"> <input type="button" value="Delete"></a>
                      
                </tr>
                </c:forEach>
			<tr>
					
				<td align="center" height="100px;" colspan="7"><a href="dbAdmin.jsp" ><input type="button"
					value="BACK"> </a></td> 
				
				
			</tr>
		</table>
		
	</div>
</body>
</html>