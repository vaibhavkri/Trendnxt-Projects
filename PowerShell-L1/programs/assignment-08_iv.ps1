# Get-PSDrive returns the list of all drives.
# We are piping its output to ForEach-Object which performs the given
# operation on each item of the collection ($_.Name).

Get-PSDrive | ForEach-Object {$_.Name}