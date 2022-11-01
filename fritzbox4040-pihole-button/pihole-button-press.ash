#!/usr/bin/env ash
API_KEY="YOUR-API-KEY"
PIHOLE_IP="YOUR-PIHOLE-IP"
HTTP_RESPONSE=$(curl -X GET "http://"$PIHOLE_IP"/admin/api.php?disable=120&auth="$API_KEY)

if [ $HTTP_RESPONSE = '{"status":"disabled"}' ]
then
        echo "255" > /sys/devices/platform/switch-leds/leds/amber:info/brightness
        sleep 1
        echo "0" > /sys/devices/platform/switch-leds/leds/amber:info/brightness
else
        echo "255" > /sys/devices/platform/switch-leds/leds/red:info/brightness
        sleep 2
        echo "0" > /sys/devices/platform/switch-leds/leds/red:info/brightness
fi
