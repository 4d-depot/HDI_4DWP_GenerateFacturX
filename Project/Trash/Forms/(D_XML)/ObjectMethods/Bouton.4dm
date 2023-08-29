var $file : 4D:C1709.File
var $folder : 4D:C1709.Folder
var $xmlText : Text

$folder:=Folder:C1567(Folder:C1567(fk resources folder:K87:11).path+"Profiles")
$file:=File:C1566($folder.path+"xml_basic.xml")

Form:C1466.xmlDOM:=DOM Parse XML source:C719($file.platformPath)

DOM EXPORT TO VAR:C863(Form:C1466.xmlDOM; $xmlText)
Form:C1466.xmlText:=$xmlText
