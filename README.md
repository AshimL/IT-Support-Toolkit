# IT Support Toolkit (v1.5)

A PowerShell script by Ashim that automates common IT support diagnostics like system info, disk space, BitLocker status, Windows updates, and critical service checks, now with enhanced error detection and actionable insights.

## Features (v1.5)

- System information (OS name, architecture, version, build)
- Disk space summary for all drives
- BitLocker encryption status for each volume
- Recent installed Windows Updates (hotfix history)
- Status of critical services (Print Spooler, Windows Update, Defender)
- Network adapter and IP configuration details
- Real time CPU load and available physical memory
- List of installed applications with version and publisher
- Startup programs with command and location
- Windows Defender antivirus status and signature updates
- Recent Windows Event Logs filtered for Errors and Criticals (last 24 hours)
- Network connectivity test via ping to google.com
- Output: Report saved as System_Report.txt on the Desktop
  
## How to Use

1. Download the script , `IT-Support-Toolkit.ps1` file in the GitHub repo.
2. Open PowerShell as Administrator.
3. Run: powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\Desktop\IT-Support-Toolkit.ps1"
4. Check the generated `System_Report.txt` on your desktop.

## Purpose

This toolkit is designed to automate and streamline Level 1/2 IT support diagnostics, helping technicians resolve issues faster and identify root causes proactively.

---

Created by Ashim Luitel
