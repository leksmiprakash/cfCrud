<cfscript>
    myQuestiion = "Your Name?";
    myAge = 25;
    halfAge = myAge/2;
    roundAge = Round(halfAge);
</cfscript>
<cfoutput> 
    <strong>#myQuestiion#</strong>
    <strong>Luck</strong><br>   
    <strong>My Age : #myAge#</strong><br>
    <strong>My Age Half : #roundAge#</strong>
</cfoutput>
