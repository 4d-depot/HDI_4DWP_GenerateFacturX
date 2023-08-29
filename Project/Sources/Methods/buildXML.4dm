//%attributes = {}
#DECLARE($context : Object)->$xmlText : Text

var $file : 4D:C1709.File
var $dom; $path; $parentPath; $ref; $parentRef; $valueString; $newStruct : Text
var $col : Collection
var $element; $item : Object
var $itemID : Integer


$file:=File:C1566("/RESOURCES/Profiles/xml_BASIC.xml")
$xmlText:=$file.getText()

If (Not:C34(Shift down:C543))
	
	$dom:=DOM Parse XML variable:C720($xmlText)  //rsm:CrossIndustryInvoice
	
	// STATIC VALUES
	
	$col:=New collection:C1472()
	$col.push({xpath: "rsm:ExchangedDocument/ram:ID"; value: $context.invoice.ID})
	$col.push({xpath: "rsm:ExchangedDocument/ram:IncludedNote/ram:Content"; value: $context.invoice.content})
	
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:SellerTradeParty/ram:Name"; value: $context.seller.name})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:SellerTradeParty/ram:SpecifiedLegalOrganization/ram:ID"; value: $context.seller.siret})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:SellerTradeParty/ram:PostalTradeAddress/ram:PostcodeCode"; value: $context.seller.zipCode})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:SellerTradeParty/ram:PostalTradeAddress/ram:LineOne"; value: $context.seller.address})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:SellerTradeParty/ram:PostalTradeAddress/ram:CityName"; value: $context.seller.city})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:SellerTradeParty/ram:PostalTradeAddress/ram:CountryID"; value: $context.seller.countryID})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:SellerTradeParty/ram:SpecifiedTaxRegistration/ram:ID"; value: $context.seller.tva})
	
	
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:BuyerTradeParty/ram:Name"; value: $context.seller.name})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:BuyerTradeParty/ram:SpecifiedLegalOrganization/ram:ID"; value: $context.buyer.siret})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:BuyerTradeParty/ram:PostalTradeAddress/ram:PostcodeCode"; value: $context.buyer.zipCode})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:BuyerTradeParty/ram:PostalTradeAddress/ram:LineOne"; value: $context.buyer.address})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:BuyerTradeParty/ram:PostalTradeAddress/ram:CityName"; value: $context.buyer.city})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:BuyerTradeParty/ram:PostalTradeAddress/ram:CountryID"; value: $context.buyer.countryID})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:BuyerTradeParty/ram:SpecifiedTaxRegistration/ram:ID"; value: $context.buyer.tva})
	
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:BuyerOrderReferencedDocument/ram:IssuerAssignedID"; value: $context.invoice.buyerIssuerAssignedID})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:ContractReferencedDocument/ram:IssuerAssignedID"; value: $context.invoice.contractIssuerAssignedID})
	
	$valueString:=String:C10(Year of:C25($context.invoice.dueDate); "0000")+String:C10(Month of:C24($context.invoice.dueDate); "00")+String:C10(Day of:C23($context.invoice.dueDate); "00")
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradePaymentTerms/ram:DueDateDateTime/udt:DateTimeString"; value: $valueString; attributeName: "format"; attributeValue: $context.invoice.dateTimeStringFormat})
	
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:PaymentReference"; value: $context.invoice.ID})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:InvoiceCurrencyCode"; value: $context.invoice.currencyCode})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeSettlementPaymentMeans/ram:TypeCode"; value: $context.invoice.typeCode})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeSettlementPaymentMeans/ram:PayeePartyCreditorFinancialAccount/ram:IBANID"; value: $context.seller.bank.iban})
	
	
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeSettlementHeaderMonetarySummation/ram:LineTotalAmount"; value: $context.invoice.lineTotalAmount})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeSettlementHeaderMonetarySummation/ram:TaxBasisTotalAmount"; value: $context.invoice.lineTotalAmount})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeSettlementHeaderMonetarySummation/ram:TaxTotalAmount"; value: $context.invoice.taxTotalAmount; attributeName: "currencyID"; attributeValue: $context.invoice.currencyCode})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeSettlementHeaderMonetarySummation/ram:GrandTotalAmount"; value: $context.invoice.grandTotalAmount})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeSettlementHeaderMonetarySummation/ram:TotalPrepaidAmount"; value: $context.invoice.totalPrepaidAmount})
	$col.push({xpath: "rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeSettlementHeaderMonetarySummation/ram:DuePayableAmount"; value: $context.invoice.duePayableAmount})
	
	
	For each ($element; $col)
		$ref:=DOM Find XML element:C864($DOM; $element.xpath)
		DOM SET XML ELEMENT VALUE:C868($ref; $element.value)
		If ($element.attributeName#Null:C1517)
			DOM SET XML ATTRIBUTE:C866($ref; $element.attributeName; $element.attributeValue)
		End if 
	End for each 
	
	
	// DYNAMIC VALUES (based on number of items)
	$itemID:=1
	For each ($item; $context.items)
		
		$path:="rsm:SupplyChainTradeTransaction/ram:IncludedSupplyChainTradeLineItem["+String:C10($itemID)+"]"
		$ref:=DOM Find XML element:C864($DOM; $path)
		
		If (ok=0)
			$parentPath:="rsm:SupplyChainTradeTransaction"
			$parentRef:=DOM Find XML element:C864($DOM; $parentPath)
			
			$newStruct:=DOM Create XML Ref:C861("toBeRenamed")  //Error IF created straight as "ram:IncludedSupplyChainTradeLineItem")
			$ref:=DOM Insert XML element:C1083($parentRef; $newStruct; $itemID)
			DOM CLOSE XML:C722($newStruct)
			DOM SET XML ELEMENT NAME:C867($ref; "ram:IncludedSupplyChainTradeLineItem")  // rename now
			
			//$path:="rsm:SupplyChainTradeTransaction/ram:IncludedSupplyChainTradeLineItem["+String($itemID)+"]"
			//$ref:=DOM Find XML element($DOM; $path)
			
			$ref:=DOM Create XML element:C865($DOM; $path+"/ram:AssociatedDocumentLineDocument/ram:LineID")
			$ref:=DOM Create XML element:C865($DOM; $path+"/ram:SpecifiedTradeProduct/ram:Name")
			$ref:=DOM Create XML element:C865($DOM; $path+"/ram:SpecifiedLineTradeAgreement/ram:NetPriceProductTradePrice/ram:ChargeAmount")
			$ref:=DOM Create XML element:C865($DOM; $path+"/ram:SpecifiedLineTradeDelivery/ram:BilledQuantity")
			$ref:=DOM Create XML element:C865($DOM; $path+"/ram:SpecifiedLineTradeSettlement/ram:ApplicableTradeTax/ram:TypeCode")
			$ref:=DOM Create XML element:C865($DOM; $path+"/ram:SpecifiedLineTradeSettlement/ram:ApplicableTradeTax/ram:CategoryCode")
			$ref:=DOM Create XML element:C865($DOM; $path+"/ram:SpecifiedLineTradeSettlement/ram:ApplicableTradeTax/ram:RateApplicablePercent")
			
			$ref:=DOM Create XML element:C865($DOM; $path+"/ram:SpecifiedLineTradeSettlement/ram:SpecifiedTradeSettlementLineMonetarySummation/ram:LineTotalAmount")
			
		End if 
		
		
		$col:=New collection:C1472()
		$col.push({xpath: $path+"/ram:AssociatedDocumentLineDocument/ram:LineID"; value: String:C10($itemID)})
		//$col.push({xpath: $path+"/ram:SpecifiedTradeProduct/ram:GlobalID"; value: $item.globalID; attributeName: "schemeID"; attributeValue: $item.schemeID})  //***
		$col.push({xpath: $path+"/ram:SpecifiedTradeProduct/ram:Name"; value: $item.name})
		$col.push({xpath: $path+"/ram:SpecifiedLineTradeAgreement/ram:NetPriceProductTradePrice/ram:ChargeAmount"; value: $item.chargeAmount})
		
		$col.push({xpath: $path+"/ram:SpecifiedLineTradeDelivery/ram:BilledQuantity"; value: $item.billedQuantity; attributeName: "unitCode"; attributeValue: $item.unitCode})  //***
		
		$col.push({xpath: $path+"/ram:SpecifiedLineTradeSettlement/ram:ApplicableTradeTax/ram:TypeCode"; value: "VAT"})
		$col.push({xpath: $path+"/ram:SpecifiedLineTradeSettlement/ram:ApplicableTradeTax/ram:CategoryCode"; value: "S"})
		$col.push({xpath: $path+"/ram:SpecifiedLineTradeSettlement/ram:ApplicableTradeTax/ram:RateApplicablePercent"; value: $item.rateApplicablePercent})
		$col.push({xpath: $path+"/ram:SpecifiedLineTradeSettlement/ram:SpecifiedTradeSettlementLineMonetarySummation/ram:LineTotalAmount"; value: $item.lineTotalAmount})
		
		For each ($element; $col)
			$ref:=DOM Find XML element:C864($DOM; $element.xpath)
			DOM SET XML ELEMENT VALUE:C868($ref; $element.value)
			If ($element.attributeName#Null:C1517)
				DOM SET XML ATTRIBUTE:C866($ref; $element.attributeName; $element.attributeValue)
			End if 
		End for each 
		
		
		$itemID+=1
	End for each 
	
	
	// DYNAMIC VALUES (based on distinct tax rates)
	$itemID:=1
	For each ($item; $context.tradeTaxes)
		
		$path:="rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:ApplicableTradeTax["+String:C10($itemID)+"]"
		$ref:=DOM Find XML element:C864($DOM; $path)
		If (ok=0)
			
			
			$parentPath:="rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement"
			$parentRef:=DOM Find XML element:C864($DOM; $parentPath)
			
			$newStruct:=DOM Create XML Ref:C861("toBeRenamed")  //Error IF created straight as "ram:IncludedSupplyChainTradeLineItem")
			
			// the FIRST ApplicableTradeTax is at the FOURTH position in the ApplicableHeaderTradeSettlement
			// the SECOND ApplicableTradeTax is at the FIFTH position in the ApplicableHeaderTradeSettlement
			// This explains the $itemID+3 in the line below ($itemID shall be equal to 2)
			
			$ref:=DOM Insert XML element:C1083($parentRef; $newStruct; $itemID+3)  // +3 (see above)
			DOM CLOSE XML:C722($newStruct)
			DOM SET XML ELEMENT NAME:C867($ref; "ram:ApplicableTradeTax")  // rename now
			
			//$ref:=DOM Create XML element($DOM; $path)
			
			$ref:=DOM Create XML element:C865($DOM; $path+"/ram:CalculatedAmount")
			$ref:=DOM Create XML element:C865($DOM; $path+"/ram:TypeCode")
			$ref:=DOM Create XML element:C865($DOM; $path+"/ram:BasisAmount")
			$ref:=DOM Create XML element:C865($DOM; $path+"/ram:CategoryCode")
			$ref:=DOM Create XML element:C865($DOM; $path+"/ram:DueDateTypeCode")
			$ref:=DOM Create XML element:C865($DOM; $path+"/ram:RateApplicablePercent")
		End if 
		
		$col:=New collection:C1472()
		$col.push({xpath: $path+"/ram:CalculatedAmount"; value: $item.calculatedAmount})
		$col.push({xpath: $path+"/ram:TypeCode"; value: "VAT"})
		$col.push({xpath: $path+"/ram:BasisAmount"; value: $item.basisAmount})
		$col.push({xpath: $path+"/ram:CategoryCode"; value: "S"})
		$col.push({xpath: $path+"/ram:DueDateTypeCode"; value: 5})
		$col.push({xpath: $path+"/ram:RateApplicablePercent"; value: $item.rateApplicablePercent})
		
		For each ($element; $col)
			$ref:=DOM Find XML element:C864($DOM; $element.xpath)
			DOM SET XML ELEMENT VALUE:C868($ref; $element.value)
		End for each 
		
		$itemID+=1
	End for each 
	
	DOM EXPORT TO VAR:C863($DOM; $xmlText)
	
End if 
