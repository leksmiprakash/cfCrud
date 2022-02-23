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
        <cfparam name="Form..fileUpload" default="">
        <cfscript> 
            theDir=GetDirectoryFromPath(GetCurrentTemplatePath());  
        </cfscript>
        <!--- Insert the new record ---> 
        <cfquery name="AddEmployee" datasource="cfsample"> 
            INSERT INTO employee 
            VALUES (#Form.Emp_ID#, '#Form.FirstName#', 
            '#Form.LastName#','#Form.EmailId#', #Form.Dept_ID#, 
            '#Form.StartDate#', #Form.Salary#, '#Form.Contract#', '#Form.fileUpload#') 
        </cfquery> 
        <h1>Employee Added</h1> 
        <cfmail to="#Form.EmailId#"
            from="lekshmiiprakash@gmail.com"
            subject="Welcome to our site"
            type="text">
            Dear #Form.FirstName#

            We, would like to thank you for joining.

            Best wishes
            
        </cfmail>
        <cfoutput>
            <p>Thank you #Form.FirstName# #Form.Lastname# for registering.
            We have just sent you an email.</p>
        </cfoutput>
        <cfif len(trim(Form..fileUpload))>
            <cffile action="upload"
            fileField="fileUpload"
            destination="#theDir#\images">
            <p>Thankyou, your file has been uploaded.</p>
        </cfif>
        <button><a href="form.cfm">Back to form</a></button>
    </body> 
</html>