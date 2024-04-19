FROM ubuntu:20.04

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
    curl git build-essential file \
    p7zip-full gzip tar unzip python3 python3-pip \
    wget bzip2 arj\
    gzip tar lhasa p7zip \
    cabextract squashfs-tools zlib1g-dev liblzma-dev \
    liblzo2-dev sleuthkit cpio

RUN pip3 install setuptools matplotlib capstone pycryptodome gnupg tk jefferson ubi_reader

RUN git clone --quiet --depth 1 https://github.com/devttys0/sasquatch \
    && (cd sasquatch && ./build.sh && rm -rf ../sasquatch)

RUN git clone --quiet --depth 1 https://github.com/devttys0/yaffshiv \
    && (cd yaffshiv && python3 setup.py install && rm -rf ../yaffshiv)

# Create a non-root user to install and run Homebrew
RUN useradd -m -s /bin/bash linuxbrew && \
    mkdir -p /home/linuxbrew/.linuxbrew && \
    chown -R linuxbrew:linuxbrew /home/linuxbrew

# Switch to the non-root user
USER linuxbrew

# Set the Homebrew directory and add it to PATH
ENV HOME=/home/linuxbrew
ENV PATH=$HOME/.linuxbrew/bin:$PATH


RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Binwalk using Homebrew, setting a higher ulimit before installation
RUN ulimit -n 65535 && brew install binwalk

WORKDIR /home/linuxbrew

ENTRYPOINT ["binwalk"]
