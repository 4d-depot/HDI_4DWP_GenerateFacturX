var $info : cs:C1710.INFOSelection

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		$info:=ds:C1482.INFO.all().orderBy("pageNumber")
		Form:C1466.tabs:=New object:C1471("values"; $info.extract("tabTitle"); "index"; 0)
		
		WParea:=ds:C1482.INFO.all().first().wp
		
		Form:C1466.trace:=True:C214
		
	: (Form event code:C388=On Page Change:K2:54)
		
		WParea:=ds:C1482.INFO.query("pageNumber = :1"; FORM Get current page:C276).first().wp
		
End case 

