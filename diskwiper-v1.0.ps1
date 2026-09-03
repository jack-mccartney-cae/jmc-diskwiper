Write-Host "Starting Disk Wiper Cloud v3.0"

Write-Host "Device Details:"
$Serial = (Get-CimInstance Win32_BIOS).SerialNumber
Write-Host "Device Serial = $Serial"
$Model = (Get-CimInstance Win32_ComputerSystem).Manufacturer
Write-Host "Device Manufacturer = $Manufacturer"
$Model = (Get-CimInstance Win32_ComputerSystem).Model
Write-Host "Device Model = $Model"
$Date = Get-Date
Write-Host "Current Date and Time = $Date"

$USBDrive = (Get-Volume | Where-Object FileSystemLabel -eq "OSDCloudFiles").DriveLetter
$LogFile = "$($USBDrive):\WipeLog.csv"

Write-Host "Proceeding to wipe in 10 Seconds..."

Start-Sleep -Seconds 10

Write-Host "Now Wiping..."
Clear-LocalDisk -Force -Confirm:$false
Write-Host "Wipe Complete"

[PSCustomObject]@{
    DateTime = Get-Date
    Manufacturer = $Manufacturer
    Model = $Model
    SerialNumber = $Serial
} | Export-Csv $LogFile -Append -NoTypeInformation

Write-Host "Device with Serial ($Serial) has been wiped at ($Date) and has been logged"
Write-Host "Script ending in 20 seconds..."
Start-Sleep -Seconds 20
