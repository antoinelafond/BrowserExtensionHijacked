# Chrome Extension Supply Chain Attack
## Overview
This repository provides a comprehensive collection of detection rules and threat intelligence focused on malicious Chrome extensions supply chain attack incident that occurs between 24-26 December.

### Refs : 
- https://www.vulnu.com/p/breaking-cyberhaven-chrome-extension-compromised
- https://secureannex.com/blog/cyberhaven-extension-compromise/
- The developers of Cyberheaven's Chrome extension, one of the heavily affected companies, have released an incident report : https://www.cyberhaven.com/engineering-blog/cyberhavens-preliminary-analysis-of-the-recent-malicious-chrome-extension

## Purpose of the repo 
- Provide detection rules (YARA and Sigma)
- Share Indicators of Compromise (IoCs)
- Document threat actor techniques
- Enable proactive threat hunting
- Support incident response activities

## TTPs 
![image](https://github.com/user-attachments/assets/8454952a-a50e-4daf-9aa7-ec7b5d98901a)

## Indicators of Compromise (IoCs) - Chrome Extension Stealer Campaign December  2024
### Domains
- cyberhavenext[.]pro
- linewizeconnect[.]com
- moonsift[.]store
- readermodeext[.]info
- vpncity[.]live
- wayinai[.]live
- censortracker[.]pro
- parrottalks[.]info
- ext.linewizeconnect[.]com
- bookmarkfc[.]info
- yujaverity[.]info
- primusext[.]pro
- internxtvpn[.]pro
- uvoice[.]live
- castorus[.]info
- sclpfybn[.]com

### IP Addresses

- 149.28.124[.]84
- 45.76.225[.]148
- 148[.]72[.]164[.]10
- 148[.]72[.]164[.]11
- 148[.]72[.]173[.]24

### File Hashes (SHA256)

- 91ff6f07b3f2347da00b5ec9907d0b7753cca9c442cc9c0692c1c6aba1b90318 (worker.js from cyberhavenext.pro)
- a8d3027be48f61ae6174d067e59e89b7ec47ae19420470248733d8c4b75fda52 (content.js from cyberhavenext.pro)
- 8ae82bcb5a474ef813d1e2a044ba73cb62aac55a245dfb4eaa30cc3e0451a4d3 (worker.js from readermodeext.info)
- 28dae3b4bb89a034f54d86c52dea0f58cf7e24f5e7504f3cc5569bac1e189bed (content.js from readermodeext.info)
- 7fb43dc45664102d3d66970480832a649574b7e925eb469c7f3357be6a34e1ce (worker.js from vpncity.live)
- f79212c1cc9452bb5dee89937e1736e05e25fe77a1e2581a18421dc6582ff0ce (content.js from vpncity.live)

### Infrastructure Characteristics

- Registration Provider: Namecheap
- Hosting Provider: Vultr
- ASN: 20473
- Web Server: Nginx
- SSL Certificate: Let's Encrypt
- Framework: Laravel PHP
- HTTP Response: 200

### Tracking Compromised extensions : 

- Here is also a list for tracking compromised extensions by @tuckner :
https://docs.google.com/spreadsheets/d/15xOLbYgz5DQnCWYE6a_LXGcqYC_bNPPzdBqdLofz6-E/edit?pli=1&gid=0#gid=0

### Malicious Files

- content.js
- worker.js
- manifest.json

### Network Indicators

- Dead drop resolver pattern: /6kU.*?"/gm
- HTTP POST requests for data exfiltration
- ChatGPT API connectivity check

###  List of malicious Chrome Extension IDs

The following Chrome extension IDs have been identified as malicious and are targeted for detection in the Sigma rule:

- ifjfomailadbmnbdgelhglajckbkfbjj
- dpggmcodlahmljkhlmpgpdcffdaoccni
- nnpnnpemnckcfdebeekibpiijlicmpom
- kkodiihpgodmdankclfibbiphjkfdenh
- oaikpkmjciadfpddlpjjdapglcihgdle
- acmfnomgphggonodopogfbmkneepfgnh
- mnhffkhmpnefgklngfmlndmkimimbphc
- befflofjcniongenjmbkgkoljhgliihe
- cedgndijpacnfbdggppddacngjfdkaca
- egmennebgadmncfjafcemlecimkepcle
- cplhlgabfijoiabgkigdafklbhhdkahj
- gadbpecoinogdkljjbjffmiijpebooce
- oeiomhmbaapihbilkfkhmlajkeegnjhe
- epikoohpebngmakjinphfiagogjcnddm



### List of related compromised extensions (Source : Cyberheaven blogpost -> https://secureannex.com/blog/cyberhaven-extension-compromise/)

VPNCity
2.0.1
10,000 users
Updated December 12, 2024
Confirmed

Parrot Talks
1.16.2
40,000 users
Updated December 25, 2024
Confirmed

Uvoice
1.0.12
40,000 users
Updated December 26, 2024
Confirmed

Internxt VPN - Free, Encrypted & Unlimited VPN
1.1.1
10,000 users
Updated December 25, 2024
Confirmed and patched at 1.1.2

Bookmark Favicon Changer
4.00
40,000 users
Updated December 25, 2024
Confirmed

Castorus
4.40
50,000 users
Updated December 26, 2024
Confirmed & patched at 4.4.1

Wayin AI
0.0.11
40,000 users
Updated December 19, 2024
Confirmed

Search Copilot AI Assistant for Chrome
1.0.1
20,000 users
Updated July 17, 2024
Confirmed

VidHelper - Video Downloader
2.2.7
20,000 users
Updated December 26, 2024

AI Assistant - ChatGPT and Gemini for Chrome
0.1.3
4,000 users
Updated May 31, 2024
Confirmed and removed from the Chrome web store October 25th, 2024

Vidnoz Flex - Video recorder & Video share
1.0.161
6,000 users
Updated December 25, 2024
Confirmed

TinaMind - The GPT-4o-powered AI Assistant!
2.13.0
40,000 users
Updated December 15, 2024
Confirmed & patched at 2.13.1 December 20th, 2024, now 2.14.0 December 21st, 2024

Bard AI chat
1.3.7
100,000 users
Updated September 5, 2024
Confirmed removed from the Chrome web store October 22, 2024

Reader Mode
1.5.7
300,000 users
Updated December 18, 2024
Confirmed & patched at 1.5.8 December 18th, 2024, removed from the Chrome web store December 19th, 2024

Primus (prev. PADO)
3.18.0
40,000 users
Updated December 18, 2024
Confirmed & patched at 3.20.0 December 25th, 2024

Tackker - online keylogger tool 1.3.0
10,000 users
Updated December 25, 2024
Confirmed. Version 1.3 released October 6, 2023, patched at 1.4 August 13, 2024

AI Shop Buddy 2.7.5
4,000 users
Updated April 30, 2024
Confirmed. Version 2.7.3. Updated version 2.7.5 still contains compromised code.

Sort by Oldest 1.4.5
2,000 users
Updated January 11, 2024
Confirmed

Rewards Search Automator

### Vulnu Communication : https://www.vulnu.com/p/breaking-cyberhaven-chrome-extension-compromised

## Accounts to Follow : 
- Jaime Blasco : x.com/jaimeblascob/status/1872447430362611810
- Andre Gironda (1) : x.com/AndreGironda/status/1872463896742871095
- Andre Gironda (2) : x.com/AndreGironda/status/1872463919668969788
- Tuckner (1) : x.com/tuckner/status/1872516426038419631
- Tuckner (2) : x.com/tuckner/status/1872516616241758236
