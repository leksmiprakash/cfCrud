<html> 
    <head> 
        <title>Insert Data Form</title> 
    </head> 
    <body> 
        <h2>Insert Data Form at
        <cfoutput>
            #DateFormat(Now(), "ddd dd mmmm, yyyy")#
        </cfoutput></h2> 
        <table> 
            <!--- begin html form; 
            put action page in the "action" attribute of the form tag. ---> 
            <form action="insert_action.cfm" method="post" enctype="multipart/form-data" > 
                <tr> 
                    <td>Employee ID:</td> 
                    <td><input type="Number" name="Emp_ID" size="4" maxlength="4" required></td> 
                </tr> 
                <tr> 
                    <td>First Name:</td> 
                    <td><input type="Text" name="FirstName" size="35" maxlength="50" required></td> 
                </tr> 
                <tr> 
                    <td>Last Name:</td> 
                    <td><input type="Text" name="LastName" size="35" maxlength="50" required></td> 
                </tr>
                <tr> 
                    <td>Email Id:</td> 
                    <td><input type="Email" name="EmailId" size="35" maxlength="50" required></td> 
                </tr> 
                <tr> 
                    <td>Department Number:</td> 
                    <td><input type="Text" name="Dept_ID" size="4" maxlength="4" required></td> 
                </tr> 
                <tr> 
                    <td>Start Date:</td> 
                    <td><input type="Date" name="StartDate" size="16" maxlength="16" required></td> 
                </tr> 
                <tr> 
                    <td>Salary:</td> 
                    <td><input type="Text" name="Salary" size="10" maxlength="10" required></td> 
                </tr> 
                <tr> 
                    <td>Contractor:</td> 
                    <td><input type="checkbox" name="Contract" value="Yes" checked>Yes</td> 
                </tr> 
                <tr> 
                    <td>Image Upload:</td> 
                    <td><input type="file" name="fileUpload"></td> 
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
        <cfscript> 
            theDir=GetDirectoryFromPath(GetCurrentTemplatePath());  
        </cfscript>
        <table border="1"> 
            <tr> 
                <td>Employee ID</td> 
                <td>FirstName</td> 
                <td align="center">LastName</td> 
                <td align="center">EmailId</td> 
                <td align="center">Dept_ID</td> 
                <td align="center">StartDate</td> 
                <td align="center">Salary</td> 
                <td align="center">Contract</td> 
                <td align="center">Image</td> 
                <td align="center">Action</td> 
            </tr> 
            <cfoutput query="employee">
                <tr>
                    <td>#employee.Emp_ID#</td> 
                    <td>#employee.FirstName#</td> 
                    <td>#employee.LastName# </td>  
                    <td>#employee.EmailId# </td> 
                    <td>#employee.Dept_ID# </td> 
                    <td>#employee.StartDate# </td> 
                    <td>#employee.Salary# </td> 
                    <td>#employee.Contract# </td> 
                    <td><img src="#theDir#\images\#employee.fileUpload#" width="100px" height="100px" style="border-radius:50%"></td> 
                    </td>
                    <td>
                    <button><a href="formUpdate.cfm?Emp_ID=#Emp_ID#">Edit</a></button>
                    <button><a href="deleteAction.cfm?Emp_ID=#Emp_ID#" onclick="return confirm('Are you sure?');">Delete</a></button>
                    <button><a href="printPDF.cfm?Emp_ID=#Emp_ID#" onclick="return confirm('Print details?');">Print PDF</a></button>
                    </td>
                </tr> 
            </cfoutput>
        </table> 
        
        <br><button><a href="sprdSht.cfm">Spreadsheet</a></button>
    </body> 
</html>
