# Piping the output of Get-ChildItem, which returns the current directory contents,
# into Get-Member, which gives us the properties of the input object (System.IO.FileInfo)

Get-ChildItem | Get-Member
