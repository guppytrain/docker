sudo docker container start -i "$(sudo docker container ls -lqa -f ancestor=build_latest)"
