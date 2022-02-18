<cfset faq = ArrayNew(1)>
<cfset ArrayAppend(faq, "What are ColdFusion arrays")>
<cfset ArrayAppend(faq, "How to create a ColdFusion array?")>
<cfset ArrayAppend(faq, "What are two dimensional arrays?")>
<cfoutput>#faq[2]#</cfoutput>
<hr>
<p> Add new element in end </p>
<cfset ArrayAppend(faq, "How to modify an array at end?")>
<cfoutput>#faq[4]#</cfoutput>
<hr>
<p> Add new element in begining </p>
<cfset ArrayPrepend(faq, "How to modify an array at begining?")>
<cfoutput>#faq[1]#</cfoutput>
<hr>
