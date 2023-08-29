$find:=""

$find:=$find+"rsm:SupplyChainTradeTransaction"
//$ref:=DOM Find XML element(Form.xmlDOM; $find; $array)

$find:=$find+"/"+"ram:ApplicableHeaderTradeSettlement"
//$ref:=DOM Find XML element(Form.xmlDOM; $find; $array)

$find:=$find+"/"+"ram:PaymentReference"
$ref:=DOM Find XML element:C864(Form:C1466.xmlDOM; $find; $array)


$value:=Form:C1466.value
DOM SET XML ELEMENT VALUE:C868($ref; $value)



DOM EXPORT TO VAR:C863(Form:C1466.xmlDOM; $xmlText)
Form:C1466.xmlText:=$xmlText
