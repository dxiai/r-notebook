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
latex2exp 
paletteer 
patchwork  
rmarkdown
rstatix
stringi
tidygraph 
tidytext
zoo
tidyverse
tidymodels
"

trimws(packages) |>
        strsplit("\\n") |>
        unlist() |>
        lapply(trimws) |>
        unlist() |>
        unique() |>
        lapply(function(x) {
            tryCatch(
                {
                    library(x, character.only = TRUE)
                },
                error = function(e) {
                    x <<- paste0("Error ", x)
                }
            )
            x
        }) |>
        unlist()
