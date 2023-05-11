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

## Batteries included 🦾

The focus of the this container is R-development and data-analysis. 

Python and Anaconda packages are managed in the `packages.yml` file. 

R packages are managed in the `packages.r` file. 

Many CRAN packages are not well-maintained or lag behind the official releases on Anaconda. Therefore this container installs most R packges directly from CRAN. 

The focus of this container is on data visualisation and basic stats. We try match the packages mentioned in the ggplot book in this container.

The following R-packages are installed via the package management:

- agridat
- boot (via anaconda)
- BSDA
- car
- caret
- cluster
- concaveman
- [corrplot](https://github.com/taiyun/corrplot)
- [corrr](https://corrr.tidymodels.org/)
- crayon (via anaconda)
- dagitty
- dendextend
- [devtools](https://devtools.r-lib.org/) (via anaconda)
- docextractor
- e1071 (via anaconda)
- [flextable](https://ardata-fr.github.io/flextable-book/)
- forecast (via anaconda)
- ggdag 
- ggforce
- gghighlight
- ggnewscale
- ggrepel 
- ggtext
- ggwordcloud
- [googlesheets4](https://googlesheets4.tidyverse.org/)
- [gt](https://gt.rstudio.com/)
- gtsummary
- htmlwidgets (via anaconda)
- hunspell
- igraph
- infer
- latex2exp
- [ragg](https://ragg.r-lib.org/)
- rmarkdown
- paletteer
- patchwork
- pdftools
- randomforrest
- rcurl (via anaconda)
- rodbc (via anaconda)
- rsqlite (via anaconda)
- shiny (via anaconda)
- tidygraph
- [tidymodels](https://www.tidymodels.org/) (via anaconda)
- tidytext
- [tidyverse](https://www.tidyverse.org/) (via anaconda)
- zoo

The complete list of packages that are available for the code are: 

> askpass assertthat backports base base64enc bit bit64 bitops blob boot brew brio broom bslib cachem callr caTools cellranger class classInt cli clipr cluster codetools colorspace commonmark compiler concaveman conflicted corrr cpp11 crayon credentials crosstalk curl dagitty data.table datasets DBI dbplyr dendextend desc devtools dials DiceDesign dichromat diffobj digest docxtractr downlit dplyr dtplyr e1071 ellipsis evaluate fansi farver fastmap fontawesome forcats foreach forecast fracdiff fs furrr future future.apply gameofthrones gargle gclus generics gert ggdag ggforce gghighlight ggnewscale ggplot2 ggraph ggrepel ggtext ggthemes ggwordcloud gh gitcreds globals glue googledrive googlesheets4 gower GPfit gplots graphics graphlayouts grDevices grid gridExtra gridtext gtable gtools hardhat harrypotter haven highr hms htmltools htmlwidgets httpuv httr hunspell ids igraph infer ini ipred IRdisplay IRkernel isoband ISOcodes iterators janeaustenr jcolors jpeg jquerylib jsonlite KernSmooth knitr labeling later latex2exp lattice lava lazyeval lhs lifecycle listenv lmtest lubridate magrittr manipulateWidget mapproj maps markdown MASS Matrix memoise methods mgcv mime miniUI modeldata modelr munsell nlme nnet numDeriv oompaBase openssl paletteer palr pals parallel parallelly parsnip patchwork pbdZMQ pdftools pillar pkgbuild pkgconfig pkgdown pkgload plogr png polyclip praise prettyunits prismatic processx prodlim profvis progress progressr promises proxy ps purrr qap qpdf quadprog quantmod R6 ragg rappdirs rcmdcheck RColorBrewer Rcpp RcppArmadillo RcppEigen RCurl readr readxl recipes registry rematch remtch2 remotes repr reprex rgl rlang rmarkdown RODBC roxygen2 rpart rprojroot rsample RSQLite rstudioapi rversions rvest s2 sass scales scico selectr seriation sessioninfo sf shiny shinyjs slider SnowballC sourcetools splines SQUAREM stats stats4 stopwords stringi stringr survival sys systemfonts tcltk testthat textshaping tibble tidygraph tidymodels tidyr tidyselect tidytext tidyverse timeDate tinytex tokenizers tools tseries TSP TTR tune tweenr tzdb units urca urlchecker usethis utf8 utils uuid V8 vctrs viridis viridisLite vroom waldo warp webshot whisker withr wk wordcloud wordcloud2 workflows workflowsets xfun xml2 xopen xtable xts yaml yardstick zip zoo

## Run at Home 🏠💻

This docker image is designed to run on Intel and ARM-based systems that has [Docker or Docker Desktop](https://docker.com) installed. This allows you to run this image on the most recent Mac and Windows machines - and of course on Linux. 

### On MacOS

```
docker run -it -p 8888:8888 -v ~/Dokumente:/home/jovyan/ ghcr.io/dxiai/r-notebook:latest
```

When the following error occurs: "docker pull ghcr.io/dxiai/r-notebook:latest  
Error response from daemon: Head "https://ghcr.io/v2/dxiai/r-notebook/manifests/latest": denied: denied", then
You must first logout ghcr.io using `docker logout`.

```
docker run -it -p 8888:8888 -v ~/Dokumente:/home/jovyan/ ghcr.io/dxiai/r-notebook:latest
```

### On Windows

```
docker run -it --rm -p 8888:8888 -v Dokumente:/home/jovyan/ ghcr.io/dxiai/r-notebook:latest
```

### On Linux

```
docker run -it -p 8888:8888 -v ~/daten:/home/jovyan/ ghcr.io/dxiai/r-notebook:latest
```

## Troubleshooting

If you run into authentication problems, do these two steps:

Logout the `github` account. Normally this is not necessary, because nobody should log into GitHubs container registry, directly. 

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
> docker build --pull -t r-notebook:local .
```

Important: `--pull` forces docker to pull a newer version of the base image for the same tag. 

The local build takes about 15 minutes on a modern machine. A full build on Github Actions takes about 5-6 **hours**!

### Building on ARM (Apple M1/M2)

The build process is platform dependent. The github process builds versions for ARM and AMD64/Intel platform. However, the standard deployment in the cloud is on the Linux/amd64 platform. As the build process slightly differs, it is necessary to test the AMD64 build locally. 

```bash
> docker build --platform linux/amd64 --pull -t r-notebook:localamd .
```

> On MacOS with M1 or M2 chips, ensure that docker has the *experimental* Rosetta support enabled. Otherwise the build process takes about a day. With Rosetta enabled, the build takes about 5 minutes longer than the native build.

Run this platform image locally by using the following command. 

```bash
> docker run -it --rm -p 8888:8888 --plattform linux/amd64 r-notebook:localamd
```

All relevant libraries must load without errors.

## Customize

For customization it is not necessary to alter the Dockerfile. All dependencies are managed in package files. 

- `packages.txt` lists the required debian packages. Any package listed here will be slightly outdated as the minimal notebook image is based on debian stable.
- `packages.yml` lists the conda packages. This file contains any Jupyter related packages as well as the core R packages that are needed for the IRKernel. Jupyter related packages are much more up-to-date than the debian packages. 
- `packages.r` holds the list of common CRAN packages. All R-Packages that are not listed in package.yml have to be listed here, as the conda-repositories do not provide well-maintained versions of these packages. All packages in this file will be compiled during build time.

> ***`packages.r` and `packages.txt` don't allow comments!***
