<html> 
<head> 
<title>Input form</title> 
</head> 
<body> 
<!--- If the Contractor check box is clear), set the value of the Form.Contract 
to "No" ---> 
<cfif not isdefined("Form.Contract")> 
<cfset Form.Contract = "No"> 
</cfif> 
<!--- Insert the new record ---> 
<cfquery name="AddEmployee" datasource="cfsample"> 
INSERT INTO employee 
VALUES (#Form.Emp_ID#, '#Form.FirstName#', 
'#Form.LastName#', #Form.Dept_ID#, 
'#Form.StartDate#', #Form.Salary#, '#Form.Contract#') 
</cfquery> 
<h1>Employee Added</h1> 
<cfoutput>You have added #Form.FirstName# #Form.Lastname# to the employee database. 
</cfoutput> 


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

<cfoutput query="employee">
<tr> 
<td>#employee.Emp_ID#</td> 
<td>#employee.FirstName#</td> 
<td>#employee.LastName# </td> 
<td>#employee.Dept_ID# </td> 
<td>#employee.StartDate# </td> 
<td>#employee.Salary# </td> 
<td>#employee.Contract# </td>
</tr> 
</cfoutput>

</table> 
</body> 
</html>