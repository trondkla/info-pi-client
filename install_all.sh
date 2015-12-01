sudo su


aptitude install xwit git nodejs npm x11-xserver-utils chromium screen ttf-mscorefonts-installer

# xwit => Controll mouse cursor
# Git => code version control
# nodejs => node and npm package manager
# x11-xserver-utils => xset to disable screensaver and battery sleep
# chromium => Browser to display whatever
# screen => Handy tool to run long lasting tasks when using ssh

cd /home/pi


git clone https://github.com/trondkla/info-pi-client.git

# Add deploy to crontab every 
cat <(crontab -l) <(echo "5 4 * * * /home/pi/info-pi-client/deploy.sh") | crontab -

cd /home/pi/info-pi-client/
chomod a+x *.sh

# Legg inn sånn at startup kjører og!
'/bin/bash /home/pi/info-pi-client/startup.sh' >> /etc/xdg/lxsession/LXDE/autostart