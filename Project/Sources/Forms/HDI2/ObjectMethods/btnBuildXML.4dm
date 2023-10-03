If (Form:C1466.trace)
	TRACE:C157
End if 

If (Form:C1466.context#Null:C1517)
	// update the XML content with the SAME context
	Form:C1466.xml:=buildXML(Form:C1466.context)
	
	SET TIMER:C645(-1)
	
Else 
	//should not append, button is disabled
End if 

