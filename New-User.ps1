try {
    Import-Module ActiveDirectory -ErrorAction Stop
}
catch [System.Management.Automation.ActionPreferenceStopException] {
    "No Such Module...exiting!!!"
}

cls
Write-Host "ADATUM USER CREATOR"
Write-Host "==================="
Write-Host ""

$arr = "Frank Rost","Oliver Baumann","Oliver Reck"

foreach ($th in $arr)
{
    #$name = Read-Host -Prompt "Please enter given and surname for your user"
    $name = $th

    $givenName = ($name -split " ")[0]
    $surName = ($name -split " ")[1]

    $userName = $surName + $givenName.Substring(0,2)

    New-ADUser -DisplayName $name -Surname $surName -GivenName $givenName `
        -UserPrincipalName "$userName@adatum.com" -SamAccountName $userName `
        -AccountPassword (ConvertTo-SecureString -AsPlainText -Force "Pa55w.rd") `
        -Name $userName -Enabled $true

}