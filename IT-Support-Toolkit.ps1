# IT Support Toolkit v1.5 - by Ashim
# Description: Generates a detailed system health report for diagnostics.

$reportPath = "$env:USERPROFILE\Desktop\System_Report.txt"
"=== IT SUPPORT TOOLKIT REPORT ===" | Out-File $reportPath
"Date: $(Get-Date)" | Out-File $reportPath -Append

# 1. System Info
"`n--- System Info ---" | Out-File $reportPath -Append
Get-ComputerInfo | Select-Object OSName, CsSystemType, WindowsVersion, WindowsBuildLabEx | Out-File $reportPath -Append

# 2. Disk Space
"`n--- Disk Space ---" | Out-File $reportPath -Append
Get-PSDrive -PSProvider FileSystem | Out-File $reportPath -Append

# 3. BitLocker Status
"`n--- BitLocker Status ---" | Out-File $reportPath -Append
Get-BitLockerVolume | Select-Object MountPoint, ProtectionStatus | Out-File $reportPath -Append

# 4. Installed Windows Updates
"`n--- Installed Updates ---" | Out-File $reportPath -Append
Get-HotFix | Select-Object InstalledOn, Description, HotFixID | Out-File $reportPath -Append

# 5. Critical Services
"`n--- Critical Services Status ---" | Out-File $reportPath -Append
Get-Service -Name spooler, wuauserv, WinDefend | Out-File $reportPath -Append

# 6. Network Configuration
"`n--- Network Configuration ---" | Out-File $reportPath -Append
Get-NetIPConfiguration | Out-File $reportPath -Append

# 7. CPU & Memory Usage
"`n--- CPU & Memory Usage ---" | Out-File $reportPath -Append
Get-CimInstance Win32_Processor | Select-Object Name, LoadPercentage | Out-File $reportPath -Append
Get-CimInstance Win32_OperatingSystem | Select-Object FreePhysicalMemory, TotalVisibleMemorySize | Out-File $reportPath -Append

# 8. Installed Applications
"`n--- Installed Applications ---" | Out-File $reportPath -Append
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
Select-Object DisplayName, DisplayVersion, Publisher |
Where-Object { $_.DisplayName } |
Sort-Object DisplayName | Out-File $reportPath -Append

# 9. Startup Programs
"`n--- Startup Programs ---" | Out-File $reportPath -Append
Get-CimInstance Win32_StartupCommand | Select-Object Name, Command, Location | Out-File $reportPath -Append

# 10. Windows Defender Status
"`n--- Windows Defender Status ---" | Out-File $reportPath -Append
Try {
    Get-MpComputerStatus | Out-File $reportPath -Append
} Catch {
    "Defender status not available." | Out-File $reportPath -Append
}

# 11. Event Logs (Critical + Error - last 24h)
"`n--- Event Log: Errors & Critical (Last 24 hours) ---" | Out-File $reportPath -Append
Get-EventLog -LogName System -EntryType Error, Critical -After (Get-Date).AddDays(-1) |
Select-Object TimeGenerated, Source, EventID, Message -First 20 | Out-File $reportPath -Append

# 12. Network Connectivity Test
"`n--- Network Connectivity Test (Ping Google) ---" | Out-File $reportPath -Append
Test-Connection google.com -Count 4 | Out-File $reportPath -Append

# Completion Message
"`nReport saved to: $reportPath" | Out-File $reportPath -Append
Write-Host "`n Report generated! Check your Desktop: System_Report.txt" -ForegroundColor Green
