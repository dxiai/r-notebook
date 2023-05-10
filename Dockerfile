# Dont use the minimal-notebook container, as it will not provide the latest releases
ARG BASE_CONTAINER=jupyter/base-notebook
ARG BASE_VERSION=latest
FROM ${BASE_CONTAINER}:${BASE_VERSION}

ENV JUPYTER_ENABLE_LAB=yes

LABEL maintainer="phish108 <info@mobinaut.io>"
LABEL version="31"

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
    # needed by the ragg package 
    language-pack-de \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    && \
    apt-get autoremove --purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID

COPY packages.yml packages.r .
COPY beispieldb.sqlite3 /usr/local/share/data/

# Install the very latest jupyterlab and its environment
# The following steps install important R packages

RUN echo "conda 0030-0" && \
    #whoami && \
    #cat /etc/passwd | grep $NB_UID && \
    #ls -l /opt/ /opt/conda/ && \
    #conda uninstall --quiet --yes 'jupyterlab' && \
    mamba env update -n base --file packages.yml && \
    mamba clean --all -f -y && \
    rm packages.yml && \
    # Install R packages from CRAN
    # DONT USE ANACONDA PACKAGES FOR R OTHER THAN THE CORE
    Rscript ./packages.r && \
    rm packages.r && \
    # make python happy
    fix-permissions $CONDA_DIR && \
    fix-permissions "/home/${NB_USER}" && \
    jupyter labextension disable "@jupyterlab/apputils-extension:announcements"

## The following lines may become useful in the future if-when JL has proper language support.

ENV LANG=de_CH.UTF-8
ENV LANGUAGE=de_CH.UTF-8

ENV JUPYTER_LOG_LEVEL=1
