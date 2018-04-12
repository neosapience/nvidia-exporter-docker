ARG cuda_version
FROM nvidia/cuda:${cuda_version}-devel-ubuntu16.04 AS build

RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  wget \
  && mkdir /build

WORKDIR /build

ENV GO_VERSION 1.10.1
ENV OS linux
ENV ARCH amd64
ENV GOPATH /build/go
RUN \
  wget https://dl.google.com/go/go$GO_VERSION.$OS-$ARCH.tar.gz &&\
  tar -C /usr/local -xzf go$GO_VERSION.$OS-$ARCH.tar.gz &&\
  mkdir $GOPATH

ENV PATH ${PATH}:/usr/local/go/bin

RUN git clone https://github.com/tankbusta/nvidia_exporter.git &&\
  cd nvidia_exporter && \
  go get github.com/prometheus/client_golang/prometheus &&\
  go build -o nvidia-exporter &&\
  cp nvidia-exporter /usr/bin/nvidia-exporter


FROM nvidia/cuda:${cuda_version}-base-ubuntu16.04
EXPOSE 9114

COPY --from=build /usr/bin/nvidia-exporter /usr/bin/
CMD nvidia-exporter
