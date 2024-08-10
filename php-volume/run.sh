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

mountOptions="destination=/var/www/volume"
# Do not specify the source volume name if you want the volume to be auto-deleted after a container is shut down.
# mountOptions="$mountOptions,source=volume-dir"
mountOptions="$mountOptions,volume-driver=local"
mountOptions="$mountOptions,volume-opt=device=$localMountAbsolutePath"
mountOptions="$mountOptions,volume-opt=type=none"
mountOptions="$mountOptions,volume-opt=o=bind"

docker run \
    -it --rm \
    --name php"$phpVersion"-running \
    --mount $mountOptions \
    magic-push-php"$phpVersion"
