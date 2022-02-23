<cfparam name="form.fileUpload" default="">
<cfscript> 
    theDir=GetDirectoryFromPath(GetCurrentTemplatePath());  
</cfscript>
<cfif len(trim(form.fileUpload))>
  <cffile action="upload"
     fileField="fileUpload"
     destination="#theDir#\images">
  <p>Thankyou, your file has been uploaded.</p>
</cfif>

<form enctype="multipart/form-data" method="post">
  <input type="file" name="fileUpload">
  <input type="submit" value="Upload File">
</form>
