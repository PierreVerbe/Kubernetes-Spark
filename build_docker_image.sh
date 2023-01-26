docker build -f docker/Dockerfile -t spark-hadoop:3.2.0 ./docker
docker image ls | grep spark-hadoop
