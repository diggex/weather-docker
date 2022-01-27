usage() {
    echo "Usage: sh depoly.sh [start|stop|rm|rebuild]"
    exit 1
}

# start all modules 
start(){
    docker-compose up -d weather-nginx weather-php weather-redis
}

# stop all modules
stop(){
    docker-compose stop
}

# remove all modules
rm(){
    docker-compose rm
}

# rebuild
rebuild(){
  echo "stop all docker instance/n";
  docker-compose stop
  echo "remove all docker instance/n";
  docker-compose rm
  echo "build docker instance/n";
  docker-compose build
  echo "start all docker instance/n";
  docker-compose up -d weather-nginx weather-php weather-redis
}

case "$1" in
"start")
    start
;;
"stop")
    stop
;;
"rm")
    rm
;;
"rebuild")
    rebuild
;;

*)
    usage
;;
esac
