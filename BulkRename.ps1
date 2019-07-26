<<<<<<< HEAD
$name;
$files;
$new_files;
$directory;
$placeholder;
$force = 0;
#detection of option arguments
function Show-OldAndNewNames {
    for ($i = 0; $i -lt $files.Count; $i++) {
        "Old Name: " + $files[$i] + " New Name: " + $new_files[$i]
    }
}
if ($args.Count -lt 4)
{
    "Usage: .\BulkRename.ps1 -n <name> -l <location>"
    "Use the --help argument to get more information"
    exit;
}
for ($i = 0; $i -lt $args.Count; $i++) {
    if ($args[$i] -like "-n") {
        $name = $args[$i + 1]
    }
    elseIf ($args[$i] -like "-l") {
        $directory = $args[$i + 1]
        $files = Get-ChildItem $directory -Name
    }
    elseIf ($args[$i] -like "-q") {
        $placeholder = $args[$i + 1]
    }
    elseIf ($args[$i] -like "-f") {
        $force = 1
    }
}
$new_files = @($name) * $files.Count;
#detection of everything else
foreach ($arg in $args) {
    if ($arg -like "-num") {
        for($i = 0; $i -lt $new_files.Count; $i++) {
            [regex]$pattern = $placeholder
            $new_files[$i]= $pattern.replace($new_files[$i], $i, 1)
        }
    }  
}
Show-OldAndNewNames
if ($force -eq 0)
{
    $response = Read-Host "Is this alright? [yY/nN]"
    if ($response -ne "y" -or $response -ne "Y")
    {
        Write-Host "Exiting..."
        exit
    }
}
#renaming
for ($i = 0; $i -lt $files.Count; $i++) {
    $new_file = $new_files[$i]
    $file = $files[$i]
    Rename-Item -LiteralPath "$directory\$file" -NewName "$new_file"
=======
$name;
$files;
$new_files;
$directory;
$placeholder;
$force = 0;
#detection of option arguments
function Show-OldAndNewNames {
    for ($i = 0; $i -lt $files.Count; $i++) {
        "Old Name: " + $files[$i] + " New Name: " + $new_files[$i]
    }
}
if ($args.Count -lt 4)
{
    "Usage: .\BulkRename.ps1 -n <name> -l <location>"
    "Use the --help argument to get more information"
    exit;
}
for ($i = 0; $i -lt $args.Count; $i++) {
    if ($args[$i] -like "-n") {
        $name = $args[$i + 1]
    }
    elseIf ($args[$i] -like "-l") {
        $directory = $args[$i + 1]
        $files = Get-ChildItem $directory -Name
    }
    elseIf ($args[$i] -like "-q") {
        $placeholder = $args[$i + 1]
    }
    elseIf ($args[$i] -like "-f") {
        $force = 1
    }
}
$new_files = @($name) * $files.Count;
#detection of everything else
foreach ($arg in $args) {
    if ($arg -like "-num") {
        for($i = 0; $i -lt $new_files.Count; $i++) {
            [regex]$pattern = $placeholder
            $new_files[$i]= $pattern.replace($new_files[$i], $i, 1)
        }
    }  
}
Show-OldAndNewNames
if ($force -eq 0)
{
    $response = Read-Host "Is this alright? [yY/nN]"
    if ($response -ne "y" -or $response -ne "Y")
    {
        Write-Host "Exiting..."
        exit
    }
}
#renaming
for ($i = 0; $i -lt $files.Count; $i++) {
    $new_file = $new_files[$i]
    $file = $files[$i]
    Rename-Item -LiteralPath "$directory\$file" -NewName "$new_file"
>>>>>>> 22a0c71db8a6543b3f4f625378b7d14c96c03e3d
}