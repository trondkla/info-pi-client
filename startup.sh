#!/bin/bash

# Found this tutorial after the fact, looks good: https://www.danpurdy.co.uk/web-development/raspberry-pi-kiosk-screen-tutorial/

export DISPLAY=1

# Turn off screen sleep
xset s off
xset -dpms
xset s noblank

# start python server
cd /home/pi/infoskjerm
python -m SimpleHTTPServer 8080 &

./home/pi/info-pi-client/move_mouse_cursor_to_corner.sh

# Start chromium again if it dies
while true
do
	sed -i 's/"exited_cleanly": false/"exited_cleanly": true/' /home/pi/.config/chromium/Default/Preferences
	# Show chromium in kiosk mode (fullscreen)
	chromium --noerrdialogs --kiosk http://localhost:8080
done