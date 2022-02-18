<cfinclude template="header.cfm">
<hr>
<p>Welcome to my website on ColdFusion cfinclude usage!</p>
<hr>
<p>Setting variable</p>
<cfset firstname="Bono">
<cfoutput>
Hello #firstname#.
</cfoutput>
<hr>
<p>Setting If... else</p>

<cfset firstName = "Ozzy">
<cfif IsDefined("firstName")>
 <cfoutput>
Hello #firstname#.
</cfoutput>
<cfelse>
  Hello stranger!
</cfif>

<hr>
<p>greater or not</p>
<cfset age = 80>
<cfif age gte 80>
  Give up your day job!
</cfif>
<hr>



<p>looing from 1 to 5</p>
<cfloop from="1" to="5" index="i">
  <cfoutput>
  #i#<br />
  </cfoutput>
</cfloop>
<hr>

<p>looing lists</p>
<cfloop list="ColdFusion,HTML;XML" index="ListItem" delimiters=",;">
  <cfoutput>
   #ListItem#<br />
 </cfoutput>
</cfloop>
<hr>

<p>Operations through structure</p>
<cfset myBooks = StructNew()>
<cfset myVariable = StructInsert(myBooks,"ColdFusion","ColdFusion MX Bible")>
<cfset myVariable = StructInsert(myBooks,"HTML","HTML Visual QuickStart")>
<cfset myVariable = StructInsert(myBooks,"XML","Inside XML")>
<cfloop collection="#myBooks#" item="subject">
  <cfoutput>
 #subject#: #StructFind(myBooks,subject)#<br />
 </cfoutput>
</cfloop>
<hr>
<cfquery name="register" datasource="cfsample" result="r"  timeout="30">
SELECT * FROM register
</cfquery>

<cfdump var="#register#" /> <!--- Shows object having "SQL" property --->
<!--<cfoutput>SQL: #r.SQL#</cfoutput>-->
<cfinclude template="footer.cfm">