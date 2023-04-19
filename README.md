# ZHAW Jupyter r-notebook

Extended Jupyter Notebook container for R-Notebooks. 

This container is used in DxI-Classes at the ZHAW School of Life Sciences and Facility Management. It contains all R-libraries that are used during in our courses during the first year. 

This version of the R-Notebook contains a few extensions compared to the vanilla r-notebook.

1. It ships with the latest JLab version.
2. It comes with git, visual help, and the variable inspector to make it more comparable with RStudio
3. It brings many extras libraries directly baked into the container such as tidytext, pdftools, dagitty and tidymodels
4. It drops TeX and SVG support and reduces the overall container size by almost 0.5GB

This version builds from the upstream `base-notebook:latest` rather than extending the r-notebook itself.

You find a full list of included R-libraries in the `packages.yml` file

## Run at Home

On MacOS

```
docker run -it -p 8888:8888 -v ~/Dokumente:/home/jovyan/ ghcr.io/dxiai/r-notebook:latest
```

When the following error occurs: "docker pull ghcr.io/dxiai/r-notebook:latest  
Error response from daemon: Head "https://ghcr.io/v2/dxiai/r-notebook/manifests/latest": denied: denied", then
You must first logout ghcr.io using `docker logout`.

```
docker run -it -p 8888:8888 -v ~/Dokumente:/home/jovyan/ ghcr.io/dxiai/r-notebook:latest
```

On Windows

```
docker run -it --rm -p 8888:8888 -v Dokumente:/home/jovyan/ ghcr.io/dxiai/r-notebook:latest
```

On Linux

```
docker run -it -p 8888:8888 -v ~/daten:/home/jovyan/ ghcr.io/dxiai/r-notebook:latest
```

## Troubleshooting

If you run into authentication problems, do these two steps:

Logout the `github` account. Normally this is not necessary, because no one should not log into GitHubs container registry, directly. 

```
docker logout ghcr.io  
```

- Use a local **directory location** on **the host**. E.g., `~/code/data/`.
- Use the specific image version at `v2022.09.19` instead of `latest`.

```
docker run -it -p 8888:8888 -v ~/code/data/ ghcr.io/dxiai/r-notebook:v2022.09.19 
```

Alternatively, be specific on the internal mount point of the data directory. 

```
docker run -it -p 8888:8888 -v ~/code/data/:/home/jovyan ghcr.io/dxiai/r-notebook:v2022.09.19 
```


## Build for local testing

***IMPORTANT*** This Repository has automatic docker images built with github actions. **Under normal circumstances it is not necessary to push new images to the registry**!

For an updated release change the LABEL version number in the `Dockerfile`. Normally, this is fine. 

```
> BUILD_DATE=$DATE_betacounter; docker build --pull -t ghcr.io/dxiai/r-notebook:v{$BUILD_DATE} -t ghcr.io/dxiai/r-notebook:latest .
```

Important: `--pull` forces docker to pull a newer version of the base image for the same tag. 

Push only releases using

```
> docker push ghcr.io/dxiai/r-notebook:v{$BUILD_DATE}
> docker push ghcr.io/dxiai/r-notebook:latest
```

## Customize

Edit the `package.yml` file to customize the conda packages.

## Todo

apt packages should be listed in a separate file as well. 
