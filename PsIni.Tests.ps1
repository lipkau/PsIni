Import-Module PsIni -Force

Describe "PsIni" {

    # arrange
    $ini = Join-Path $TestDrive "\Settings.ini"

    # hash to be persisted and validated
    $category1=@{"key1"="value1";"key2"="value2"}
    $category2=@{"key3"="value3";"key4"="value4"}

    $hashIn=@{"category1"=$category1;"category2"=$category2}

    Context "Writing INI" {

        # act
        Out-IniFile -inputobject $hashIn -filepath $ini

        # assert
        It "creates a file" {
            # should exist
            Test-Path $ini | Should Be $true
        }

        # assert
        It "content matches expected value" {

            $content = "[category1]`r`nkey1=value1`r`nkey2=value2`r`n[category2]`r`nkey3=value3`r`nkey4=value4`r`n"

            # http://powershell.org/wp/2013/10/21/why-get-content-aint-yer-friend
            Get-Content $ini | Out-String | Should Be $content

        }

    }

    Context "Reading INI" {

        # act
        Out-IniFile -inputobject $hashIn -filepath $ini
        $hashOut = Get-IniContent $ini

        # assert
        It "creates a hashtable from an INI file" {
            ($hashOut.GetType()) | Should Be hashtable
        }

        # assert
        It "content matches original hashtable" {
            Compare-Object $hashIn $hashOut
        }

    }

}
