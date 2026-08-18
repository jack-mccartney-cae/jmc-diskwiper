Write-Host "Starting Disk Wiper Cloud v3.0"

Write-Host "Device Details:"
$Serial = (Get-CimInstance Win32_BIOS).SerialNumber
Write-Host "Device Serial = $Serial"
$Model = (Get-CimInstance Win32_ComputerSystem).Model
Write-Host "Device Model = $Model"
$Date = Get-Date
Write-Host "Current Date and Time = $Date"

[PSCustomObject]@{
    DateTime = Get-Date
    SerialNumber = $Serial
    Model = $Model
} | Export-Csv "e:\WipeLog.csv" -Append -NoTypeInformation

Write-Host "Proceeding to wipe in 10 Seconds..."

Start-Sleep -Seconds 10

Write-Host "Now Wiping..."
Clear-LocalDisk -Force -Confirm:$false

Write-Host "Device with Serial ($Serial) has been wiped at ($Date) and has been logged"
Write-Host "Script ending in 20 seconds..."
Start-Sleep -Seconds 20
