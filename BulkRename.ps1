$name
$files
$new_files
$directory
$placeholder
$num_start_from
$force = 0
#detection of option arguments
function Show-OldAndNewNames {
    for ($i = 0; $i -lt $files.Count; $i++) {
        "Old Name: " + $files[$i].PadRight(($files | Measure-Object -Maximum -Property Length).Maximum, " ") + " New Name: " + $new_files[$i] #pads out old name then displays
    }
}
if ($args.Count -lt 4) {
    "Usage: .\BulkRename.ps1 -n <name> -l <location>"
    "Use the --help argument to get more information"
    exit
}
for ($i = 0; $i -lt $args.Count; $i++) {
    #argument handling
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
    elseIf ($args[$i] -like "--force") {
        $force = 1
    }
}
$new_files = @($name) * $files.Count;
#detection of everything else
    for ($i = 0; $i -lt $new_files.Count; $i++) {
        if ($args.Contains("-num")) {
            $num_start_from = $args[$args.IndexOf("-num")+1]
            [regex]$pattern = $placeholder
            $new_files[$i] = $pattern.replace($new_files[$i], $i + $num_start_from, 1)
        }
    }  

Show-OldAndNewNames
if ($force -eq 0) {
    $response = Read-Host "Is this alright? [yY/nN]"
    if ($response -ne "y" -or $response -ne "Y") {
        "Exiting..."
        exit
    }
}
#renaming
for ($i = 0; $i -lt $files.Count; $i++) {
    $new_file = $new_files[$i]
    $file = $files[$i]
    Rename-Item -LiteralPath "$directory\$file" -NewName "$new_file"
}