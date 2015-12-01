#!/bin/bash

CHECK=`ps aux | grep "python -m SimpleHTTPServer 8080" | wc -l`
echo "Checking if started"
if [ $CHECK -lt 2 ]; then

	# Found this tutorial after the fact, looks good: https://www.danpurdy.co.uk/web-development/raspberry-pi-kiosk-screen-tutorial/
	echo "No started. Starting!"
	export DISPLAY=:1

	# Turn off screen sleep
	xset s off
	xset -dpms
	xset s noblank

	echo "Start python server"
	# start python server
	cd /home/pi/infoskjerm
	python -m SimpleHTTPServer 8080 &

	echo "Server started"

	cd /home/pi/info-pi-client/
	./move_mouse_cursor_to_corner.sh &

	echo "cursor moved"

	# Start chromium again if it dies
	#while true
	#do

		echo "Starting chromium"
		sed -i 's/"exited_cleanly": false/"exited_cleanly": true/' /home/pi/.config/chromium/Default/Preferences
		# Show chromium in kiosk mode (fullscreen)
		chromium --noerrdialogs --kiosk http://localhost:8080

		echo "Chromium died"

		killall chromium
	#done

fi