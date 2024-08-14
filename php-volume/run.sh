#!/bin/bash

function printUsage {
    printf "Usage:\n\t> \$ ./run.sh X.Y relative-or-absolute/path/to/some/directory\n";
}

phpVersion=$1
if [ -z $phpVersion ]; then
    printUsage;
    echo 'Specify (1st param) the preferred PHP version like "X.Y"';

    exit 1;
fi

localDirectoryToBeMounted=$2
if [ -z $localDirectoryToBeMounted ]; then
    printUsage;
    echo 'Specify (2nd param) a local path that will be mounted as a container volume.'

    exit 1;
fi
if [ ! -d $localDirectoryToBeMounted ]; then
    echo "'$localDirectoryToBeMounted' path does not exist."

    exit 1;
fi
localMountAbsolutePath=$(readlink -f $localDirectoryToBeMounted)

docker run -it --rm \
    --volume $localMountAbsolutePath:/var/www/volume --workdir=/var/www/volume \
    magic-push-php"$phpVersion" bash
