$homeFolder = New-Item c:\home1 -ItemType Directory

New-SmbShare -Name $homeFolder.Name -Path $homeFolder.FullName -FullAccess Administrators `
    -ChangeAccess Users