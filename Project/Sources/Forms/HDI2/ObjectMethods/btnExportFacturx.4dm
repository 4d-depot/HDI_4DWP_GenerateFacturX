var $options : Object
var $file : Object

$options:={}
$options.facturX:={}
$options.facturX.profile:="BASIC"
$options.facturX.version:="1.0"



$file:={}
$file.name:="factur-x.xml"
$file.description:="Factur-X/ZUGFeRD Invoice"
$file.mimeType:="text/xml"
$file.data:=Form:C1466.xml  // just built above
$file.relationship:="Data"

$options.files:=[$file]  // more files could be added, the first one is for facturX/ZUGFeDR

WP EXPORT DOCUMENT:C1337(Form:C1466.template; Form:C1466.facturxFile.platformPath; wk pdf:K81:315; $options)

SET TIMER:C645(-1)
