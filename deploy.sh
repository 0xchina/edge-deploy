# curl -fLsS https://www.kknd.cn/deployedgebox | sh


curl https://static.apsu.tech/edge/deploy.tar | tar -xv
cd deploy
docker-compose up