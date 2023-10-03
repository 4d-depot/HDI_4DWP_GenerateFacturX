If (Form:C1466.trace)
	TRACE:C157
End if 

Form:C1466.context:=ds:C1482.Invoices.query("name = :1"; "German sample").first().context
Form:C1466.template:=ds:C1482.Templates.query("name = :1"; "German sample").first().template

SET TIMER:C645(-1)
