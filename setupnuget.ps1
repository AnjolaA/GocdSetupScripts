#Create Tools folder if it doesnt already exits

If (Test-Path C:\Tools){
cd C:\Tools
echo Welcome
}Else{
cd C:\
mkdir Tools
echo Folder Created
cd Tools
}
Remove-Item "C:\Tools\*"

# Setup Nuget

$storageDir = $pwd
$webclient = New-Object System.Net.WebClient
$url = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$file = "$storageDir\nuget.exe"
$webclient.DownloadFile($url,$file)

# Setup NUnit


$nunit_url = "https://github.com/nunit/nunit/releases/download/3.4.1/NUnit-3.4.1.zip"
$nunit_file = "$storageDir\NUnit-3.4.1.zip"
$webclient.DownloadFile($nunit_url,$nunit_file)


Add-Type -assembly “system.io.compression.filesystem”

[io.compression.zipfile]::ExtractToDirectory($nunit_file, $storageDir)

Remove-Item $nunit_file
echo Nuget and Nunit Setup complete