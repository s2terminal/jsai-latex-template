FROM ubuntu:22.04
WORKDIR /app

ENV TEXLIVE_VERSION=2022

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar xvf install-tl-unx.tar.gz
RUN cd install-tl-2* && ./install-tl -no-gui --no-interaction -repository http://mirror.ctan.org/systems/texlive/tlnet/
RUN /usr/local/texlive/${TEXLIVE_VERSION}/bin/$(uname -m)-linux/tlmgr path add
