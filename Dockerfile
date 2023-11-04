FROM ubuntu as biuld 
WORKDIR /app
RUN apt-get update && apt-get install pip