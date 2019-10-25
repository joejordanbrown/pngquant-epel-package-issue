#! /usr/bin/sh

# Build CentOS 7 - Test PngQuant source

CUREENT_DIR="$(dirname $(readlink -f $0))"

# Build PngQuant failed docker image
docker build -t local/centos-7_pngquant-source:latest -f "${CUREENT_DIR}/Dockerfile" .

# Run PngQuant failed docker
docker run -i -v "${CUREENT_DIR}/../../scripts:/root/scripts" -v "${CUREENT_DIR}/data:/root/data" -t local/centos-7_pngquant-source:latest /bin/bash /root/scripts/test-pngquant.sh

# Run diff image docker
docker run -i -v "${CUREENT_DIR}/../../scripts:/root/scripts" -v "${CUREENT_DIR}/data:/root/data" -t local/centos-7_imagemagick-repo-remi:latest /usr/bin/perl /root/scripts/diff-image.pl /root/data/pngquant-input.png /root/data/pngquant-output.png -v