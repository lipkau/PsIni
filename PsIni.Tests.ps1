$here = Split-Path -Parent $MyInvocation.MyCommand.Path

Import-Module PsIni -Force

Describe "I/O" {

    $ini = Join-Path $TestDrive "\Settings.ini"

    # hash to be persisted and validated
    $category1=@{"key1"="value1";"key2"="value2"}
    $category2=@{"key3"="value3";"key4"="value4"}

    $hashIn=@{"category1"=$category1;"category2"=$category2}
    # Write-Host "hashIn: $($hashIn.GetType().FullName)"

    Context "Writing INI" {

        Out-IniFile -inputobject $hashIn -filepath $ini

        It "creates a file" {
            # should exist
            Test-Path $ini | Should Be $true
        }

        It "content matches expected value" {

            $content = "[category1]`r`nkey1=value1`r`nkey2=value2`r`n[category2]`r`nkey3=value3`r`nkey4=value4`r`n"

            # http://powershell.org/wp/2013/10/21/why-get-content-aint-yer-friend
            Get-Content $ini | Out-String | Should Be $content

        }

    }

    Context "Reading INI" {

        Out-IniFile -inputobject $hashIn -filepath $ini
        $hashOut = Get-IniContent $ini
        # Write-Host "hashOut: $($hashOut.GetType().FullName)"

        It "creates a hashtable from an INI file" {
            # ($hashOut.GetType()) | Should Be $hashIn.GetType()
            ($hashOut.GetType()) | Should Be hashtable
        }

        It "content matches original hashtable" {
            Compare-Object $hashIn $hashOut
        }

    }

}

Describe "Aliases" {

    It "Get-IniContent alias should exist" {
        (Get-Alias -Definition Get-IniContent).name | Should Be "get-ini"
    }

    It "Out-IniFile alias should exist" {
        (Get-Alias -Definition Out-IniFile).name | Should Be "set-ini"        
    }

}