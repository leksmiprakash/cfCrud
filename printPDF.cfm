<cfdocument format="PDF" filename="employeeDetails.pdf" overwrite="Yes">
<html>
<head>
    <title>Hello World</title>
</head>
<body>   
<cfquery name="GetRecordtoUpdate" datasource="cfsample"> 
SELECT * FROM Employee 
WHERE Emp_ID = #URL.Emp_ID# 
</cfquery> 
<cfoutput query="GetRecordtoUpdate"> 
<table> 
<form> 
<tr> 
<td>First Name:</td> 
<td>#FirstName#</td> 
</tr> 
<tr> 
<td>Last Name:</td> 
<td>#LastName#</td> 
</tr> 
<tr> 
<td>Department Number:</td> 
<td>#Dept_ID#</td> 
</tr> 
<tr> 
<td>Start Date:</td> 
<td>#StartDate#</td> 
</tr> 
<tr> 
<td>Salary:</td> 
<td>#Salary#</td> 
</tr> 
<tr> 
<td>Contractor:</td> 
<td><cfif #Contract# IS "Yes"> 
Yes 
<cfelse> 
NO 
</cfif></td> 
</tr> 
</form> 
</table> 
</cfoutput> 
</body>
</html>
</cfdocument>
<cfheader name="Content-Disposition" value="attachment;filename=employeeDetails.pdf">
<cfcontent type="application/octet-stream" file="#expandPath('.')#\employeeDetails.pdf" deletefile="Yes">