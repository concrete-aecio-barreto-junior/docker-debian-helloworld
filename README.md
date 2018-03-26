__Concrete Solutions | DevOps - OnBoarding__

# **Trello (Card):** Learn the basics about Docker
**Description:** Create a Docker Image using Debian Jessie running a Hello World website

- [GitHub | concrete-aecio-barreto-junior/Docker-Debian-HelloWolrd](https://github.com/concrete-aecio-barreto-junior/docker-debian-helloworld/blob/master/Dockerfile)
- [DockerHub | concreteaeciobarretojunior/debian-helloworld](https://hub.docker.com/r/concreteaeciobarretojunior/debian-helloworld/)

**Steps:**

- Building image (ignoring cache):
```
docker build --no-cache -t debian-helloworld .
```

- Pushing image to Dockerhub:
```
docker login
docker tag 3c31b2f75b3a concreteaeciobarretojunior/debian-helloworld
docker push concreteaeciobarretojunior/debian-helloworld
```

- Docker pull command
```
docker pull concreteaeciobarretojunior/debian-helloworld
```
