cd /data/amiibo_server
git submodule init
git submodule update
cd amiitool
git pull origin master
./build.sh
