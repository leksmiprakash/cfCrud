<cfquery name="register" datasource="cfsample" result="r">
SELECT * FROM register
</cfquery>

<!--<cfdump var="#register#" />--> <!--- Shows object having "SQL" property --->
<!--<cfoutput>SQL: #r.SQL#</cfoutput>-->

<cfoutput query="register">
#register.register_id#
#register.username#
#register.phn_no# <br>
</cfoutput>
<hr>
<p> otherways  to display db results </p>
<cfset artistArray = []>
<cfloop query="register">
    <cfset arrayappend(artistArray, register.register_id & '  ' & register.username & '-' & register.phn_no & '<br>')>
</cfloop>
 <cfoutput> #ArrayToList(artistArray)#</cfoutput>