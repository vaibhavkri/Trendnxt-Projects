$MyVar1 = "This is a number: "
$MyVar2 = 6
Write-Host($MyVar1 + $MyVar2)

$thisDate = Get-Date
$myarray1 = 3, 6, 9
$myarray2 = "Sidd", "Rajdeep", "Subho"
$myhash = @{1="One"; 2="Two"; 3="Three"}

$myProcess = Get-Process
# $myProcess.GetType()
# Write-Host $myProcess
foreach($process in $myProcess) {
    Write-Host $process
}
