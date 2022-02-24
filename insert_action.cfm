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


        <cfscript>
            variables.validMimeTypes =  {
                'application/pdf': {extension: 'pdf', application: 'Adobe Acrobat'}
                ,'application/vnd.ms-powerpoint': {extension: 'ppt', application: 'PowerPoint (97-2003)'}
                ,'application/vnd.openxmlformats-officedocument.presentationml.presentation': {extension: 'pptx', application: 'PowerPoint (2007)'}
                ,'image/jpeg': {extension: 'jpg'}
                ,'image/png': {extension: 'png'}
            };
        </cfscript>
        <cffile action="upload" filefield="fileUpload"
            destination="#theDir#/images" mode="600"
            accept="#StructKeyList(variables.validMimeTypes)#"
            strict="true"
            result="uploadResult"
            nameconflict="makeunique">



        <!--- Insert the new record ---> 
        <cfquery name="AddEmployee" datasource="cfsample"> 
            INSERT INTO employee 
            VALUES (#Form.Emp_ID#, '#Form.FirstName#', 
            '#Form.LastName#','#Form.EmailId#', #Form.Dept_ID#, 
            '#Form.StartDate#', #Form.Salary#, '#Form.Contract#', '#uploadResult.serverFile#') 
        </cfquery> 
        <h1>Employee Added</h1> 
        <cfmail to="#Form.EmailId#"
            from="lekshmi.prakash@techversantinfo.com"
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
       
        
        <button><a href="form.cfm">Back to form</a></button>
    </body> 
</html>