yum -y install epel-release && yum -y update
yum -y install java-1.8.0-openjdk-headless
yum -y install nodejs
yum -y install unzip
yum -y install mc
npm install pm2@latest -g
cd /root/
wget $(curl -s https://api.github.com/repos/taniman/profit-trailer/releases/latest | grep 'browser_download_url' | cut -d\" -f4)
unzip ProfitTrailer*.zip && rm ProfitTrailer*.zip
mv ProfitTrailer* ProfitTrailerBTC
firewall-cmd --zone=public --add-port=8081/tcp --permanent
firewall-cmd --reload
