$ScriptPath = $MyInvocation.MyCommand.Path
$ScriptDir = Split-Path -parent $ScriptPath
Import-Module "$ScriptDir\..\PsIni" -Force

Describe "PsIni" {

    # arrange
    $ini = "$TestDrive\Settings.ini"

    # values to be persisted
    $dictIn = New-Object System.Collections.Specialized.OrderedDictionary([System.StringComparer]::OrdinalIgnoreCase)
    $dictIn["Category1"] = New-Object System.Collections.Specialized.OrderedDictionary([System.StringComparer]::OrdinalIgnoreCase)
    $dictIn["Category1"]["Key1"] = "Value1"
    $dictIn["Category1"]["Key2"] = "Value2"
    $dictIn["Category2"] = New-Object System.Collections.Specialized.OrderedDictionary([System.StringComparer]::OrdinalIgnoreCase)
    $dictIn["Category2"]["Key3"] = "Value3"
    $dictIn["Category2"]["Key4"] = "Value4"

    Context "Writing INI" {

        # act
        $dictIn | Out-IniFile -FilePath $ini

        # assert
        It "creates a file" {
            # should exist
            Test-Path $ini | Should Be $true
        }

        # assert
        It "content matches expected value" {

            $content = "[Category1]`r`nKey1=value1`r`nKey2=Value2`r`n`r`n[Category2]`r`nKey3=Value3`r`nKey4=Value4`r`n`r`n"

            # http://powershell.org/wp/2013/10/21/why-get-content-aint-yer-friend
            Get-Content $ini | Out-String | Should Be $content

        }

    }

    Context "Reading INI" {

        # act
        Out-IniFile -inputobject $dictIn -filepath $ini
        $dictOut = Get-IniContent $ini

        # assert
        It "creates a OrderedDictionary from an INI file" {
            ($dictOut.GetType()) | Should Be System.Collections.Specialized.OrderedDictionary
        }

        # assert
        It "content matches original hashtable" {
            Compare-Object $dictIn $dictOut
        }

    }

}