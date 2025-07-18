# IT Support Toolkit (v1.5)

A PowerShell script by Ashim that automates common IT support diagnostics like system info, disk space, BitLocker status, Windows updates, and critical service checks, now with enhanced error detection and actionable insights.

## Features (v1.5)

- System information (OS, hostname, uptime, etc.)
- Disk space summary for all drives
- BitLocker encryption status
- Recent Windows Update history
- Battery health (for laptops)
- Windows Defender AV status and threat history
- Recent Windows Event Logs (Error & Critical only)
- Network adapter and IP configuration
- High CPU/memory usage processes
- Check essential services (e.g., Windows Update, Print Spooler)
- Displays whether device is Azure AD joined or not
- Output saved as `System_Report.txt` on Desktop
  
## How to Use

1. Download the script , `IT-Support-Toolkit.ps1` file in the GitHub repo.
2. Open PowerShell as Administrator.
3. Run: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process`
4. Navigate to the folder where you saved the script and run: `.\IT-Support-Toolkit.ps1`
5. Check the generated `System_Report.txt` on your desktop.

## Purpose

This toolkit is designed to automate and streamline Level 1/2 IT support diagnostics, helping technicians resolve issues faster and identify root causes proactively.

---

Created by Ashim Luitel
