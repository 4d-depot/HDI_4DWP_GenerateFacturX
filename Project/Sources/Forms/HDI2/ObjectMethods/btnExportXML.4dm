If (Form:C1466.trace)
	TRACE:C157
End if 

If (Form:C1466.xml#Null:C1517)
	
	Form:C1466.xmlFile.setText(Form:C1466.xml)
	SET TIMER:C645(-1)
	
	//SHOW ON DISK(Form.xmlFile.platformPath)
	
Else 
	//should not append, button is disabled
End if 



