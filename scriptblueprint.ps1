<#
    Powershell - Description of Script here

    Return codes:
#>

#region LocalTesting
<# 
#>
#endregion

#region ActionPreference
$ErrorActionPreference = [System.Management.Automation.ActionPreference]::SilentlyContinue
$VerbosePreference     = [System.Management.Automation.ActionPreference]::SilentlyContinue
#endregion
  
#region Script Variables
$ScriptPath            = if ($MyInvocation.MyCommand.Path) { $MyInvocation.MyCommand.Path } elseif ($psIse) { $psISE.CurrentFile.FullPath } elseif (Get-Location) { ((get-Location).path + '\*' | Get-ChildItem -Include *.ps1 | Select-Object FullName).FullName } else { Write-Error 'Could not get script path!' }
$ScriptFolder          = Split-Path -Path $ScriptPath
$ScriptTemp            = Join-Path  -Path $ScriptFolder -ChildPath 'temp'
$ScriptLogFolder       = Join-Path  -Path $ScriptFolder -ChildPath 'log'
$ScriptXml             = Join-Path  -Path $ScriptFolder -ChildPath ('{0}.xml' -f [System.IO.Path]::GetFileNameWithoutExtension($ScriptPath))
$ScriptStartDate       = Get-Date
$ScriptTranscript      = $true
#endregion
  
#region Start Transcript
if ($ScriptTranscript)
{
  $ScriptLogFile = Join-Path $ScriptLogFolder ('{0}_{1:yyyy-MM-dd_HHmmss.fff}.txt' -f [System.IO.Path]::GetFileNameWithoutExtension($ScriptPath), $ScriptStartDate)
    
  if (-not (Test-Path $ScriptLogFolder))
  {
    $null = mkdir $ScriptLogFolder
  }
  
  Start-Transcript -LiteralPath $ScriptLogFile  
}
#endregion

#Trace-Output for Transcript
function Trace-Output($txt)
{
  <# 

      This is only for Display in SARA

  #>
  
  Write-Host (Get-Date) : $txt
  return

}


#region Stop Transcript
if ($ScriptTranscript)
{
  Stop-Transcript
}
#endregion
Exit $exitcode