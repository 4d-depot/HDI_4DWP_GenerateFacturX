var $options : Object
var $file : Object

If (Form:C1466.trace)
	TRACE:C157
End if 


$options:={}
$options.facturX:={}
//$options.facturX.profile:="BASIC" // "guessed" from XML so, no need to fill
//$options.facturX.version:="1.0" // "1.0" is default value


$file:={}
//$file.name:="factur-x.xml" // default value for first file (factur-x/ZUGFeRD xml)
//$file.description:="Factur-X/ZUGFeRD Invoice"  // default value for first file ("factur-x/ZUGFeRD invoice")
//$file.mimeType:="text/xml" // can be guessed as well

If (Form:C1466.xmlFile.exists)  // {4} has been perfomed, so the file exists on disk
	$file.file:=Form:C1466.xmlFile
Else 
	$file.data:=Form:C1466.xml  // just built above //this is mandatory
End if 

//$file.relationship:="Data"

$options.files:=[$file]  // more files could be added, the first one is for facturX/ZUGFeDR

WP EXPORT DOCUMENT:C1337(Form:C1466.template; Form:C1466.facturxFile.platformPath; wk pdf:K81:315; $options)

SET TIMER:C645(-1)
