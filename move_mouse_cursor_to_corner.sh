#!/bin/bash
while true; do
        sleep 2;
        # Hide the cursor (move it to the bottom-right, comment out if you want mouse interaction)
        xwit -root -warp $( cat /sys/module/*fb*/parameters/fbwidth ) $( cat /sys/module/*fb*/parameters/fbheight )
done;

#or disable mouse with
# unclutter -idle 0