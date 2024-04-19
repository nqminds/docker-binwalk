# docker-binwalk
This Docker image is designed to facilitate the use of Binwalk for firmware analysis within a Docker environment.
## Prerequisites

Before you begin, ensure you have Docker installed on your system. You can download Docker for Windows, macOS, and various Linux distributions at [Docker Hub](https://www.docker.com/products/docker-hub/).

## Getting Started

### Pulling the Image

To pull the pre-built image from Docker Hub, use the following command:

```sh
docker pull ionutnqm/binwalk_v4:latest
```

This command fetches the latest version of the ionutnqm/binwalk_v4 Docker image from Docker Hub, ensuring you have the newest version of the image with all dependencies pre-installed.

### Building the Image Locally
If you prefer to build the image yourself, perhaps to modify it or ensure it's up to date with your Dockerfile, clone the repository containing the Dockerfile and run the following command in the directory containing the Dockerfile:

```sh
docker build -t user/binwalk:latest .
```

This builds the Docker image using the Dockerfile in the current directory and tags it with the name `user/binwalk:latest .`

### Running the Image
To use the Docker image for firmware analysis, you need to mount the directory containing the firmware image you wish to analyse to the appropriate directory inside the container. Here's how to run the image with Binwalk:

```sh
docker run --rm -v "$(pwd):/home/linuxbrew/data" ionutnqm/binwalk_v4:latest -Me /home/linuxbrew/data/your_firmware_image.bin
```

Replace `your_firmware_image.bin` with the name of your firmware file.

### Command Explanation:
* `--rm`: Automatically remove the container when it exits.
* `-v "$(pwd):/home/linuxbrew/data"`: Mount the current directory (`$(pwd)`) to `/home/linuxbrew/data` inside the container.
* `-Me`: Binwalk flags to recursively extract and scan the firmware.

### Binwalk Usage
For more advanced usage of Binwalk, consult the [Binwalk GitHub repository](https://github.com/ReFirmLabs/binwalk).

### Contributions and Issues
Feel free to fork the repository, submit pull requests, or report issues via the GitHub issue tracker associated with the repository.