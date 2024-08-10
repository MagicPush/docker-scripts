#!/bin/bash

scriptDirectory=$(dirname $(readlink -f $0));

phpVersion=$1
if [ -z $phpVersion ]; then
    echo 'Specify the preferred PHP version like "X.Y"';

    exit 1;
fi

docker build --build-arg phpversion=$phpVersion -t magic-push-php"$phpVersion" $scriptDirectory
