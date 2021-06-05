# Get-Command -Type Cmdlet: Get the collection of all the cmdlets.
# ForEach-Object {$_.ParameterSets}: For each cmdlet, get the collection of ParameterSets.
# ForEach-Object {$_.Parameter}: For each ParameterSet, get the collection of Parameters.
# ForEach-Object {$_.Name}: For each Parameters, get the collection of its names.

Get-Command -Type Cmdlet | ForEach-Object {$_.ParameterSets} | ForEach-Object {$_.Parameters} | ForEach-Object {$_.Name}