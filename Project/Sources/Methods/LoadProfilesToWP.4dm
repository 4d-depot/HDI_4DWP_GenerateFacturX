//%attributes = {}
var $folder : 4D:C1709.Folder
var $profile : 4D:C1709.File
var $file : 4D:C1709.File

var $files : Collection

$folder:=Folder:C1567("/RESOURCES/Profiles/")

$files:=$folder.files()

For each ($file; $files)
	
	$profile:=ds:C1482.Profiles.new()
	
	$profile.name:=Substring:C12($file.name; 5)
	
	$profile.wp:=WP New:C1317
	WP SET TEXT:C1574($profile.wp; $file.getText(); wk replace:K81:177)
	
	$profile.save()
	
End for each 
