configuration Testdatei
{
    # One can evaluate expressions to get the node list
    # E.g: $AllNodes.Where("Role -eq Web").NodeName
    node localhost
    {
        WindowsFeature Windows-Server-Backup
        {
           Ensure = "Present"
           Name   = "Windows-Server-Backup"
        }

        File TestDatei
        {
            Ensure          = "Present"
            DestinationPath = "C:\Temp"
            Type            = "Directory"
            DependsOn       = "[WindowsFeature]Windows-Server-Backup"
        }       
    }
}


Testdatei -OutputPath C:\testdatei
Start-DscConfiguration -Path C:\testdatei -Wait -Force -Verbose