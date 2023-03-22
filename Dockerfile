FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y \
  build-essential \
  curl 
RUN apt-get update

RUN curl https://sh.rustup.rs -sSf | bash -s -- -vy

ENV PATH="/root/.cargo/bin:${PATH}"

