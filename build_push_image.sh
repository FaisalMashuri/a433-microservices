#!/bin/bash

# Nama image
IMAGE_NAME=item-app
TAG=v1

# Username GitHub Anda
GITHUB_USER=faisalmashuri
REPO_NAME=a433-microservices

# Build image lokal
docker build -t $IMAGE_NAME:$TAG .

# Lihat image di lokal
docker images

# Tag image sesuai GitHub Packages (ghcr.io)
docker tag $IMAGE_NAME:$TAG ghcr.io/$GITHUB_USER/$IMAGE_NAME:$TAG

# Login ke GitHub Container Registry
echo "Masukkan PAT (GitHub Personal Access Token):"
read -s TOKEN
echo $TOKEN | docker login ghcr.io -u $GITHUB_USER --password-stdin

# Push ke GitHub Packages
docker push ghcr.io/$GITHUB_USER/$IMAGE_NAME:$TAG
