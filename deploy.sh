
mosquittoConf=$(cat <<-END
listener 1883
# mosquitto -c /etc/mosquitto/mosquitto.conf
listener 8883
cafile /mosquitto/certs/my-ca.crt
keyfile /mosquitto/certs/client.key
certfile /mosquitto/certs/client.crt

listener 9001
protocol websockets

listener 9883
protocol websockets
cafile /mosquitto/certs/my-ca.crt
keyfile /mosquitto/certs/client.key
certfile /mosquitto/certs/client.crt

allow_anonymous true
pid_file /mosquitto/mosquitto.pid
persistence true
persistence_location /mosquitto/data/

# log_dest file /mosquitto/logs/mosquitto.log
log_dest stdout


connection apsuServer
address mqtt.apsu.tech:8883
bridge_cafile /mosquitto/certs/my-ca.crt
# topic # out
# topic # in
topic # both
remote_username ${BID}
remote_password ${BPWD}
END
)

# curl -fLsS https://www.kknd.cn/deployedgebox | sh


curl https://static.apsu.tech/edge/deploy.tar | tar -xv


echo "${mosquittoConf}" > ./deploy/config/mosquitto/config/mosquitto.conf
docker-compose -f ./deploy/docker-compose up
