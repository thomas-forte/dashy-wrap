#!/bin/sh

updateImages () {
  echo "Pulling updated images"
  docker compose pull
}

startupServer () {
  echo "Starting Server"
  docker compose up -d
}

stopServer () {
  echo "Stopping Server"
  docker compose down
}

# Main
# =====================================
if [ $# -eq 0 ];
then
  echo "No argument"
  exit 1

elif [ $# -gt 1 ];
then
  echo "Too many arguments"
  exit 1

elif [ "$1" = "up" ];
then
  echo "Starting proxy"
  startupServer

elif [ "$1" = "down" ];
then
  echo "Stopping proxy"
  stopServer

elif [ "$1" = "update" ];
then
  echo "Updating proxy"
  stopServer
  updateImages
  startupServer

else
  echo "Unrecognised argument"
  exit 1
fi
