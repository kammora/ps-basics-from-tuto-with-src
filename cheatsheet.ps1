# using pipes
$chromeProcesses = Get-Process `
| Where-Object { $_.Name -eq "chrome" } `
| Sort-Object cpu -Descending `
| Select-Object id, name

Get-Process | `
    Select-Object -First 1

# && || for ps > 7
Get-Process outlook -ErrorAction Ignore `
    || Write-Output "Outlook is not running."

# save content to csv file
# sorting
# selecting properties
get-process `
| Sort-Object CPU -Descending `
| Select-Object -First 10 name, cpu `
| Export-Csv -Path tenMostDemandingProcesses.csv

# show content of the file (equivalent for unix cat)
Get-Content -Path tenMostDemandingProcesses.csv
#get type of the object

$aNum = 2;
Get-Member $aNum;

# {} is script block
# ` new line character

# hashmap (key-value)
$hashmap = @{
    name    = "John"
    surname = "Doe"
};

$hashmap
$hashmap.name

$arr = 3 , 2, 1;

# print arr values and copy them into clipboard
$arr1 = 1..10;
$arr1 | ForEach-Object `
{ Write-Output "hello $_" } `
| Set-Clipboard

1..10 `
| ForEach-Object { Write-Output "hi $_" }

# ps config file
$profile

# get ps version
$PSVersionTable

# always press tab for intellisesnse

# create file or folder
new-item -ItemType Directory mydir

# create item with args in variable (and using references?)

$dirsettings = @{
    ItemType = "File"
    Path     = "."
}

1..3 | `
    ForEach-Object `
{ new-item -Name "get-item$_" $dirsettings }

# cd equivalent

Get-Location
Push-Location get-item1
Get-Location
Pop-Location
Get-LocalGroup

# functions

# weird type 
$weirdFunc = { param($text, $text1) Write-Output "$text $text1" }
&$weirdFunc haha lol

# standard function with hidden output same as redirect to /dev/null
function NormalFunc {
    param (
        $optional1,
        $optional2
    )

    $optional1 | Out-Null && Write-Output $optional1
    $optional2 || Return "Value 2 not found."
    $optional2 | Out-Null && Write-Output $optional2
    
}

if (Get-Process nonexisfsdfasf) {
    Write-Output "Never executed";
}

for ($i = 0; $i -lt $array.Count; $i++) {
    Write-Output "omg $i";
}

while (0 -eq 1) {
    Write-Output "Never executed.";
}