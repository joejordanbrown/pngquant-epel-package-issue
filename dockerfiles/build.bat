@echo off

REM Build Docker Images

SET CUREENT_DIR=%~dp0

REM Build CentOS-6_PngQuant.Dockerfile docker image
docker build -t local/centos-6_pngquant-repo:latest -f "%CUREENT_DIR%/CentOS-6_PngQuant.Dockerfile" .

REM Build CentOS-7_PngQuant.Dockerfile docker image
docker build -t local/centos-7_pngquant-repo:latest -f "%CUREENT_DIR%/CentOS-7_PngQuant.Dockerfile" .

REM Build CentOS-8_PngQuant.Dockerfile docker image
docker build -t local/centos-8_pngquant-repo:latest -f "%CUREENT_DIR%/CentOS-8_PngQuant.Dockerfile" .

REM Build Diff-Image_CentOS-7_ImageMagick7.Dockerfile docker image
docker build -t local/centos-7_imagemagick-repo-remi:latest -f "%CUREENT_DIR%/Diff-Image_CentOS-7_ImageMagick7.Dockerfile" .