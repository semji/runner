# Semji Gitlab Runner

This repository contains the Dockerfile we use to build an optimized Docker image we use in our Gitlab CI runners.

## Build

On a classic x64 architecture, just drop the following command:

```
docker build -t semji/runner:latest .
```

If you're on a different architecture, such as ARM64 for examples, use buildx to build the image:

```
docker buildx build --platform linux/amd64 --tag semji/runner:latest --load .
```

## Push on Docker Hub

```
docker push semji/runner:latest
```
