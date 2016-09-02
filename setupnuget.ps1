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
$storageDir = $pwd
$webclient = New-Object System.Net.WebClient
$url = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$file = "$storageDir\nuget.exe"
$webclient.DownloadFile($url,$file)