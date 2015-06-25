$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "Out-IniFile" {

    Context "Alias" {

        # assert
        It "Out-IniFile alias should exist" {
            (Get-Alias -Definition Out-IniFile).name | Should Be "set-ini"        
        }

    }

}
