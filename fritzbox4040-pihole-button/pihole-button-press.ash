#!/usr/bin/env ash

#find out the path where this script is saved and read out the config.ash file
MY_PATH=$(cd "$MY_PATH" && pwd)
. "$MY_PATH"/config.ash

#do a http request with the api key, ip and time variable from the config file
HTTP_RESPONSE=$(curl -X GET "http://$PIHOLE_IP/admin/api.php?disable=$DISABLE_TIME&auth=$API_KEY")

#pihole gives out a specific answer in json if the request was successful.
if [ $HTTP_RESPONSE = '{"status":"disabled"}' ]
then
        #if the response was sucessful, the green led lights up for one second
        echo "255" > /sys/devices/platform/switch-leds/leds/amber:info/brightness
        sleep 1
        echo "0" > /sys/devices/platform/switch-leds/leds/amber:info/brightness
else
        #if the response failed, the red led lights up for two secons
        echo "255" > /sys/devices/platform/switch-leds/leds/red:info/brightness
        sleep 2
        echo "0" > /sys/devices/platform/switch-leds/leds/red:info/brightness
fi
