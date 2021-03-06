# Variables
New-Variable -Name StartTime -Scope Script -Force

# Loading functions
Get-ChildItem -Path $PSScriptRoot | Unblock-File
Get-ChildItem -Path $PSScriptRoot\*.ps1 | Foreach-Object{ . $_.FullName }

# Create alias
#New-Alias Install-WindowsUpdate Get-WUInstall

# Export functions
Export-ModuleMember -Function * -Alias *