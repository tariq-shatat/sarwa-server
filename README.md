# Sarwa Go Test Server (DevOps Assessment)

This repository is dedicated to the Test Go server used for Sarwa DevOps assignment.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)

## Repository Structure

This repository contains the simple Go server that returns `Success!` on path `/`, and structured as follows.

- `src/`: contains the source code for the server developed in `Go` language.
- `Dockerfile`: contains the declarative definition for building docker images for both dev and production.
- `buildspec.yml`: AWS code build pipeline definition.

## Running in Docker Locally

This Docker image has been built in a multi-stage style, where

- `build`: the first stage using the full featured go docker image, which will be a larger image size.
- `prod`: the second stage copy only the executable file into an alpine version which will result into a much smaller size.

You can build and run the docker file on your local machine as follows

- Build the Docker Image
  - Development `docker build . --target build -t sarwa-dev`
  - Production `docker build . --target prod -t sarwa-prod`
- Run the docker image locally
  - `docker run -dp 8001:8000 sarwa-dev`

## Shipping into Production 

A CI/CD pipeline has been setup with this repo, where every merge into the main branch will trigger the pipeline all the way to the production environment.

### Building the project 

The CI part is created using the `buildspec.yml` file and basically building the docker image, pushing the docker image and finally creating a new version of the task definition.

All the other pipeline implementation details can be found in the main [sarwa-infra](https://github.com/tariq-shatat/sarwa-infra) repo.
