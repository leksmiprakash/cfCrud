
<cfquery 
       name="employees" datasource="cfsample"
       cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#"> 
       SELECT * FROM Employee 
</cfquery> 
<cfscript> 
    theDir=GetDirectoryFromPath(GetCurrentTemplatePath()); 
    theFile=theDir & "employees.xls"; 
    theSheet = SpreadsheetNew("CourseData");  
    SpreadsheetAddRows(theSheet,employees); 
</cfscript>

<cfspreadsheet action="write" filename="#theFile#" name="theSheet" 
    sheetname="employees" overwrite=true> 
	<cfspreadsheet action="read" src="#theFile#" sheetname="employees" name="spreadsheetData"> 
	<cfspreadsheet action="read" src="#theFile#" sheet=1 rows="3,4" format="csv" name="csvData"> 
	<cfspreadsheet action="read" src="#theFile#" format="html" rows="5-10" name="htmlData"> 
	<cfspreadsheet action="read" src="#theFile#" sheetname="employees" query="queryData"> 
	<h3>File downloaded path <CFOUTPUT>#theDir#employees.xls</CFOUTPUT></h3>
