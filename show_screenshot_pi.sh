#!/bin/bash
# Example script to import screenshot from pi to your local mac. Remember to install image magic on pi for import to function
rm pi.jpg
ssh pi@192.168.0.18 'import -display :1 -window root pi.jpg'
scp pi@192.168.0.18:/home/pi/pi.jpg .
open pi.jpg