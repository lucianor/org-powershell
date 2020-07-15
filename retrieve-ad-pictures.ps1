Import-Module ActiveDirectory

if (Test-Path "users.txt") {

    $DirectoryToCreate = "Photos"
    if (-not (Test-Path -LiteralPath $DirectoryToCreate)) {
        try {
            New-Item -Path $DirectoryToCreate -ItemType Directory -ErrorAction Stop | Out-Null #-Force
        }
        catch {
            Write-Error -Message "Unable to create directory '$DirectoryToCreate'. Error was: $_" -ErrorAction Stop
        }
        Write-Output "Successfully created directory '$DirectoryToCreate'."
    }

    Import-Csv users.txt | Foreach-Object { 

        foreach ($property in $_.PSObject.Properties)
        {
            $user = $null

            try {
                $user = Get-ADUser -Identity $property.Value -Properties thumbnailPhoto -Server DOMAINSERVER.company.com
            } catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
                    Write-Output "Unable to find an user with NT user "+$property.Value
            } catch {
                Write-Output "Unable to connect to domain controller "+$property.Value
            }

            if ($user) {
                try {
                    $name = $DirectoryToCreate + "\\" + $user.sAMAccountName + ".jpg"
                    $user.thumbnailPhoto | Set-Content $name -Encoding byte
                    if ((Get-Item $name).length -cle 0kb)
                    {
                        Write-Output "User "+$user.sAMAccountName+" has no picture"
                        Remove-Item $name
                    }
                } catch { 
                    Write-Output "Error downloading picture for NT user "+$user.sAMAccountName
                }
            }
        }
    }
} else {
    Write-Output "You must have a users.txt file on the folder. Please create the file with one NT username line by line"
}