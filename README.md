# pi-fi

Scripts to install music streaming packages on Raspberry PI 4 (Bullseye)

## /boot/config.txt
disable DRM VC4 V3D
hdmi_ignore_cec_init=1

## SSH
ssh-keygen 

## Softwares
curl -fsSL https://raw.githubusercontent.com/nbonamy/pi-fi/main/install_packages.sh | sudo -E bash -

## Dot files
git clone git@github.com:nbonamy/dotfiles.git

## Sound Configuration
git clone git@github.com:nbonamy/pi-fi.git
ln -sf /home/mnmt/pi-fi/functions-local ~/.functions-local
source ~/.functions-local
sudo ln -sf /home/mnmt/pi-fi/alsa-base.conf /etc/modprobe.d/
sudo ln -sf /home/mnmt/pi-fi/asound.conf /etc/

## Sound Test
speaker-test -t wav -c 2
aplay /usr/share/sounds/alsa/Front_Center.wav
alsamixer

## Air Play
sudo /home/mnmt/pi-fi/install_airport.sh
airplay edit

## Tidal Connect
sudo /home/mnmt/pi-fi/install_tidal.sh
sudo /home/mnmt/pi-fi/install_tidal2.sh
tidal edit

## Restore curl
wget https://github.com/moparisthebest/static-curl/releases/download/v7.86.0/curl-armv7
sudo mv curl-armv7 /usr/bin/curl
sudo chmod +x /usr/bin/curl

## Spotify Connect
https://pimylifeup.com/raspberry-pi-spotify/
