## Create a network
```
docker network create lemoncode-challenge
```
## Create a run mongodb container
```
docker run -d --network lemoncode-challenge --name some-mongo mongo:latest
```
## Build backend container
```
docker build -t backend -f ./node-stack/backend/Dockerfile ./node-stack/backend/
```
## Run backend container
```
docker run -d --name topics-api --network lemoncode-challenge -e DATABASE_URL="mongodb://some-mongo:27017" backend
```
## Build frontend container
```
docker build -t frontend -f ./node-stack/frontend/Dockerfile ./node-stack/frontend/
```
 ## Run frontend container
```
docker run -d --name frontend -e API_URI="http://topics-api:5000/api/topics" --network lemoncode-challenge -p 3000:3000 frontend
```