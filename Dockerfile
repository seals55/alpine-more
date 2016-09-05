FROM alpine:latest

ARG fdupesver=1.6.1

RUN apk update && apk --no-cache add bash ncdu nano alpine-sdk
RUN apk --no-cache add git autoconf automake libtool openssl-dev linux-pam-dev zlib-dev
#  zlib-devel 

ADD https://github.com/adrianlopezroche/fdupes/archive/v${fdupesver}.tar.gz /tmp/fdupes/src.tar.gz
WORKDIR /tmp/fdupes
RUN tar -xvf src.tar.gz
WORKDIR /tmp/fdupes/fdupes-${fdupesver}
RUN make fdupes
RUN make install

WORKDIR /
RUN rm -rf /tmp/fdupes

RUN apk --no-cache del alpine-sdk

RUN echo 'alias ll="ls -la"' > /root/.bashrc

EXPOSE ["22"]

ENTRYPOINT ["bash"]

