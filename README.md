# BulkRename
Simple Powershell 5.1 script to bulk rename files with options and arguments, built to be as customizable and extendable as possible
#Usage
.\BulkRename.ps1 -n "<name>" -l "<location>"
#Options and Arguments
-n "<name>" : Name to base individual file names off of
-l "<location>" : Folder location of files
-q "<placeholder>" : Placeholder to be replaced by one of the replacers
--force : Bypass new name verification prompt
#Replacer Usage
Replacers are used in BulkRename to create unique filenames for each of the files in your folder.
To use, give BulkRename a single placeholder and a replacer, and the first placeholder found in your name will be replaced using that replacer function
You can use multiple replacers in one script run, the placeholders in your name will be replaced in the order the replacers are entered into the script run

Example: .\BulkRename.ps1 -n "Base Name * - *" -l "C:\Users\User\File_Location\" -q "*" -num -num
Name Output: Base Name 0 - 0

Example: .\BulkRename.ps1 -n "Base Name * - *" -l "C:\Users\User\File_Location\" -q "*" -num
Name Output: Base Name 0 - *
#Replacers
-num <starting_number> : Replaces with a iterative number starting at 0 or an optional provided number 