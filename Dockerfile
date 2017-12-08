FROM rocker/binder:3.4.2


USER root

## Install system dependency for gsl package
RUN apt-get update && apt-get -y install libgsl-dev

## Copies your repo files into the Docker Container
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

## Become normal user again
USER ${NB_USER}

## Run an install.R script, if it exists.
RUN if [ -f install.R ]; then R --quiet -f install.R; fi
