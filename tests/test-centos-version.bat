@echo off

REM Build CentOS 6 - Test PngQuant repo package

IF [%1] == [] goto emptyversion

SET CUREENT_DIR=%~dp0

SET CENTOS_VERSION=%1

set CENTOS_VERSIONS[6]=true
set CENTOS_VERSIONS[7]=true
set CENTOS_VERSIONS[8]=true

if defined CENTOS_VERSIONS[%CENTOS_VERSION%] (
    goto:dockerrun
) else (
    goto:wrongversion
)

:dockerrun
    REM Run pngquant test docker
    docker run -i -v "%CUREENT_DIR%/../scripts:/root/scripts" -v "%CUREENT_DIR%/CentOS-%CENTOS_VERSION%/data:/root/data" -t local/centos-%CENTOS_VERSION%_pngquant-repo:latest /bin/bash /root/scripts/test-pngquant.sh
    echo.

    goto:diffimage

:diffimage
    REM Run diff image docker
    echo CentOS %CENTOS_VERSION%
    docker run -i -v "%CUREENT_DIR%/../scripts:/root/scripts" -v "%CUREENT_DIR%/CentOS-%CENTOS_VERSION%/data:/root/data" -t local/centos-7_imagemagick-repo-remi:latest /usr/bin/perl /root/scripts/diff-image.pl /root/data/pngquant-input.png /root/data/pngquant-output.png -v
    echo.

    goto:eof


:emptyversion
    echo CentOS version number parameter missing!
    echo Example: %0 7
    exit /B %ERRORLEVEL%
    goto:eof

:wrongversion
    echo CentOS version not available!
    exit /B %ERRORLEVEL%
    goto:eof