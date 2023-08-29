If ([Invoices:2]context:4#Null:C1517)
	
	WP SET DATA CONTEXT:C1786([Invoices:2]template:3; [Invoices:2]context:4)
	WP COMPUTE FORMULAS:C1707([Invoices:2]template:3)
	
	// update the XML content with the SAME context
	Form:C1466.xml:=buildXML([Invoices:2]context:4)
	
End if 

