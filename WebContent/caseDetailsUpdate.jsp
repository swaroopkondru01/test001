<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WLAS - Case Details</title>


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
	 
	
	 $("#cdForm").validationEngine({showOneMessage: true});
	
});

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
		
		<form action="CaseDetailServlet?action=save" method="post" id="cdForm">
		<table style="width: 100%;" >
			<tr align="center">
				<td><h3>CASE DETAILS UPDATE</h3></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstName" class="validate[required]" value=<%=session.getAttribute("firstname") %>></td>
				<td>Case Type</td>
				<td><%=session.getAttribute("caseType") %></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" class="validate[required]" name="lastName" value=<%=session.getAttribute("lastname") %>></td>
				<td>Case ID</td>
				<td><%=session.getAttribute("caseID") %></td>
			</tr>
			<tr>
				<td>Email ID</td>
				<td><input type="email" name="emailID" class="validate[required,custom[email]]" value=<%=session.getAttribute("mailid") %>></td>
				<td></td> 
				<td rowspan="5"><textarea cols="30" rows="10" name="textdata" ></textarea></td>
			</tr>
			
			<tr>
				<td>Phone Number</td>
				<td><input type="text" class="validate[required]" name="phone" value=<%=session.getAttribute("phone") %> ></td>
			</tr>
			
			
			<tr>
				<td>Business Name</td>
				<td><input type="text" name="bName" class="validate[required]" value=<%=session.getAttribute("businessname") %>></td>
			</tr>
			
			
			<tr>
				<td>Return Date</td>
				<td><input type="date" class="validate[required]" name="rDate" value=<%=session.getAttribute("rdate") %>></td>
			</tr>
			
			
			<tr>
				<td>Address</td>
				<td><textarea rows="4" cols="22" name="address" ></textarea></td>
			</tr>

			<tr>
					
				<td align="center" height="100px;"><a href="dbAdmin.jsp"><input type="button"
					value="BACK"> </a></td> 
				<td align="center" height="100px;"><input type="submit"
					value="SUBMIT"></td>
				
			</tr>
		</table>
</form>
	</div>
</body>
</html>