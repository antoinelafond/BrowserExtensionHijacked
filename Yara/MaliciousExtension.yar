rule Extension_Stealer_Detection {
    meta:
        description = "Detects malicious JavaScript files related to Chrome(ium) extension compromission"
        author = "kondah hamza"
        date = "2024-12-27"
        malware_type = "Chrome Extension Stealer"
        platform = "Chrome/Chromium"
        threat_type = "info-stealer"
        severity = "high"
        mitre_att = "T1176,T1539"

    strings:
        // Extension specific patterns
        $ext1 = "manifest.json" ascii wide
        $ext2 = "content.js" ascii wide
        $ext3 = "worker.js" ascii wide
        $ext4 = "background.js" ascii wide
        $ext5 = "chrome-extension://" ascii wide
        $ext6 = "chrome.runtime" ascii wide
        $ext7 = "extensions/" ascii wide
        $ext8 = "chrome.webRequest" ascii wide

        // Cookie related patterns
        $cookie1 = "document.cookie" ascii wide
        $cookie2 = "chrome.cookies" ascii wide
        $cookie3 = "chrome.cookies.getAll" ascii wide
        $cookie4 = "cookie.domain" ascii wide
        $cookie5 = "cookie.value" ascii wide
        $cookie6 = "cookie.path" ascii wide
        $cookie7 = ".cookie" ascii wide
        $cookie8 = "cookie=" ascii wide
        
        // Obfuscation patterns
        $obf1 = "eval(" ascii wide
        $obf2 = "unescape(" ascii wide
        $obf3 = "String.fromCharCode(" ascii wide
        $obf4 = "atob(" ascii wide
        $obf5 = "btoa(" ascii wide
        $obf6 = "Function(" ascii wide
        $obf7 = "setTimeout(" ascii wide
        $obf8 = "setInterval(" ascii wide

        // Suspicious function usage
        $susp1 = "XMLHttpRequest" ascii wide
        $susp2 = "fetch(" ascii wide
        $susp3 = "ActiveXObject" ascii wide
        $susp4 = "navigator.sendBeacon(" ascii wide
        $susp5 = "document.write(" ascii wide
        $susp6 = "window.location=" ascii wide
        $susp7 = "localStorage.setItem(" ascii wide
        $susp8 = "sessionStorage.setItem(" ascii wide

        // Known malicious domains
        $domain1 = "cyberhavenext.pro" nocase ascii wide
        $domain2 = "linewizeconnect.com" nocase ascii wide
        $domain3 = "moonsift.store" nocase ascii wide
        $domain4 = "readermodeext.info" nocase ascii wide
        $domain5 = "vpncity.live" nocase ascii wide
        $domain6 = "wayinai.live" nocase ascii wide
        $domain7 = "censortracker.pro" nocase ascii wide
        $domain8 = "parrottalks.info" nocase ascii wide
        $domain9 = "ext.linewizeconnect.com" nocase ascii wide
        $domain10 = "bookmarkfc.info" nocase ascii wide
        $domain11 = "yujaverity.info" nocase ascii wide
        $domain12 = "primusext.pro" nocase ascii wide
        $domain13 = "internxtvpn.pro" nocase ascii wide
        $domain14 = "uvoice.live" nocase ascii wide
        $domain15 = "castorus.info" nocase ascii wide

        // Indicators of exfiltration
        $exfil1 = "POST" ascii wide
        $exfil2 = "GET" ascii wide
        $exfil3 = "send(" ascii wide
        $exfil4 = "fetch(" ascii wide
        $exfil5 = "new Image().src" ascii wide

        // Specific hashes from known malicious scripts
        $hash1 = { 91 ff 6f 07 b3 f2 34 7d a0 0b 5e c9 90 7d 0b 77 53 cc a9 c4 42 cc 9c 06 92 c1 c6 ab a1 b9 03 18 }
        $hash2 = { a8 d3 02 7b e4 8f 61 ae 61 74 d0 67 e5 9e 89 b7 ec 47 ae 19 42 04 70 24 87 33 d8 c4 b7 5f da 52 }
        $hash3 = { 8a e8 2b cb 5a 47 4e f8 13 d1 e2 a0 44 ba 73 cb 62 aa c5 5a 24 5d f4 ea a3 0c c3 e0 45 1a 4d 3 }
        $hash4 = { 28 da e3 b4 bb 89 a0 34 f5 4d 86 c5 2d ea 0f 58 cf 7e 24 f5 e7 50 4f 3c c5 56 9b ac 1e 18 9b ed }
        $hash5 = { 7f b4 3d c4 56 64 10 2d 3d 66 97 04 80 83 2a 64 95 74 b7 e9 25 eb 46 9c 7f 33 57 be 6a 34 e1 ce }
        $hash6 = { f7 92 12 c1 cc 94 52 bb 5d ee 89 93 7e 17 36 e0 5e 25 fe 77 a1 e2 58 1a 18 42 1d c6 58 2f f0 ce }

    condition:
        filesize < 500KB and
        (
            // Match known malicious hashes
            any of ($hash*) or
            // Detect extension specific patterns with cookies or exfiltration
            (2 of ($ext*) and (any of ($cookie*) or any of ($exfil*))) or
            // Detect obfuscation techniques
            (2 of ($obf*)) or
            // Detect suspicious function usage with known malicious domains
            (1 of ($susp*) and 1 of ($domain*)) or
            // Detect cookie stealing with malicious domains
            (1 of ($cookie*) and 1 of ($domain*)) or
            // Detect exfiltration patterns
            (1 of ($exfil*) and 1 of ($domain*))
        )
}
