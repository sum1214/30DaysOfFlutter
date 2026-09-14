# flutter_learing_codepur

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Debugging on the phone (OnePlus CPH2487)

The VS Code debugger rides on ADB. When ADB drops, VS Code reports "Lost connection to device"
while the app usually keeps running on the phone.

Quick recovery (no rebuild needed):

```powershell
.\tool\reconnect_phone.ps1
# then F5 -> "Flutter: re-attach to app already running on phone"
```

Checklist for a session that stays connected:

1. **Use USB with a data cable, plugged straight into the laptop** (no hub, no charge-only cable).
   Wi-Fi ADB drops whenever the phone's Wi-Fi power-saves, roams or switches to mobile data.
2. Phone: Settings > Developer options > **Stay awake = On** (the script sets this).
3. Phone: Settings > Battery > App battery management > flutter_learing_codepur >
   **Don't optimise / Allow background activity**. ColorOS otherwise freezes the app when the screen turns off.
4. Wi-Fi ADB only: Settings > Wi-Fi > Advanced > turn off **Auto switch to mobile data / Smart Wi-Fi**.
5. Wi-Fi ADB (`adb tcpip 5555`) resets after every phone reboot. Re-enable it once over USB:
   `.\tool\reconnect_phone.ps1 -EnableWifi`.
