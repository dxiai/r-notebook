# Dont use the minimal-notebook container, as it will not provide the latest releases
ARG BASE_CONTAINER=jupyter/base-notebook
ARG BASE_VERSION=2023-05-15
FROM ${BASE_CONTAINER}:${BASE_VERSION}

ENV JUPYTER_ENABLE_LAB=yes

LABEL maintainer="phish108 <info@mobinaut.io>"
LABEL version="31"

USER root

COPY packages.txt .

# R pre-requisites
RUN echo "v0030-1" && \
    apt-get update --yes && \
    apt-get install -y --no-install-recommends $(cat packages.txt) && \
    apt-get autoremove --purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* packages.txt

USER $NB_UID

COPY packages.yml .

# Install the very latest jupyterlab and its environment
# The following steps install important R packages

RUN echo "conda 0030-1" && \
    #whoami && \
    #cat /etc/passwd | grep $NB_UID && \
    #ls -l /opt/ /opt/conda/ && \
    #conda uninstall --quiet --yes 'jupyterlab' && \
    mamba env update -n base --file packages.yml && \
    mamba clean --all -f -y && \
    rm packages.yml && \
    # make python happy
    fix-permissions $CONDA_DIR && \
    fix-permissions "/home/${NB_USER}" && \
    jupyter labextension disable "@jupyterlab/apputils-extension:announcements"

COPY beispieldb.sqlite3 /usr/local/share/data/
COPY testlibraries.R /usr/local/share/data/
COPY packages.r packages_pak.r /usr/local/share/data/

# Install R packages from CRAN
# DONT USE ANACONDA PACKAGES FOR R OTHER THAN THE CORE
# RUN Rscript /usr/local/share/data/packages.r 
RUN Rscript /usr/local/share/data/packages_pak.r 

## The following lines may become useful in the future if-when JL has proper language support.

ENV LANG=de_CH.UTF-8
ENV LANGUAGE=de_CH.UTF-8

ENV JUPYTER_LOG_LEVEL=1
