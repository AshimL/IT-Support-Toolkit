# IT Support Toolkit - by Ashim

$reportPath = "$env:USERPROFILE\Desktop\System_Report.txt"
"=== IT SUPPORT TOOLKIT REPORT ===" | Out-File $reportPath
"`nDate: $(Get-Date)" | Out-File $reportPath -Append

# 1. System Info
"`n--- System Info ---" | Out-File $reportPath -Append
Get-ComputerInfo | Select-Object OSName, CsSystemType, WindowsVersion, WindowsBuildLabEx | Out-File $reportPath -Append

# 2. Disk Space
"`n--- Disk Space ---" | Out-File $reportPath -Append
Get-PSDrive -PSProvider FileSystem | Out-File $reportPath -Append

# 3. BitLocker Status
"`n--- BitLocker Status ---" | Out-File $reportPath -Append
Get-BitLockerVolume | Select-Object MountPoint, ProtectionStatus | Out-File $reportPath -Append

# 4. Windows Updates
"`n--- Installed Updates ---" | Out-File $reportPath -Append
Get-HotFix | Select-Object InstalledOn, Description, HotFixID | Out-File $reportPath -Append

# 5. Services Check
"`n--- Critical Services ---" | Out-File $reportPath -Append
Get-Service -Name spooler, wuauserv, WinDefend | Out-File $reportPath -Append

# 6. Network Config
"`n--- Network Info ---" | Out-File $reportPath -Append
Get-NetIPConfiguration | Out-File $reportPath -Append

"`nReport saved to: $reportPath"
Write-Host "`n Report generated! Check your Desktop: System_Report.txt" -ForegroundColor Green
