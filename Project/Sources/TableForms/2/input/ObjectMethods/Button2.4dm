$context:=ds:C1482.Invoices.query("name = :1"; [Templates:2]name:2).first().context
WP SET DATA CONTEXT:C1786([Templates:2]template:3; $context)
WP COMPUTE FORMULAS:C1707([Templates:2]template:3)

