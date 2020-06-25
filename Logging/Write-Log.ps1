<# 
    Written by wimternet (https://github.com/wimternet)
    .SYNOPSIS  
        Log schrijven in het gevraagde bestand
    .PARAMETER Boodschap
        De boodschap die wordt opgeslagen
    .PARAMETER Bestand
        Het bestand waarin wordt geschreven
    .PARAMETER Duur
        Boolean om de snelheid te meten
    .EXAMPLE 
        Write-Log -Bestand C:\Log.txt -Boodschap "Taak gestart" [-Duur $true]
#>
function Write-Log
{
    [CmdletBinding()]
    Param
    (
        # Boodschap: De boodschap die moet worden getoond
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Boodschap,

        # Bestand: De locatie en bestandsnaam van het logbestand
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Bestand,

        # Duur: Boolean om de snelheid te tonen
        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=1)]
        [ValidateNotNullOrEmpty()]
        [bool]
        $Duur = $false
    )

    Begin
    {
        Write-Verbose 'Begin called'

        # Duur meegeven
        If ($Duur -and ($StartTime -ne $null))
        {
            # Duur berekenen
            $CurrentTime = (Get-Date).DateTime
            $Duurtijd = New-TimeSpan -Start $StartTime -End $CurrentTime

            # Duur toevoegen aan de boodschap
            $Boodschap = "(Duurtijd: " + $Duurtijd.Days + "d " + $Duurtijd.Hours + "u " + $Duurtijd.Minutes + "m " + $Duurtijd.Seconds + "s " + $Duurtijd.Milliseconds + "ms) " + $Boodschap
        }
    }
    Process
    {
        Write-Verbose 'Process called'
        
        # Regel opbouwen
        $time = (Get-Date).ToString()
        $message = $time + ": " + $Boodschap
        Add-Content -Path $Bestand -Value $message
    }
    End
    {
        Write-Verbose 'End called'
    }
}