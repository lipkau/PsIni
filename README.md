PsIni
=====

Persist a PowerShell hashtable as an INI file.

Based on code by Oliver Lipkau (http://oliver.lipkau.net/blog/):
 - Out-IniFile: http://gallery.technet.microsoft.com/scriptcenter/7d7c867f-026e-4620-bf32-eca99b4e42f4
 - Get-IniContent: http://gallery.technet.microsoft.com/ea40c1ef-c856-434b-b8fb-ebd7a76e8d91

Examples
========

Create a Hashtable and save it to C:\settings.ini:

``` powershell
PS> Import-Module PsIni
PS> $Category1 = @{“Key1”=”Value1”;”Key2”=”Value2”}
PS> $Category2 = @{“Key1”=”Value1”;”Key2”=”Value2”}
PS> $NewINIContent = @{“Category1”=$Category1;”Category2”=$Category2}
PS> Out-IniFile -InputObject $NewINIContent -FilePath "C:\settings.ini"
```

Results:

``` powershell
[Category1]
Key1=Value1
Key2=Value2

[Category2]
Key1=Value1
Key2=Value2
```
 
Returns the key "Key2" of the section "Category2" from the C:\settings.ini file:

``` powershell
PS>$FileContent = Get-IniContent "C:\settings.ini"
PS>$FileContent["Category2"]["Key2"]
Value2
```

Contributors
========

 - [Oliver Lipkau](http://oliver.lipkau.net/blog/)
