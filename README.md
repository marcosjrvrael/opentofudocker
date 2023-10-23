
## Objective

Run OpenTofu inside a Docker Image with a desired version,
we will not use alpine as base image since it not install autocomplete,

The Makefile are configured to receive both AWS or Azure Credentials,
if you want to use any other provider implement it as args on Dockerfile and Makefile,

If you not pass any OpenTofu specific version it will get the last one deployed on Github.

You can set AWS/Azure Credentials on .env file following .envexample, you can change also the opentofu version inside .env.

## What is OpenTofu?

OpenTofu is a open source fork of terraform since hashicorp has made it a non-open source anymore,
you may find more details in https://www.linuxfoundation.org/press/announcing-opentofu  
Remember also to check OpenTofu official repository: https://github.com/opentofu/opentofu

## using opentofu

There is no difference between the actual version (1.6.x) of terraform and opentofu (1.6.x) but in the future it can happen,
but to run opentofu you will use .tf files, and run tofu command instead of terraform command.
for example:

before
`terraform plan -out plan`
now
`tofu plan -out plan`

And so on...

## Makefile

The main command is `make run`
To check the other commands open makefile archive or type `make help`
