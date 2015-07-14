<#
    .Synopsis
        This Module contains functions to manage INI files 

    .Description
        This Module contains functions to manage INI files 

    .Notes
        Author       : Oliver Lipkau <oliver@lipkau.net>
        Contributers : Craig Buchanan <https://github.com/craibuc>
                       Colin Bate <https://github.com/colinbate>

        Homepage     : http://lipkau.github.io/PsIni/
        
#>

$ScriptPath = $MyInvocation.MyCommand.Path
$PsIniModuleHome = split-path -parent $ScriptPath

. "$PsIniModuleHome\Functions\Get-IniContent.ps1"
Export-ModuleMember Get-IniContent
Set-Alias get-ini Get-IniContent
Export-ModuleMember -Alias get-ini

. "$PsIniModuleHome\Functions\Out-IniFile.ps1"
Export-ModuleMember Out-IniFile
Set-Alias set-ini Out-IniFile
Export-ModuleMember -Alias set-ini