#!/bin/ash
HTTP_CODE=$(curl -X GET "http://YOUR-PIHOLE-IP-HERE/admin/api.php?disable=120&auth=YOUR-API-KEY-HERE

if [ $HTTP_CODE = '{"status":"disabled"}' ]
then
        echo "255" > /sys/devices/platform/switch-leds/leds/amber:info/brightness
        sleep 1
        echo "0" > /sys/devices/platform/switch-leds/leds/amber:info/brightness
else
        echo "255" > /sys/devices/platform/switch-leds/leds/red:info/brightness
        sleep 2
        echo "0" > /sys/devices/platform/switch-leds/leds/red:info/brightness
fi
