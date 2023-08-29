$find:=""

$find:=$find+"rsm:SupplyChainTradeTransaction"
$ref:=DOM Find XML element:C864(Form:C1466.xmlDOM; $find; $array)

$find:=$find+"/"+"ram:ApplicableHeaderTradeSettlement"
$ref:=DOM Find XML element:C864(Form:C1466.xmlDOM; $find; $array)

$find:=$find+"/"+"ram:PaymentReference"
$ref:=DOM Find XML element:C864(Form:C1466.xmlDOM; $find; $array)



DOM GET XML ELEMENT VALUE:C731($ref; $value)

Form:C1466.value:=$value




