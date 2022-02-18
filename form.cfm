<html> 
<head> 
<title>Insert Data Form</title> 
</head> 
<body> 
<h2>Insert Data Form</h2> 
<table> 
<!--- begin html form; 
put action page in the "action" attribute of the form tag. ---> 
<form action="insert_action.cfm" method="post"> 
<tr> 
<td>Employee ID:</td> 
<td><input type="text" name="Emp_ID" size="4" maxlength="4"></td> 
</tr> 
<tr> 
<td>First Name:</td> 
<td><input type="Text" name="FirstName" size="35" maxlength="50"></td> 
</tr> 
<tr> 
<td>Last Name:</td> 
<td><input type="Text" name="LastName" size="35" maxlength="50"></td> 
</tr> 
<tr> 
<td>Department Number:</td> 
<td><input type="Text" name="Dept_ID" size="4" maxlength="4"></td> 
</tr> 
<tr> 
<td>Start Date:</td> 
<td><input type="Text" name="StartDate" size="16" maxlength="16"></td> 
</tr> 
<tr> 
<td>Salary:</td> 
<td><input type="Text" name="Salary" size="10" maxlength="10"></td> 
</tr> 
<tr> 
<td>Contractor:</td> 
<td><input type="checkbox" name="Contract" value="Yes" checked>Yes</td> 
</tr> 
<tr> 
<td>&nbsp;</td> 
<td><input type="Submit" value="Submit">&nbsp;<input type="Reset" 
value="Clear Form"></td> 
</tr> 
</form> 
<!--- end html form ---> 
</table> 


<br>
<br>
<cfquery name="employee" datasource="cfsample" result="r">
SELECT * FROM employee
</cfquery>

<table border="1"> 
<tr> 
<td>Employee ID</td> 
<td>FirstName</td> 
<td>LastName</td> 
<td>Dept_ID</td> 
<td>StartDate</td> 
<td>Salary</td> 
<td>Contract</td> 
</tr> 
<tr> 
<cfoutput query="employee">
<td>#employee.Emp_ID#</td> 
<td>#employee.FirstName#</td> 
<td>#employee.LastName# </td> 
<td>#employee.Dept_ID# </td> 
<td>#employee.StartDate# </td> 
<td>#employee.Salary# </td> 
<td>#employee.Contract# </td> 
</cfoutput>
</tr> 
</table> 
</body> 
</html>