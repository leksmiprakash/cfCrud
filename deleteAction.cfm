<html> 
<head> 
<title>Delete Employee</title> 
</head> 
<body> 

<cfquery name="DeleteEmployee" 
    datasource="cfsample"> 
        DELETE FROM Employee 
        WHERE Emp_ID = #URL.Emp_ID# 
</cfquery> 
<h1>Employee Updated</h1> 
<cfoutput> 
You have deleted the information
<br>
<button><a href="form.cfm">Back to form</a></button>
</cfoutput> 
</body> 
</html>