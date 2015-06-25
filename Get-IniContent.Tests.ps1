$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "Get-IniContent" {

    # assert
    Context "Alias" {
        It "Get-IniContent alias should exist" {
            (Get-Alias -Definition Get-IniContent).name | Should Be "get-ini"
        }
    }

}
