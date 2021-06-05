$logmsg = Read-Host "Enter the log message"
$dbglvl = Read-Host "Enter the debug level"
$timestamp = Get-Date -Format "ddmmyyyy:hhmmss:"
$targetLogFile = $null

$rules = Get-Content .\logrules.txt

foreach($rule in $rules) {
    if($rule.Split(" ")[0] -eq $dbglvl) {
        $targetLogFile = $rule.Split(" ")[1]
        break
    }
}

if($targetLogFile -eq $null) {
    "That debug level does not exist."
}
else {
    $logLine = "{0} {1} {2}" -f $timestamp, $dbglvl, $logmsg
    Add-Content $targetLogFile $logLine
}
