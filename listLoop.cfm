<cfset coldfusion_list = "ColdFusion Lists,ColdFusion Arrays,ColdFusion Structures">
<cfloop list="#coldfusion_list#" index="i">
	<cfoutput> #i#</cfoutput>
</cfloop>
<hr>
<p>List length </p>
<cfscript>

outputLen=ListLen(coldfusion_list);
WriteOutput(outputLen); 
</cfscript>
<hr>
<p>Add an item to the end of the list</p>
<cfscript>
addedList = listAppend(coldfusion_list, "Element at end");
WriteOutput(addedList); 
</cfscript>
<hr>
<p>Add an item to the beginning of the list</p>
<cfscript>
addList =listPrepend(coldfusion_list, "Element at beginning");
WriteOutput(addList); 
</cfscript>
<hr>
<p>Add an item somewhere in the middle of the list </p>
<cfscript>
addLists = listInsertAt(coldfusion_list, "2", "Element at middle");
WriteOutput(addLists); 
</cfscript>
<hr>
<p> search an item somewhere in the list </p>
<cfscript>
searchLists = listContains(coldfusion_list, "ColdFusion");
WriteOutput(searchLists); 
</cfscript>
<hr>