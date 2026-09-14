<#
.SYNOPSIS
  Reconnect the phone to ADB and apply the settings that keep the Flutter debugger alive.

.DESCRIPTION
  - Restarts the ADB server (clears stale / offline transports).
  - Prefers USB when a data cable is attached; otherwise connects over Wi-Fi (adb tcpip mode).
  - Turns on Developer options > "Stay awake" and exempts the app from Doze, so the phone
    does not power-save the debug session away.
  Safe to run as often as you like.

.EXAMPLE
  .\tool\reconnect_phone.ps1                  # USB if present, else Wi-Fi to the default IP
  .\tool\reconnect_phone.ps1 -Ip 192.168.31.50
  .\tool\reconnect_phone.ps1 -EnableWifi      # phone on USB: switch its adbd to TCP 5555, then connect over Wi-Fi too
#>
param(
    [string]$Ip = "192.168.31.194",
    [int]$Port = 5555,
    [switch]$EnableWifi,
    [string]$Package = "com.example.flutter_learing_codepur"
)

$adb = Join-Path $env:LOCALAPPDATA "Android\Sdk\platform-tools\adb.exe"
if (-not (Test-Path $adb)) { $adb = "adb" }

Write-Host "Restarting ADB server..."
& $adb kill-server | Out-Null
& $adb start-server | Out-Null

function Get-UsbSerial {
    $lines = & $adb devices
    foreach ($line in $lines) {
        if ($line -match '^(\S+)\s+device\s*$' -and $Matches[1] -notmatch ':') { return $Matches[1] }
    }
    return $null
}

$usb = Get-UsbSerial
$target = $null

if ($usb) {
    Write-Host "USB device found: $usb  (USB is the most stable transport - keep using it)" -ForegroundColor Green
    $target = $usb
    if ($EnableWifi) {
        $addr = (& $adb -s $usb shell ip -o -4 addr show wlan0) -join ' '
        if ($addr -match 'inet (\d+\.\d+\.\d+\.\d+)') { $Ip = $Matches[1] }
        Write-Host "Enabling TCP ADB on the phone and connecting to ${Ip}:${Port} ..."
        & $adb -s $usb tcpip $Port
        Start-Sleep -Seconds 2
        & $adb connect "${Ip}:${Port}"
    }
}
else {
    Write-Host "No USB device. Trying Wi-Fi: ${Ip}:${Port} ..."
    $result = (& $adb connect "${Ip}:${Port}") -join ' '
    Write-Host $result
    if ($result -match 'connected to') {
        $target = "${Ip}:${Port}"
    }
    else {
        Write-Host "Wi-Fi connect failed. Plug in a DATA cable (straight into the laptop, no hub) and run this script again." -ForegroundColor Yellow
        Write-Host "TCP mode on the phone resets after every reboot; re-enable it once over USB with:  .\tool\reconnect_phone.ps1 -EnableWifi" -ForegroundColor Yellow
    }
}

if ($target) {
    Write-Host "Applying keep-alive settings on the phone ($target)..."
    & $adb -s $target shell settings put global stay_on_while_plugged_in 7      # Developer options > Stay awake
    & $adb -s $target shell dumpsys deviceidle whitelist "+$Package" | Out-Null  # exempt the app from Doze
    $stay = (& $adb -s $target shell settings get global stay_on_while_plugged_in) -join ''
    Write-Host "  stay_on_while_plugged_in = $stay"
    $wl = (& $adb -s $target shell dumpsys deviceidle whitelist) -join "`n"
    if ($wl -match [regex]::Escape($Package)) { Write-Host "  Doze whitelist: $Package" }
    else { Write-Host "  Doze whitelist: FAILED" -ForegroundColor Yellow }
}

Write-Host ""
& $adb devices -l
Write-Host ""
Write-Host "Next: press F5 in VS Code, or pick 'Flutter: re-attach to app already running on phone' to reconnect without a rebuild."
