echo -e "1) Let's start by installing several dependencies"
sleep 3
sed -i '1ideb http://httpredir.debian.org/debian sid main contrib non-free' /etc/apt/sources.list
sed -i '1ideb-src http://httpredir.debian.org/debian sid main contrib non-free' /etc/apt/sources.list
sleep 2
apt-get update
apt-get -qq install -t sid libc6 -y
sleep 5
apt-get -qq install screen curl htop sudo -y
apt-get -qq install x11vnc xvfb libxcursor1 ca-certificates bzip2 libglib2.0-0 -y
update-ca-certificates
echo -e "     Dependencies done ...    "
sleep 3
echo -e "2) Installation of SinusBot"
sleep 5
mkdir /opt/ts3soundboard
cd /opt/ts3soundboard
curl -O https://www.sinusbot.com/dl/sinusbot-beta.tar.bz2
tar -xjf sinusbot-beta.tar.bz2
cp config.ini.dist config.ini
echo -e "SinusBot done ...  "
sleep 3
echo -e " 3) TeamSpeak3-Client-linux_amd64-3.1.6.run"
wget http://dl.4players.de/ts/releases/3.1.6/TeamSpeak3-Client-linux_amd64-3.1.6.run
chmod 0755 TeamSpeak3-Client-linux_amd64-3.1.6.run
su root -c "./TeamSpeak3-Client-linux_amd64-3.1.6.run"
echo -e "TeamSpeak 3 Client done ... "
sleep 3
echo -e "4) Setting SinusBot"
cp plugin/libsoundbot_plugin.so /opt/ts3soundboard/TeamSpeak3-Client-linux_amd64/plugins
chmod 0755 sinusbot
sudo wget https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+x /usr/local/bin/youtube-dl
hash -r
sed -i '1iYoutubeDLPath = "/usr/local/bin/youtube-dl"' /opt/ts3soundboard/config.ini
echo -e "Setting SinusBot done ... "
sleep 3
echo -e "5) Creating SinusBots"
cd /opt/
cp -r ts3soundboard/ ts3soundboard2
cp -r ts3soundboard/ ts3soundboard3
cp -r ts3soundboard/ ts3soundboard4
cp -r ts3soundboard/ ts3soundboard5
cp -r ts3soundboard/ ts3soundboard6
cp -r ts3soundboard/ ts3soundboard7
cp -r ts3soundboard/ ts3soundboard8
cp -r ts3soundboard/ ts3soundboard9
cp -r ts3soundboard/ ts3soundboard10
sed -i -e "s/ListenPort = 8087/ListenPort = 8088/g" "/opt/ts3soundboard2/config.ini"
sed -i -e "s/ListenPort = 8087/ListenPort = 8089/g" "/opt/ts3soundboard3/config.ini"
sed -i -e "s/ListenPort = 8087/ListenPort = 8090/g" "/opt/ts3soundboard4/config.ini"
sed -i -e "s/ListenPort = 8087/ListenPort = 8091/g" "/opt/ts3soundboard5/config.ini"
sed -i -e "s/ListenPort = 8087/ListenPort = 8092/g" "/opt/ts3soundboard6/config.ini"
sed -i -e "s/ListenPort = 8087/ListenPort = 8093/g" "/opt/ts3soundboard7/config.ini"
sed -i -e "s/ListenPort = 8087/ListenPort = 8094/g" "/opt/ts3soundboard8/config.ini"
sed -i -e "s/ListenPort = 8087/ListenPort = 8095/g" "/opt/ts3soundboard9/config.ini"
sed -i -e "s/ListenPort = 8087/ListenPort = 8096/g" "/opt/ts3soundboard10/config.ini"
sed -i -e "s/ts3soundboard/ts3soundboard2/g" "/opt/ts3soundboard2/config.ini"
sed -i -e "s/ts3soundboard/ts3soundboard3/g" "/opt/ts3soundboard3/config.ini"
sed -i -e "s/ts3soundboard/ts3soundboard4/g" "/opt/ts3soundboard4/config.ini"
sed -i -e "s/ts3soundboard/ts3soundboard5/g" "/opt/ts3soundboard5/config.ini"
sed -i -e "s/ts3soundboard/ts3soundboard6/g" "/opt/ts3soundboard6/config.ini"
sed -i -e "s/ts3soundboard/ts3soundboard7/g" "/opt/ts3soundboard7/config.ini"
sed -i -e "s/ts3soundboard/ts3soundboard8/g" "/opt/ts3soundboard8/config.ini"
sed -i -e "s/ts3soundboard/ts3soundboard9/g" "/opt/ts3soundboard9/config.ini"
sed -i -e "s/ts3soundboard/ts3soundboard10/g" "/opt/ts3soundboard10/config.ini"
echo -e "SinusBots created done ..."
sleep 3

cd /opt/ts3soundboard/
export Q=`su sinusbot -c './sinusbot --initonly'`
password=`export | awk '/password/{ print $10 }' | tr -d "'"`
greenMessage "Starting Sinusbot again. Your admin password = '$password'"

echo -e "The Installation is complete!"

