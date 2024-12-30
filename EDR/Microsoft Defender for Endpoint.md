# Identify Compromised Browser Extensions in Crowdstrike Falcon

This query will identify compromised browser extensions in Microsoft Defender for Endpoint. The query will return the informations about the event related the network communication

The query focus on the IPs to get only the device we are sure to be compromised as they communicate with the IPs

```
DeviceNetworkEvents
| where RemoteIP in ("149.28.124.84","45.76.225.148","148.72.164.10","148.72.164.11","148.72.173.24")
| where InitiatingProcessFileName == @"chrome.exe"
```

If you have Microsoft Defender Vulnerability Management Standalone or the Defender Vulnerability Management add-on for Microsoft Defender for Endpoint Plan 2, you have access to the Browser extensions page that displays a list of the browser extensions installed across different browsers in your organization. Browser extension details are collected across all the users that exist on a specific browser. For each installed extension, per browser, you can see the devices it's installed on, the users who installed it and if it's turned on or off on a device.

So you can search for the presence of the malicious extensions across the organization 

You can query the table with AdvancedHunting
```
DeviceTvmBrowserExtensions 
```
For more informations: https://learn.microsoft.com/en-us/defender-vulnerability-management/tvm-browser-extensions
