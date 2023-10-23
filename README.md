
## About

Run OpenTofu inside a Docker Image with a desired version,
we will not use alpine as base image since it not install autocomplete,

The Makefile are configured to receive both AWS or Azure Credentials,
if you want to use any other provider implement it as args on Dockerfile and Makefile,

If you not pass any OpenTofu specific version it will get the last one deployed on Github.

You can set AWS/Azure Credentials on .env file following .envexample, you can change also the opentofu version inside .env.

