<!DOCTYPE html>
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
				 <td align="center" style="border: 1px solid black"><a href="caseUpdate.jsp" style="color: black;">Case Update</a></td>
				
				<td align="center" style="border: 1px solid black"><a href="Home_NL.jsp" style="color: black;">LOGOUT</a></td>
			</tr>
		</table>	
<br> <br>
<br>
<br>
<h3 align="center"> <%=session.getAttribute("updateResult") %></h3>		

<table style=" margin-left:30%; width:30%; ">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td align="center" height="100px;"><a href="UserUpdate"><input type="button"
					value="BACK"> </a></td> 
				
				<td align="center" height="100px;"><a href="dbAdmin.jsp"><input type="button"
					value="HOME"></a></td>
				
			</tr>

		</table>
	</div>
</body>
</html>