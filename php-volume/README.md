
# Docker container: php plus volume

_(tested on: `Docker version 27.1.1, build 6312585`)_

When you need just to launch your local console PHP application by mounting its folder into a container with php-cli.

1. Run `build.sh X.Y` to build an image for a corresponding PHP version.

    For instance, `./build.sh 8.3` will create an image named `magic-push-php8.3` with php-cli of version 8.3
1. Run `./run.sh X.Y path/to/directory/with/your/script` to run a container with a corresponding PHP version
   and a temporarily anonymous volume: your specified directory will be linked with a directory in the container.
   After you exit the container, both container and volume will be removed.

    For instance, `./run.sh 8.3 projects/MagicPush/cli-toolkit/` will run previously created `magic-push-php8.3` container
    and bind `projects/MagicPush/cli-toolkit/` local directory to `/var/www/volume` inside the container.
