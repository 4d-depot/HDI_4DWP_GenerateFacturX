Form:C1466.template:=WP New:C1317


If (Form:C1466.xmlFile.exists)
	Form:C1466.xmlFile.delete()
End if 

If (Form:C1466.facturxFile.exists)
	Form:C1466.facturxFile.delete()
End if 

Form:C1466.context:={}
Form:C1466.xml:=""
Form:C1466.contextSet:=False:C215

SET TIMER:C645(-1)