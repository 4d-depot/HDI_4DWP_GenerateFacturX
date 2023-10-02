

If (Form:C1466.xml#Null:C1517)
	
	Form:C1466.xmlFile.setText(Form:C1466.xml)
	SET TIMER:C645(-1)
	
	//SHOW ON DISK(Form.xmlFile.platformPath)
	
Else 
	// btn should be disabled / should never happen
	ALERT:C41("XML is not ready yet!")
End if 
//TEXT TO DOCUMENT("facturxml.xml"; Form.xml; "UTF-8")



