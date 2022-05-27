docker stop running-app || true
docker build -t app .
docker run -it --rm --name running-app app