$Serial = (Get-CimInstance Win32_BIOS).SerialNumber
$Model = (Get-CimInstance Win32_ComputerSystem).Model

[PSCustomObject]@{
    DateTime = Get-Date
    SerialNumber = $Serial
    Model = $Model
} | Export-Csv ".\WipeLog.csv" -Append -NoTypeInformation

Start-Sleep -Seconds 10

Clear-LocalDisk -Force -Confirm:$false

Start-Sleep -Seconds 20
