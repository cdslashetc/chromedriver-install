#!/bin/bash
apt-get -y install libxss1 libappindicator1 libindicator7
if [ ! -e /usr/bin/google-chrome ]; then
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -i google-chrome*.deb
  apt-get -y install -f
fi
apt-get -y install xvfb
apt-get -y install unzip
rm -f LATEST_RELEASE
wget -N https://chromedriver.storage.googleapis.com/LATEST_RELEASE
r=$(cat LATEST_RELEASE)
wget -N http://chromedriver.storage.googleapis.com/$r/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
chmod +x chromedriver
mv -f chromedriver /usr/local/share/chromedriver
ln -fs /usr/local/share/chromedriver /usr/local/bin/chromedriver
ln -fs /usr/local/share/chromedriver /usr/bin/chromedriver
apt-get -y install python-pip
which pip
pip install --upgrade pip
pip install pyvirtualdisplay selenium
