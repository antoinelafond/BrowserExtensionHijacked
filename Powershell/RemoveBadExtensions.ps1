
# Define the path to the Chrome extensions folder for the found user
$chromeExtensionsPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Extensions"
# List of extension IDs to remove
$extensionsToRemove = @(
    "dpggmcodlahmljkhlmpgpdcffdaoccni",
    "nnpnnpemnckcfdebeekibpiijlicmpom",
    "kkodiihpgodmdankclfibbiphjkfdenh",
    "oaikpkmjciadfpddlpjjdapglcihgdle",
    "acmfnomgphggonodopogfbmkneepfgnh",
    "mnhffkhmpnefgklngfmlndmkimimbphc",
    "befflofjcniongenjmbkgkoljhgliihe",
    "cedgndijpacnfbdggppddacngjfdkaca",
    "nnpnnpemnckcfdebeekibpiijlicmpom",
    "dpggmcodlahmljkhlmpgpdcffdaoccni",
    "egmennebgadmncfjafcemlecimkepcle",
    "acmfnomgphggonodopogfbmkneepfgnh",
    "cplhlgabfijoiabgkigdafklbhhdkahj",
    "gadbpecoinogdkljjbjffmiijpebooce",
    "oaikpkmjciadfpddlpjjdapglcihgdle",
    "kkodiihpgodmdankclfibbiphjkfdenh",
    "oeiomhmbaapihbilkfkhmlajkeegnjhe"
)
# Remove the extensions
foreach ($extensionId in $extensionsToRemove) {
    $extensionPath = Join-Path -Path $chromeExtensionsPath -ChildPath $extensionId
    if (Test-Path $extensionPath) {
        Remove-Item -Path $extensionPath -Recurse -Force
        Write-Host "Extension $extensionId removed."
    } else {
        Write-Host "Extension $extensionId not found."
    }
}
