#!/bin/bash
# behave version
bv=1.25
# selenium version
sv=3.40
# chromedriver version
r=2.31
# take a snapshot of /usr/local in case we need to revert
cd /usr
d=$(date --iso-8601)
tar cvf local-$d.tar
pxz -v9 local-$d.tar
# return to home
cd ~
apt-get update
apt-get -y install libxss1 libappindicator1 libindicator7
if [ ! -e /usr/bin/google-chrome ]; then
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -i google-chrome*.deb
  apt-get -y install -f
fi
apt-get -y install google-chrome
apt-get -y install xvfb
apt-get -y install unzip
rm -f LATEST_RELEASE
#wget -N https://chromedriver.storage.googleapis.com/LATEST_RELEASE
#r=$(cat LATEST_RELEASE)
if [ -f chromedriver_linux64.zip ]; then
  mv  chromedriver_linux64.zip chromedriver_linux64_old.zip
fi
wget -N http://chromedriver.storage.googleapis.com/$r/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
chmod +x chromedriver
mv -f chromedriver /usr/local/share/chromedriver
ln -fs /usr/local/share/chromedriver /usr/local/bin/chromedriver
ln -fs /usr/local/share/chromedriver /usr/bin/chromedriver
apt-get -y install python-pip
which pip3
#pip3 install --upgrade
pip3 install pyvirtualdisplay
pip3 install selenium=$sv
pip3 install behave=$bv
