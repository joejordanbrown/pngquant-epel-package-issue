#! /usr/bin/sh

# Build Docker Images

CUREENT_DIR="$(dirname $(readlink -f $0))"

# Build CentOS-6_PngQuant.Dockerfile docker image
docker build -t local/centos-6_pngquant-repo:latest -f "${CUREENT_DIR}/CentOS-6_PngQuant.Dockerfile" .

# Build CentOS-7_PngQuant.Dockerfile docker image
docker build -t local/centos-7_pngquant-repo:latest -f "${CUREENT_DIR}/CentOS-7_PngQuant.Dockerfile" .

# Build CentOS-8_PngQuant.Dockerfile docker image
docker build -t local/centos-8_pngquant-repo:latest -f "${CUREENT_DIR}/CentOS-8_PngQuant.Dockerfile" .

# Build Diff-Image_CentOS-7_ImageMagick7.Dockerfile docker image
docker build -t local/centos-7_imagemagick-repo-remi:latest -f "${CUREENT_DIR}/Diff-Image_CentOS-7_ImageMagick7.Dockerfile" .