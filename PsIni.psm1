<#
.Description
    Convert hashtable to INI file and back.
.Homepage
    http://lipkau.github.io/PsIni/
#>

Write-Host "Importing module PsIni..."

#
# load (dot-source) *.PS1 files, excluding unit-test scripts (*.Tests.*), and disabled scripts (__*)
#
Get-ChildItem "$PSScriptRoot\*.ps1" | 
    Where-Object { $_.Name -like '*.ps1' -and $_.Name -notlike '__*' -and $_.Name -notlike '*.Tests*' } | 
    % { . $_ }

Export-ModuleMember Get-IniContent
Export-ModuleMember -Alias get-ini

Export-ModuleMember Out-IniFile
Export-ModuleMember -Alias set-ini