<# 
    .SYNOPSIS  
        Log schrijven in het gevraagde bestand
    .PARAMETER Boodschap
        De boodschap die wordt opgeslagen
    .PARAMETER Bestand
        Het bestand waarin wordt geschreven
    .EXAMPLE 
        Write-Log -Bestand C:\Log.txt -Boodschap "Taak gestart"
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
        $Bestand
    )

    Begin
    {
        Write-Verbose 'Begin called'
    }
    Process
    {
        Write-Verbose 'Process called'
        
        $time = (Get-Date).ToString()
        $message = $time + ": " + $Boodschap
        Add-Content -Path $Bestand -Value $message
    }
    End
    {
        Write-Verbose 'End called'
    }
}