$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
# functions and tests stored in separate directories; adjusting dot-sourcing
. "$($here -replace 'Tests', 'Functions')\$sut"

Describe "Get-IniContent" {

    # assert
    Context "Alias" {
        It "Get-IniContent alias should exist" {
            (Get-Alias -Definition Get-IniContent).name | Should Be "get-ini"
        }
    }

}