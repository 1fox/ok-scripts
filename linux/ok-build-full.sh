#!/bin/bash
echo "Compiling Okcash GUI and Daemon - okcash + okcashd - from source on its latest version"

date

OKUSER=$USER
HOMEDIR="/home/$OKUSER"
OKCASHPATH="$HOMEDIR/.okcash"

echo "User: $OKUSER"
echo "User home dir: $HOMEDIR"
echo "User Okcash path: $OKCASHPATH"

sudo apt-get install git build-essential libssl-dev libboost-all-dev libqrencode-dev libminiupnpc-dev -y

sudo apt-get install qtcreator qttools5-dev-tools  libqt5webkit5-dev -y

sudo add-apt-repository -y ppa:bitcoin/bitcoin

sudo apt-get update

sudo apt-get install -y libdb4.8-dev libdb4.8++-dev -y

cd

git clone https://github.com/okcashpro/okcash

cd okcash

cd src

make -f makefile.unix USE_UPNP=-

strip okcashd

sudo cp okcashd /usr/local/bin

cp okcashd $HOMEDIR

cd ..

qmake

make

strip okcash

cp okcash $HOMEDIR

sudo cp okcash /usr/local/bin

# end Client

echo "Done compiling OK from source: Okcash GUI and Daemon - okcash + okcashd - on its latest version for:"
uname -o
echo "enjoy your OK experience"
exit 0