yum -y install epel-release && yum -y update
yum -y install java-1.8.0-openjdk-headless
curl -sL https://rpm.nodesource.com/setup_10.x | bash -
yum -y install nodejs
yum -y install unzip
yum -y install mc
npm install pm2@latest -g
cd /root/
wget $(curl -s https://api.github.com/repos/taniman/profit-trailer/releases/latest | grep 'browser_download_url' | cut -d\" -f4)
unzip ProfitTrailer*.zip && rm ProfitTrailer*.zip
# Следующей строчкой мы переименовываем каталог ProfitTrailer* в PT-BTC
mv ProfitTrailer* PT-BTC
#Если нужно несколько копий бота, то уберите # у строчек ниже и измените PT-ETH и PT-USDT на нужные.
#cp PT-BTC PT-ETH
#cp PT-BTC PT-USDT
firewall-cmd --zone=public --add-port=8081/tcp --permanent
firewall-cmd --reload
cd ~
cd PT-BTC
chmod +x ProfitTrailer.jar
pm2 start pt2-ProfitTrailer.json
pm2 save
pm2 startup
