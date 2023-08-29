If (Form event code:C388=On Load:K2:1)
	
	ARRAY TEXT:C222($allowMe; 0)
	APPEND TO ARRAY:C911($allowMe; "currentDateAsString")
	
	SET ALLOWED METHODS:C805($allowMe)
	
End if 
