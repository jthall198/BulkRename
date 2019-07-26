$name;
$files;
$new_files;
$directory;
$placeholder;
$force = 0;
#detection of option arguments
function Show-OldAndNewNames {
    foreach ($name in $new_files){
        Write-Host "Old Name: $"
    }
}
if ($args.Count -lt 4)
{
    "Usage: .\BulkRename.ps1 -n <name> -l <location>";
    "Use the --help argument to get more information";
    exit;
}
for ($i = 0; $i -lt $args.Count; $i++) {
    if ($args[$i] -like "-n") {
        $name = $args[$i + 1]
    }
    elseIf ($args[$i] -like "-l") {
        $directory = $args[$i + 1];
        $files = Get-ChildItem $directory -Name;
    }
    elseIf ($args[$i] -like "-q") {
        $placeholder = $args[$i + 1];
    }
    elseIf ($args[$i] -like "-f") {
        $force = 1;
    }
}
$new_files = @($name) * $files.Count;
#detection of everything else
foreach ($arg in $args) {
    if ($arg -like "-num") {
        for($i = 0; $i -lt $new_files.Count; $i++) {
            [regex]$pattern = $placeholder;
            $new_files[$i]= $pattern.replace($new_files[$i], $i, 1);
        }
    }  
}
#printing and renaming
for ($i = 0; $i -lt $files.Count; $i++) {
    $new_file = $new_files[$i];
    $file = $files[$i];
    Show-OldAndNewNames
    if ($force -eq 0)
    {
        Write-Host "Is this alright?[yY/nN]";
        if (Read-Host -eq "n" -or Read-Host -eq "N")
        {
            Write-Host "Exiting...";
            Exit-PSHostProcess;
        }
    }
    Rename-Item -LiteralPath "$directory$file" -NewName "$new_file";
    Exit-PSHostProcess;
}