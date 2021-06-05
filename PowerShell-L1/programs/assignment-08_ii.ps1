# Get-Process gives us the list of running processes on the local machine.
# We are piping it's output to Where-Object which filters the stream as:-
# For each process in the stream (special $_ variable), if it's PID is >
# than 500, then it is passed along the output stream.

Get-Process | Where-Object {$_.HandleCount -gt 500}