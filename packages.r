packages = "
agridat 
BSDA
car
caret 
cluster
concaveman
corrplot
corrr
dagitty
dendextend 
docxtractr 
flextable
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
pdftools 
ragg
randomforrest 
rmarkdown
stringi
tidygraph 
tidytext
zoo
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
