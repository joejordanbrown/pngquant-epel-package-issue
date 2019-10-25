@echo off

REM Build CentOS 7 - Test PngQuant source using gcc6

SET CUREENT_DIR=%~dp0

REM Build PngQuant successful docker image
docker build -t local/centos-7_gcc6_pngquant-source:latest -f "%CUREENT_DIR%\Dockerfile" .

REM Run PngQuant successful docker
docker run -i -v "%CUREENT_DIR%/../../scripts:/root/scripts" -v "%CUREENT_DIR%/data:/root/data" -t local/centos-7_gcc6_pngquant-source:latest /bin/bash /root/scripts/test-pngquant.sh

REM Run diff image docker
docker run -i -v "%CUREENT_DIR%/../../scripts:/root/scripts" -v "%CUREENT_DIR%/data:/root/data" -t local/centos-7_imagemagick-repo-remi:latest /usr/bin/perl /root/scripts/diff-image.pl /root/data/pngquant-input.png /root/data/pngquant-output.png -v