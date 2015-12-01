#/bin/bash

cd /home/pi/git-infoskjerm/
git reset --hard HEAD
git pull

npm install
npm run deploy

rm /home/pi/infoskjerm/*
cp build/* /home/pi/infoskjerm/

# refresh chromium