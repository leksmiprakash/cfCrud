<html>
    <body>
        <cfscript>
            myStruct={}
            myStruct.name="ColdFusion"
            myStruct.version=2018
            myStruct.releaseYear=2018
            mystruct.releaseMonth="July"
            writeOutput("Is myStruct a struct: " & isStruct(myStruct) )
        </cfscript>
        <h3>Structure Append</h3>
        <cfscript>
            myS1={Name:"John",Age:30,Dept:"Marketing"};
            myS2={Street:"My Street",Avenue:"My Avenue",Building:50,zip:10101};
            WriteOutput("Appended Structs:");
            StructAppend(myS1,myS2,true);// Returns true
            // Displays appended structs
            WriteDump(myS1);
        </cfscript>
        <h3>Structure Removal</h3>
        <cfscript>
            myStruct={a:1,b:2,c:3,d:4,e:5}; //Define the structure keys
            WriteOutput("Struct with data:");
            WriteDump(myStruct);
            StructClear(myStruct); //Remove data from the struct myStruct
            WriteOutput("Struct after data removal:");
            WriteDump(myStruct);
        </cfscript>
        <h3>Structure Count</h3>
        <cfscript>
            myStruct={a:1,b:2,c:3,d:4,e:5}; //Define the structure keys
            myCount=StructCount(myStruct); //Count the number of keys in myStruct
            WriteOutput(#myCount#); //Display value of myCount
        </cfscript>
        <h3>Structure Delete an element</h3>
        <cfscript>
            myStruct={a:1,b:2,c:3,d:4,e:5};
            WriteOutput("The input struct is:");
            WriteDump(myStruct);
            xFalse=StructDelete(myStruct,"f",false);// Returns Yes regardless of whether key exists
            WriteOutput(xFalse & " | "); //Display Yes
            xTrue=StructDelete(myStruct,"f","true");// Returns No since the key "f" does not exist in the input struct
            WriteOutput(xTrue & " | "); //Display No
            // Delete an element that actually exists in the input structure
            StructDelete(myStruct,"e",true); // Deletes element "e" from the struct and returns Yes
            WriteOutput("The updated struct is:");
            WriteDump(myStruct);
        </cfscript>
        <h3>Structure Find an element</h3>
        <cfscript>
            myStruct=StructNew();
            myStruct={a:1,b:2,c:3,d:4,e:5}; //Define structure keys
            WriteOutput("The values are: ");
            for (key in myStruct){ //Find keys in the struct
                    WriteOutput(StructFind(myStruct,#key#) & " | "); //Display the value if key is found
            }
            // Try to search for the key "f" that does not exist in myStruct
            // Since the key is not in the struct, an error message is displayed
            try{
                    StructFind(myStruct,"f");
            }
            catch (any e)
            {
                    WriteOutput(e.message);
            }
            
        </cfscript>
        
    </body>
</html>