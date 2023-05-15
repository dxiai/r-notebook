packages = "
agridat 
BSDA
car
caret 
cluster
corrplot
corrr
dagitty
dendextend 
docxtractr 
ggdag 
ggforce 
gghighlight 
ggnewscale 
ggrepel 
ggtext 
ggwordcloud 
googlesheets4 
gt
gtsummary
hunspell 
igraph 
infer 
latex2exp 
paletteer 
patchwork 
rmarkdown
stringi
tidygraph 
tidytext
zoo
"

# level2_packages = "
# concaveman
# flextable
# "

pkgs = trimws(packages) |>
        strsplit("\\n") |>
        unlist() |>
        lapply(trimws) |>
        unlist() |>
        unique()

install.packages(
   pkgs[!(pkgs %in% installed.packages()[, "Package"])],
   repos = "https://stat.ethz.ch/CRAN/",
   clean = TRUE
)

# pkgs = trimws(level2_packages) |>
#         strsplit("\\n") |>
#         unlist() |>
#         lapply(trimws) |>
#         unlist() |>
#         unique()

# install.packages(
#    pkgs[!(pkgs %in% installed.packages()[, "Package"])],
#    repos = "https://stat.ethz.ch/CRAN/",
#    clean = TRUE
# )

# Once pak building does not fail on basic packages, use this:
#
# install.packages(
#         "pak",
#         repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s",
#         .Platform$pkgType,
#         R.Version()$os,
#         R.Version()$arch),
#         clean = TRUE
#     )

# pak::pkg_install(pkgs[!(pkgs %in% installed.packages()[, "Package"])])

# pak::meta_clean(force = TRUE)
# pak::cache_clean(force = TRUE)
