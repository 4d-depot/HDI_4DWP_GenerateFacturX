Form:C1466.context:=ds:C1482.Invoices.query("name = :1"; "German sample").first().context
Form:C1466.template:=ds:C1482.Templates.query("name = :1"; "German sample").first().template

SET TIMER:C645(-1)
