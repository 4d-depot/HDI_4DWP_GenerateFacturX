

If (Form:C1466.xml#Null:C1517)
	
	//$path:=Folder(fk database folder).platformPath
	//$folder:=Folder($path; fk platform path)
	
	
	Form:C1466.xmlFile:=File:C1566(Folder:C1567(fk database folder:K87:14).path+"facturxml.xml")
	Form:C1466.xmlFile.setText(Form:C1466.xml)
	
	SHOW ON DISK:C922(Form:C1466.xmlFile.platformPath)
	
Else 
	ALERT:C41("XML is not ready yet!")
End if 
//TEXT TO DOCUMENT("facturxml.xml"; Form.xml; "UTF-8")



