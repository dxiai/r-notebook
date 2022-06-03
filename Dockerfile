# Dont use the minimal-notebook container, as it will not provide the latest releases
ARG BASE_CONTAINER=jupyter/base-notebook
ARG BASE_VERSION=latest
FROM ${BASE_CONTAINER}:${BASE_VERSION}

ENV JUPYTER_ENABLE_LAB=yes

LABEL maintainer="phish108 <info@mobinaut.io>"
LABEL version="30"

USER root

# R pre-requisites
RUN echo "v0029-1" && \
    apt-get update --yes && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    unixodbc \
    unixodbc-dev \
    r-cran-rodbc \
    gfortran \
    gcc \
    # From minimal notebook
    build-essential \
    git \
    unzip \
    tzdata \
    nano \
    jed \
    hunspell \
    hunspell-de-de-frami \
    hunspell-de-ch-frami \
    hunspell-en-gb \
    hunspell-en-us \
    # poppler-utils \
    language-pack-de \
    && \
    apt-get autoremove --purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID

COPY packages.yml .

# Install the very latest jupyterlab and its environment
# The following steps install important R packages

# official containers use the newer mamba tool over conda. However, mamba does not accept conda's package file format. 
RUN echo "conda 0030-0" && \
    #whoami && \
    #cat /etc/passwd | grep $NB_UID && \
    #ls -l /opt/ /opt/conda/ && \
    #conda uninstall --quiet --yes 'jupyterlab' && \
    conda env update -n base --file packages.yml && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions "/home/${NB_USER}" && \
    rm packages.yml

# Install R extensions for google services

# Note that we may want to shift to googlesheets4 if it is official
# https://github.com/tidyverse/googlesheets4 

# ggwordcloud is a ggplot compliant interfaces for r-wordcloud2 

# docxtractor is a tool for importing labelled interview transcriptions in word files 
RUN Rscript -e 'install.packages(c("googlesheets4", "ggwordcloud", "docxtractr", "ggdag"), repos= "https://stat.ethz.ch/CRAN/")'

## The following lines may become useful in the future if-when JL has proper language support.

ENV LANG=de_CH.UTF-8
ENV LANGUAGE=de_CH.UTF-8

ENV JUPYTER_LOG_LEVEL=1
