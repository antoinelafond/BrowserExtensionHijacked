$extensionID = “YOUR_EXTENSION_ID” # Replace with the actual extension ID

$userProfile = $env:USERPROFILE

$chromeExtensionsPath = “$userProfile\AppData\Local\Google\Chrome\User Data\Default\Extensions”
$edgeExtensionsPath = “$userProfile\AppData\Local\Microsoft\Edge\User Data\Default\Extensions”

function Remove-Extension {
param (
    [string]$browser,
    [string]$path
)
if (Test-Path -Path $path) {
    Remove-Item -Path $path -Recurse -Force
    Write-Host “$browser extension with ID ‘$extensionID’ has been removed successfully.”
} else {
    Write-Host “$browser extension with ID ‘$extensionID’ not found.”
}
}

$chromeExtensionPath = Join-Path -Path
$chromeExtensionsPath -ChildPath 
$extensionID
Remove-Extension -browser “Chrome”-path
$chromeExtensionPath

$edgeExtensionPath = Join-Path -Path
$edgeExtensionsPath -ChildPath $extensionID
Remove-Extension -browser “Edge” -path
$edgeExtensionPath
Write-Host “Script completed.”
