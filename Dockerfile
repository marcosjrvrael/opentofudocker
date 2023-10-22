ARG TOFUVERSION

FROM ubuntu:22.04

ARG TOFUVERSION

RUN echo ${TOFUVERSION}

RUN apt -y update && apt -y upgrade
RUN apt -y install \
    curl \
    zip \
    unzip

RUN mkdir /opentofu \
    && curl -L https://github.com/opentofu/opentofu/releases/download/v${TOFUVERSION}/tofu_${TOFUVERSION}_linux_amd64.zip -o opentofu.zip \
    && unzip opentofu.zip -d /opentofu \
    && mv /opentofu/tofu /usr/local/bin/ \
    && tofu -install-autocomplete

WORKDIR /app