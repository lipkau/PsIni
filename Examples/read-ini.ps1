# reconstitute a Hashtable from INI file and read a value

$content = Get-IniContent .\settings.ini
$content["category2"]["key4"]