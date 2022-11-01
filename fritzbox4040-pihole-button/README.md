# Fritz!Box 4040 pihole button script

With this script, you will be able to turn off your pihole adblocker for a limited time if you press the WPS button on your OpenWRT Fritz!Box 4040.
The info led will then blink green if your pihole was temporarily deactivated. If it fails, it will blink red.
This script can be very handy for blocked websites that you want to visit once.

### Installation
To install this script, you first need to remove all triggers assigned to you info led in Luci.
Go to System -> LED Configuration and delete all actions that are using the green/amber or red info led.

After that, you have to properly configure your buttons.
Follow the steps "Preliminary steps" and "Using Atheros' 00-button + UCI" in this tutorial:
[Attach functions to a push button](https://openwrt.org/docs/guide-user/hardware/hardware.button#preliminary_steps)

Then you have to configure what action is performed when you press your button.
These are the commands I have used for that:
```
uci add system button
uci set system.@button[0].button="wps"
uci set system.@button[0].action="pressed"
uci set system.@button[0].handler="ash /root/wps-button-press.ash"
uci commit system
```
Place the project files of this folder in your root folder (or wherever you want, but make sure to change the path then).
Edit the IP/Hostname and the API-Key of your pihole in the config.ash file. you may also change the time the pihole is deactivated.
Reboot your device and you are done! :)
