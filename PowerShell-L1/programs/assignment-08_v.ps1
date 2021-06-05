# Get-Process returns the list of all processes in the local machine.
# We are piping its output to Sort-Object which sorts this collection using ID as key
# Next, we pipe that to Select-Object to limit the count of displayed results to last 10.

Get-Process | Sort-Object Id | Select-Object -Last 10