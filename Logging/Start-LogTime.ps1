<# 
    Written by wimternet (https://github.com/wimternet)
    .SYNOPSIS  
        Starttijd opslaan om de snelheid van script te meten
    .EXAMPLE 
        Start-LogTime
#>
function Start-LogTime
{
    Begin
    {
        Write-Verbose 'Begin called'

        # Tijd opslaan
        $script:StartTime = (Get-Date).DateTime
    }
    Process
    {
        Write-Verbose 'Process called'
    }
    End
    {
        Write-Verbose 'End called'
    }
}