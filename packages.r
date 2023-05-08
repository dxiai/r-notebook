packages = "
agridat 
BSDA
car
caret 
cluster
concaveman
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
hunspell 
igraph 
infer 
latex2exp 
paletteer 
patchwork 
pdftools 
randomforrest 
tidygraph 
tidytext
"

install.packages(
    trimws(packages) |>
        strsplit("\\n") |>
        unlist() |>
        lapply(trimws) |>
        unlist() |>
        unique(),
    repos = "https://stat.ethz.ch/CRAN/",
    clean = TRUE
)
