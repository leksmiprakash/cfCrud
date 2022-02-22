<html> 
    <head> 
        <title>Update Employee</title> 
    </head> 
    <body> 
        <cfif not isdefined("Form.Contract")> 
            <cfset form.contract = "No"> 
            <cfelse> 
            <cfset form.contract = "Yes"> 
        </cfif> 
        <cfquery name="UpdateEmployee" datasource="cfsample"> 
            UPDATE Employee 
            SET FirstName = '#Form.Firstname#', 
            LastName = '#Form.LastName#', 
            Dept_ID = #Form.Dept_ID#, 
            StartDate = '#left(Form.StartDate,19)#', 
            Salary = #Form.Salary# 
            WHERE Emp_ID = #Form.Emp_ID# 
        </cfquery> 
        <h1>Employee Updated</h1> 
        <cfoutput> 
            You have updated the information for 
            #Form.FirstName# #Form.LastName# 
            in the employee database. 
            <br><cflocation url="form.cfm">
        </cfoutput> 
    </body> 
</html>