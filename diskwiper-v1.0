$Serial = (Get-CimInstance Win32_BIOS).SerialNumber
$Model = (Get-CimInstance Win32_ComputerSystem).Model

[PSCustomObject]@{
    DateTime = Get-Date
    SerialNumber = $Serial
    Model = $Model
} | Export-Csv ".\WipeLog.csv" -Append -NoTypeInformation
