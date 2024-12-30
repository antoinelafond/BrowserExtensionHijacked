
# Define the path to the Chrome extensions folder for the found user
$chromeExtensionsPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Extensions"
# List of extension IDs to remove
$extensionsToRemove = @{
    "dpggmcodlahmljkhlmpgpdcffdaoccni" = "1.1.1"  # Internxt VPN
    "nnpnnpemnckcfdebeekibpiijlicmpom" = "2.0.1"  # VPNCity
    "kkodiihpgodmdankclfibbiphjkfdenh" = "1.16.2" # Parrot Talks
    "oaikpkmjciadfpddlpjjdapglcihgdle" = "1.0.12" # Uvoice
    "acmfnomgphggonodopogfbmkneepfgnh" = "4.00"   # Bookmark Favicon Changer
    "mnhffkhmpnefgklngfmlndmkimimbphc" = "4.40"   # Castorus 
    "befflofjcniongenjmbkgkoljhgliihe" = "2.13.0" # TinaMind - The GPT-4o-powered AI Assistant! 
    "cedgndijpacnfbdggppddacngjfdkaca" = "0.0.11" # Wayin AI 
    "egmennebgadmncfjafcemlecimkepcle" = "2.2.7"  # VidHelper - Video Downloader
    "cplhlgabfijoiabgkigdafklbhhdkahj" = "1.0.161"# Vidnoz Flex - Video recorder & Video share
    "oeiomhmbaapihbilkfkhmlajkeegnjhe" = "3.18.0" # Primus (prev. PADO)
    "bbdnohkpnbkdkmnkddobeafboooinpla" = "1.0.1"  # Search Copilot AI Assistant for Chrome
    "bibjgkidgpfbblifamdlkdlhgihmfohh" = "0.1.3"  # AI Assistant - ChatGPT and Gemini for Chrome 
    "pkgciiiancapdlpcbppfkmeaieppikkk" = "1.3.7"  # Bard AI chat
    "llimhhconnjiflfimocjggfjdlmlhblm" = "1.5.7"  # Reader Mode
    "ekpkdmohpdnebfedjjfklhpefgpgaaji" = "1.3.0"  # Tackker - online keylogger tool
    "epikoohpebngmakjinphfiagogjcnddm" = "2.7.5"  # AI Shop Buddy
    "miglaibdlgminlepgeifekifakochlka" = "1.4.5"  # Sort by Oldest 
    
    }

# Remove the extensions if the version matches
foreach ($extensionId in $extensionsToRemove.Keys) {
    $extensionPath = Join-Path -Path $chromeExtensionsPath -ChildPath $extensionId
    if (Test-Path $extensionPath) {
        # Check for the version
        $manifestPath = Join-Path -Path $extensionPath -ChildPath "manifest.json"
        if (Test-Path $manifestPath) {
            $manifest = Get-Content -Path $manifestPath -Raw | ConvertFrom-Json
            if ($manifest.version -eq $extensionsToRemove[$extensionId]) {
                Remove-Item -Path $extensionPath -Recurse -Force
                Write-Host "Extension $extensionId (version $($extensionsToRemove[$extensionId])) removed."
            } else {
                Write-Host "Extension $extensionId found, but version does not match. Found version: $($manifest.version)."
            }
        }
    } else {
        Write-Host "Extension $extensionId not found."
    }
}
