<cfapplication name="whatever" clientmanagement="Yes" sessionmanagement="Yes" setclientcookies="Yes" sessiontimeout="#createTimeSpan(0,0,20,0)#" applicationtimeout="#createTimeSpan(0,0,20,0)#">
 
 <!--- if byLogin cookie is defined, set the session --->
<cfif isDefined("COOKIE.byLogin")>
	<cflock timeout="20" throwontimeout="No" type="EXCLUSIVE" scope="SESSION">
		<cfset SESSION.userName = listFirst(COOKIE.byLogin,":")>
		<cfset SESSION.password = listlast(COOKIE.byLogin,":")>
		<cfset SESSION.authenticated = "true">
	</cflock>
</cfif>

<!--- if SESSION.userName is not defined, redirect to the login --->
<cfif NOT isDefined("SESSION.authenticated")>
		
</cfif> 



