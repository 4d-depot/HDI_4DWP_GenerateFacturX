//%attributes = {}
var $options : Object
var $fileInfo : Object
var $document : Object

$document:=WP New:C1317

$options:={}  // empty object
$options[wk files:K81:381]:=[]  // empty collection

// 1st file (based on .file)
$fileInfo:={}
$fileInfo.description:="RTF formated text"
$fileInfo.file:=File:C1566(Folder:C1567(fk data folder:K87:12).path+"Alpha.rtf")
$options[wk files:K81:381].push($fileInfo)

// 2nd file  (based on .file)
$fileInfo:={}
$fileInfo.description:="Png picture"  // default value for first file ("factur-x/ZUGFeRD invoice")
$fileInfo.file:=File:C1566(Folder:C1567(fk data folder:K87:12).path+"Bravo.png")
$options[wk files:K81:381].push($fileInfo)

// 3rd file (based on .data)
$fileInfo:={}
$fileInfo.name:="Charlie.txt"  // default value for first file (factur-x/ZUGFeRD xml)
$fileInfo.description:="raw text sent as data"  // default value for first file ("factur-x/ZUGFeRD invoice")
$fileInfo.data:="This is some raw text to be included as enclosure in the PDF and to be extracted as 'Charlie.txt'"
$options[wk files:K81:381].push($fileInfo)

WP EXPORT DOCUMENT:C1337($document; "withEnclosures.pdf"; wk pdf:K81:315; $options)

