<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
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

<script type="text/javascript">




function showfield(name){
	 
	 if (name == 1 )
		 
		 {
			document.getElementById("criminalRow").hidden = "hidden";
		 	document.getElementById("civilRow").hidden= "";
		 	
		 }
	 else if (name == 2)
	 {
			document.getElementById("criminalRow").hidden = "";
		 	document.getElementById("civilRow").hidden = "hidden";
		 	
	}
	 
	 else{
		 document.getElementById("criminalRow").hidden = "hidden";
		 	document.getElementById("civilRow").hidden= "hidden";
		 	
	 }
	}


</script>
</head>
<body>
	<div id="maindiv">
		<div>
			<img alt="WLAS" src="images/home.png" style="display: inline-block;" />
			<h1
				style="font-family: sans-serif; color: #4c92ca; display: inline-block; width: 60%"
				align="center">Web Legal Advice System</h1>
		</div>
		
		<form action="QueryRequest" method="post">
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
			</tr>
		</table>
		<table style="margin-left: 30%; width: 50%;">
			<tr align="center">
				<td><h3>QUERY REQUEST</h3></td>
			</tr>
			<tr>
				<td>Type of Attorney</td>
				<td><select name="type"
					onchange="showfield(this.options[this.selectedIndex].value)">
						<option selected="selected" value="0">Please select ...</option>
						<option value="1">Civil</option>
						<option value="2">Criminal</option>
				</select></td>
			</tr>
			<tr  id="civilRow" hidden="hidden">
				<td>Civil Attorney</td>
		
				<td><select name="nameofAtt">
						
						<option value="Alan Bendix">Alan Bendix</option>
						<option value="Shirley Watson">Shirley Watson</option>
						<option value="Greg Brown">Greg Brown</option>
				</select></td>
			</tr>

			<tr id ="criminalRow" hidden="hidden">
				<td>Criminal Attorney</td>
				
				<td><select name="nameofAtt">
						<option value="Alex weir">Alex weir</option>
						<option value="Ishbel Watson">Ishbel Watson</option>
						<option value="Martin Tarpy"> Martin Tarpy</option>
				</select></td>
				
			</tr>

		<tr><td>
		<input type="hidden" name="actionval" value="logged">
		
		</td></tr>
			
		</table>
		
		<br><br>


<table style="margin-left: 30%; width: 50%;" >
<tr>
<td>Attorney Name</td>
<td><%=session.getAttribute("firstname") %></td>
</tr>
<tr>
<td>Attorney Mail Id</td>
<td><%=session.getAttribute("mail") %></td>
</tr>
<tr>
<td>Attorney Address</td>
<td><%=session.getAttribute("Address") %></td>
</tr>
<tr>
<td>Attorney Experience</td>
<td><%=session.getAttribute("exp") %></td>
</tr>

</table>
		
		<table style="margin-left: 30%; width: 50%;">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td align="left" height="100px;"><a href="Home.jsp"><input type="button"
					value="BACK"></a></td> 
				<td align="left" height="100px;"><input type="submit"
					value="SUBMIT"></td>
				<td align="left" height="100px;"><a href="Home.jsp"><input type="button"
					value="EXIT"></a></td>
				
			</tr>

		</table>
</form>	
	</div>
	
	<!-- <script type="text/javascript">
	document.getElementById("criminalRow").style.display = "none";
	document.getElementById("civilRow").style.display = "none";
	</script> -->
</body>
</html>