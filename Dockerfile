ARG TOFUVERSION

FROM ubuntu:22.04

ARG TOFUVERSION

RUN echo ${TOFUVERSION}

RUN apt -y update && apt -y upgrade
RUN apt -y install \
    curl \
    zip \
    unzip \
    python3-all \
    python-is-python3 \
    python3-virtualenv \
    vim 

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && mkdir -p awsclifiles \
    && unzip awscliv2.zip -d awsclifiles/ \
    && cd awsclifiles \ 
    && ./aws/install

RUN mkdir /opentofu \
    && curl -L https://github.com/opentofu/opentofu/releases/download/v${TOFUVERSION}/tofu_${TOFUVERSION}_linux_amd64.zip -o opentofu.zip \
    && unzip opentofu.zip -d /opentofu \
    && mv /opentofu/tofu /usr/local/bin/ \
    && tofu -install-autocomplete

RUN echo "alias terraform=tofu" >> ~/.bashrc

WORKDIR /app/tofu
