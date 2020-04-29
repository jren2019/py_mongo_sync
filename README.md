
# Prepare images
docker build -t watchonmongo .

docker-compose build

docker build -t watchonmongo .

docker build -t api:0.1 .

docker run -it --name wm watchonmongo:latest bash

