cd /data/amiibo_server
git submodule init
git submodule update
cd amitool
git pull origin master
./build.sh
