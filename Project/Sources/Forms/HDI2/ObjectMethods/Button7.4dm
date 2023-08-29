var $template : cs:C1710.InvoicesEntity

$template:=ds:C1482.Invoices.query("name = :1"; "French sample").first()

Form:C1466.context:=$template.context
Form:C1466.template:=$template.template


