var $info : cs:C1710.INFOSelection

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		$info:=ds:C1482.INFO.all().orderBy("pageNumber")
		Form:C1466.tabs:=New object:C1471("values"; $info.extract("tabTitle"); "index"; 0)
		
		WParea:=ds:C1482.INFO.all().first().wp
		
		Form:C1466.trace:=False:C215
		
		Form:C1466.xmlFile:=File:C1566(Folder:C1567(fk database folder:K87:14).path+"facturxml.xml")
		If (Form:C1466.xmlFile.exists)
			Form:C1466.xmlFile.delete()
		End if 
		Form:C1466.facturxFile:=File:C1566(Folder:C1567(fk database folder:K87:14).path+"facturxSample.pdf")
		If (Form:C1466.facturxFile.exists)
			Form:C1466.facturxFile.delete()
		End if 
		
		Form:C1466.context:={}
		Form:C1466.xml:=""
		Form:C1466.contextSet:=False:C215
		
		Form:C1466.validationURL:="https://services.fnfe-mpe.org/account/home"
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Page Change:K2:54)
		
		WParea:=ds:C1482.INFO.query("pageNumber = :1"; FORM Get current page:C276).first().wp
		
		
	: (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		
		
		OBJECT SET ENABLED:C1123(*; "btnSetContext"; Not:C34(OB Is empty:C1297(Form:C1466.context)))
		
		OBJECT SET ENABLED:C1123(*; "btnBuildXML"; Form:C1466.contextSet)
		
		OBJECT SET ENABLED:C1123(*; "btnExportXML"; Form:C1466.xml#"")
		OBJECT SET ENABLED:C1123(*; "btnExportFacturx"; Form:C1466.xml#"")
		
		OBJECT SET ENABLED:C1123(*; "btnValidateXML"; Form:C1466.xmlFile.exists)
		OBJECT SET ENABLED:C1123(*; "btnValidateFacturx"; Form:C1466.facturxFile.exists)
		
End case 

