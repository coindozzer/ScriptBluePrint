# Script Blue Print

This Blue print is a nice frame for your scripts 

## installation

Works with PS Version 2.0+
Works the Consol, ISE and Visual Studio Code

## Usage

Create a new PS file and copy the frame in it.

By defaul the scrip creates an log file in the log folder

Set this to $False if you want to disable logging
``` powershell
$ScriptTranscript      = $true
```

if you want to add self written stuff to the log use the Trace-Output($txt) fuction

``` powershell
Trace-Output("Test")
```

Things displayed in the console getting into the log by default.

IMPORTANT

don't forget to set the stop transcript at the very end of your script

``` powershell
#region Stop Transcript
if ($ScriptTranscript)
{
  Stop-Transcript
}
#endregion
Exit $exitcode
```

## Contirbuting

pull requestes are welcome.

## License

feel free to use it, i'm happy to help