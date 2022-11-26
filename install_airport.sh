
# install required packages
apt install -y autoconf libtool libdaemon-dev libasound2-dev libpopt-dev libconfig-dev
apt install -y avahi-daemon libavahi-client-dev
apt install -y libssl-dev

# git clone repository
cd ~
git clone https://github.com/mikebrady/shairport-sync.git

# prepare build
cd shairport-sync
autoreconf -i -f
./configure --with-alsa --with-avahi --with-ssl=openssl --with-systemd --with-metadata

# now build and deploy
make
make install

# enable service
systemctl enable shairport-sync

# start service
service shairport-sync start

