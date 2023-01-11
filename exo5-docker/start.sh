IMAGE=exo5:1.0.0
NETWORK=exo5

echo "[+] construction de l'image ${IMAGE}"
docker build . -t $IMAGE

echo "[+] création du réseau privé ${NETWORK}"
docker network create $NETWORK

echo "[+] création d'un conteneur redis"
docker run --name app -d --network $NETWORK python:3.11-alpine

echo "[+] création d'un conteneur pour l'application simpleweb"
docker run --name web -d -p 5000:5000 --network $NETWORK $IMAGE
