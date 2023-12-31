#!/bin/sh

# Set default shell override shebang
SHELL := /bin/bash

# set default variables from .env file if exist.
ifneq (,$(wildcard ./.env))
    include .env
    export
    ENV_FILE_PARAM = --env-file .env
endif

# Set default values if .env is empty or not exist.

ifeq ($(strip $(TOFUVERSION)),)
  TOFUVERSION := $(shell curl -s https://api.github.com/repos/opentofu/opentofu/releases/latest | jq -r '.tag_name' | sed 's/^v//')
endif

# aws
ifeq ($(strip $(AWS_ACCESS_KEY_ID)),)
  AWS_ACCESS_KEY_ID := ""
endif

ifeq ($(strip $(AWS_SECRET_ACCESS_KEY)),)
  AWS_SECRET_ACCESS_KEY := ""
endif

# azure
ifeq ($(strip $(ARM_CLIENT_ID)),)
  ARM_CLIENT_ID := ""
endif

ifeq ($(strip $(ARM_TENANT_ID)),)
  ARM_TENANT_ID := ""
endif

ifeq ($(strip $(ARM_SUBSCRIPTION_ID)),)
  ARM_SUBSCRIPTION_ID := ""
endif

ifeq ($(strip $(ARM_CLIENT_SECRET)),)
  ARM_CLIENT_SECRET := ""
endif


help: ## Show this helper.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build: ## build docker image
	docker build --build-arg TOFUVERSION=$(TOFUVERSION) -t myopentofu:$(TOFUVERSION) .

##run: run the docker image
run:: build 
	docker run -it -v ${PWD}:/app \
				-e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) \
				-e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) \
				-e ARM_CLIENT_ID=$(ARM_CLIENT_ID) \
				-e ARM_TENANT_ID=$(ARM_TENANT_ID) \
				-e ARM_SUBSCRIPTION_ID=$(ARM_SUBSCRIPTION_ID) \
				-e ARM_CLIENT_SECRET=$(ARM_CLIENT_SECRET) \
				--entrypoint "" \
				myopentofu:$(TOFUVERSION) bash
