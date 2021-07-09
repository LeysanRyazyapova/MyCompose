docker-compose down
docker stop $(docker ps -qa)
docker rm $(docker ps -qa)
docker network rm $(docker network ls -q)
docker volume rm $(docker volume ls -q)
docker system prune -af
docker rmi -f $(docker images -qa)

rm -rf ~/data/db/*
rm -rf ~/data/wordpress/*