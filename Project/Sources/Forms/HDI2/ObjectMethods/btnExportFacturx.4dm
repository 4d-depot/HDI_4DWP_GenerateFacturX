var $options : Object
var $fileInfo : Object

If (Form:C1466.trace)
	TRACE:C157
End if 

$options:={}
$fileInfo:={}

Case of 
		
	: (Form:C1466.templateLanguage="french")
		
		$options.facturX:={}
		$options.facturX.profile:="BASIC"  // "guessed" from XML so, no need to fill
		$options.facturX.version:="1.0"  // "1.0" is default value
		
		$fileInfo.name:="factur-x.xml"  // default value for first file (factur-x/ZUGFeRD xml)
		$fileInfo.description:="Factur-X/ZUGFeRD Invoice"  // default value for first file ("factur-x/ZUGFeRD invoice")
		$fileInfo.mimeType:="text/xml"  // can be guessed as well
		$fileInfo.relationship:="Data"
		
		If (Form:C1466.xmlFile.exists)  // {4} has been perfomed, so the file exists on disk
			$fileInfo.file:=Form:C1466.xmlFile
		Else 
			$fileInfo.data:=Form:C1466.xml  // just built above //this is mandatory
		End if 
		
	: (Form:C1466.templateLanguage="german")
		
		$options.facturX:={}
		$options.facturX.profile:="RECHNUNG"  // "guessed" from XML so, no need to fill
		$options.facturX.version:="2.1"
		
		$fileInfo.name:="rechnung.xml"
		$fileInfo.description:="Factur-X/ZUGFeRD Invoice"
		$fileInfo.mimeType:="text/xml"
		$fileInfo.relationship:="Alternative"
		
		If (Form:C1466.xmlFile.exists)  // {4} has been perfomed, so the file exists on disk
			$fileInfo.file:=Form:C1466.xmlFile
		Else 
			$fileInfo.data:=Form:C1466.xml  // just built above //this is mandatory
		End if 
		
End case 


$options.files:=[$fileInfo]  // more files could be added, the first one is for facturX/ZUGFeDR

WP EXPORT DOCUMENT:C1337(Form:C1466.template; Form:C1466.facturxFile.platformPath; wk pdf:K81:315; $options)

SET TIMER:C645(-1)
