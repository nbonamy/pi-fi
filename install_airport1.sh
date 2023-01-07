
#
# Instructions taken from
# https://pimylifeup.com/raspberry-pi-airplay-receiver/
#

# install required packages
apt install -y autoconf libtool libdaemon-dev libasound2-dev libpopt-dev libconfig-dev
apt install -y avahi-daemon libavahi-client-dev
apt install -y libssl-dev

# shairport now
cd ~
git clone https://github.com/mikebrady/shairport-sync.git

# prepare build
cd shairport-sync
autoreconf -i -f
./configure --with-alsa --with-avahi --with-ssl=openssl --with-systemd --with-metadata

# now build and deploy
make
make install

# overwrite config
ln -sf /home/mnmt/pi-fi/shairport-sync.conf /usr/local/etc/

# enable and start service
systemctl enable shairport-sync
service shairport-sync start
