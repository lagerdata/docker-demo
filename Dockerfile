FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /home/dev

RUN apt-get update
RUN apt-get install -y wget bzip2 cmake ninja-build python

COPY gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2 .
# Or -- RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2

RUN tar xvf gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2


ENV PATH $PATH:/home/dev/gcc-arm-none-eabi-9-2020-q2-update/bin
ENV GNU_INSTALL_ROOT /home/dev/gcc-arm-none-eabi-9-2020-q2-update/bin
ENV GNU_PREFIX arm-none-eabi

RUN useradd appuser
WORKDIR /app
RUN chown appuser:appuser /app
USER appuser
