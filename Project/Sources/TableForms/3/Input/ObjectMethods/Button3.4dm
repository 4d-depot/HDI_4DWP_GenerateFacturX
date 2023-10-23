//This context is saved in the [Invoices]context field
//The french sample is ready

var $c; $item; $tax : Object


Case of 
	: ([Invoices:3]name:2="French sample")
		
		[Invoices:3]context:3:={}
		$c:=[Invoices:3]context:3
		
		$c.invoice:=New object:C1471
		$c.invoice.ID:="AC-2023-1234"
		$c.invoice.date:=!2023-08-31!
		$c.invoice.dueDate:=!2023-09-30!
		$c.invoice.content:="Franco de port (commande > 100 € HT)"
		$c.invoice.buyerIssuerAssignedID:="PO445"
		$c.invoice.contractIssuerAssignedID:="12345"
		
		
		$c.invoice.lineTotalAmount:=165
		$c.invoice.taxBasisTotalAmount:=165
		$c.invoice.taxTotalAmount:=15.6
		$c.invoice.grandTotalAmount:=180.6
		$c.invoice.totalPrepaidAmount:=100
		$c.invoice.duePayableAmount:=80.6
		$c.invoice.currencyCode:="EUR"
		$c.invoice.typeCode:=30  // see ram:TypeCode
		$c.invoice.dateTimeStringFormat:=102
		
		$c.seller:=New object:C1471
		$c.seller.name:="Alpha desk"
		$c.seller.address:="48 rue des oliviers"
		$c.seller.zipCode:="75018"
		$c.seller.city:="Paris"
		$c.seller.countryID:="FR"
		$c.seller.tva:="FR11999999998"
		$c.seller.siret:="99999999800010"
		$c.seller.ape:="4778C"
		$c.seller.type:="SARL au capital de 120 000,00 €"
		$c.seller.country:="France"
		$c.seller.phone:="(33)1 45 89 78 12"
		$c.seller.email:="contact@alpha-cars.fr"
		$c.seller.web:="http://www.alpha-cars.fr"
		$c.seller.bank:=New object:C1471
		$c.seller.bank.name:="Crédit du Lion"
		$c.seller.bank.iban:="TOC 844 456 258 123"
		$c.seller.bank.bic:="LION 8714"
		
		$c.buyer:=New object:C1471
		$c.buyer.name:="Visa plus"
		$c.buyer.address:="12 rue Bleue"
		$c.buyer.zipCode:="69001"
		$c.buyer.city:="Lyon"
		$c.buyer.countryID:="FR"
		$c.buyer.tva:="FR19787878784"
		$c.buyer.siret:="78787878400035"
		$c.buyer.siret:=""
		$c.buyer.ape:=""
		$c.buyer.type:=""
		$c.buyer.country:="France"
		$c.buyer.phone:="(33)4 33 44 56 78"
		$c.buyer.email:="contact@visa-plus.fr"
		$c.buyer.web:="http://www.visa-plus.fr"
		
		$c.items:=New collection:C1472  // item collections
		
		$item:=New object:C1471
		//$item.globalID:="123"
		//$item.schemeID:="321"
		$item.name:="flash drive"
		$item.chargeAmount:=10.5
		$item.billedQuantity:=10
		$item.unitCode:="LTR"
		$item.rateApplicablePercent:=5.5
		$item.lineTotalAmount:=105
		$c.items.push($item)
		
		$item:=New object:C1471
		//$item.globalID:="745"
		//$item.schemeID:="547"
		$item.name:="USB-C wire"
		$item.chargeAmount:=3
		$item.billedQuantity:=5
		$item.unitCode:="LTR"
		$item.rateApplicablePercent:=5.5
		$item.lineTotalAmount:=15
		$c.items.push($item)
		
		$item:=New object:C1471
		//$item.globalID:="912"
		//$item.schemeID:="219"
		$item.name:="Tea mug"
		$item.chargeAmount:=4.5
		$item.billedQuantity:=10
		$item.unitCode:="LTR"
		$item.rateApplicablePercent:=20
		$item.lineTotalAmount:=45
		$c.items.push($item)
		
		$c.tradeTaxes:=New collection:C1472  // tax rates collections
		
		$tax:=New object:C1471
		$tax.rateApplicablePercent:=20
		$tax.basisAmount:=45
		$tax.calculatedAmount:=9
		$c.tradeTaxes.push($tax)
		
		$tax:=New object:C1471
		$tax.rateApplicablePercent:=5.5
		$tax.basisAmount:=120
		$tax.calculatedAmount:=6.6
		$c.tradeTaxes.push($tax)
		
	: ([Invoices:3]name:2="German sample")
		
		$c:=[Invoices:3]context:3
		
		$c:=[Invoices:3]context:3
		$c.invoice.date:=!2023-08-31!
		$c.invoice.dueDate:=!2023-09-30!
		
	Else 
		ALERT:C41("Only french and german samples so far…")
End case 


