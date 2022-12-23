
#
# Instructions taken from
# https://pimylifeup.com/raspberry-pi-airplay-receiver/
#

# install required packages
apt install -y autoconf libtool libdaemon-dev libasound2-dev libpopt-dev libconfig-dev
apt install -y avahi-daemon libavahi-client-dev
apt install -y libssl-dev libplist-dev libsodium-dev libgcrypt-dev

# nqptp
cd ~
git clone https://github.com/mikebrady/nqptp.git
cd nqptp/

# prepare build
autoreconf -fi
./configure --with-systemd-startup

# now build and deploy
make
make install

# enable and start service
systemctl enable nqptp
systemctl start nqptp

# shairport now
cd ~
git clone https://github.com/mikebrady/shairport-sync.git

# prepare build
cd shairport-sync
autoreconf -i -f
./configure --with-alsa --with-avahi --with-ssl=openssl --with-systemd --with-metadata --with-airplay-2

# now build and deploy
make
make install

# overwrite config
ln -sf /home/mnmt/pi-fi/shairport-sync.conf /usr/local/etc/

# enable and start service
systemctl enable shairport-sync
service shairport-sync start
