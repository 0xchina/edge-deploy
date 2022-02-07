if [ -z "${APSU_EDGE_TOKEN}" ]; then
    echo "APSU_EDGE_TOKEN is not set"
    exit 666  
fi

if [ -z "$BID" ]; then
  echo "no BID"
  exit 666
fi

if [ -z "$BPWD" ]; then
  echo "no BPWD"
  exit 666
fi
curl http://static.apsu.tech/edge/docker-compose.yml > docker-compose.yml
docker login -u apsubox -p apsubox123
docker-compose up -d