# Collection all hosts from collection1
$sessionHostArr = Get-RDSessionHost -CollectionName Collection1

# Iterate through every Session Host of Collection1
foreach ($rdhost in $sessionHostArr) {
    $rdHostName = $rdhost.SessionHost
    
    # Copy wildcard certificate to a local path
    Copy-Item -Path C:\WildCard.pfx -Destination "\\$rdHostName\c$"
    # Import wildcard certificate into personal machine store
    Invoke-Command -ComputerName $rdHostName -ScriptBlock {
        $securePassword = ConvertTo-SecureString -AsPlainText -Force "Pa55w.rd"
        Import-PfxCertificate -Exportable -Password $securePassword `
            -CertStoreLocation Cert:\LocalMachine\My -FilePath C:\WildCard.pfx
    }
}