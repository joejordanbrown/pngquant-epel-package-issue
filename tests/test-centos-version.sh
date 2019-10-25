#! /usr/bin/sh

CUREENT_DIR="$(dirname $(readlink -f $0))"

CENTOS_VERSION=$1

CENTOS_VERSIONS=(6 7 8)

if [ -z "$1" ]; then
    echo "CentOS version number parameter missing!"
    echo "Example: $0 7"
    exit
fi

if [[ ! "${CENTOS_VERSIONS[@]}" =~ "$1" ]]; then
    echo "CentOS version $CENTOS_VERSION not available!"
    exit
fi

# Run pngquant test docker
docker run -i -v "${CUREENT_DIR}/../scripts:/root/scripts" -v "${CUREENT_DIR}/CentOS-%CENTOS_VERSION%/data:/root/data" -t local/centos-${CENTOS_VERSION}_pngquant-repo:latest /bin/bash /root/scripts/test-pngquant.sh

# Run diff image docker
echo "CentOS ${CENTOS_VERSION}"
docker run -i -v "${CUREENT_DIR}/../scripts:/root/scripts" -v "${CUREENT_DIR}/CentOS-%CENTOS_VERSION%/data:/root/data" -t local/centos-7_imagemagick-repo-remi:latest /usr/bin/perl /root/scripts/diff-image.pl /root/data/pngquant-input.png /root/data/pngquant-output.png -v