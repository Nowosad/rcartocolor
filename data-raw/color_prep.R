# https://github.com/CartoDB/CartoColor/blob/master/cartocolor.js

library(jsonlite)
library(tidyverse)

cartocolors = fromJSON("data-raw/cartocolor.js") %>%
        map(t) %>%
        map(as.data.frame) %>%
        map_df(bind_rows, .id = "Name") %>%
        select(Name, tags, everything()) %>%
        set_names(c("Name", "Type", paste0("n", 2:11))) %>%
        mutate(Type = unlist(replace(Type, Name == "Safe", "qualitative"))) %>%
        mutate(n4 = replace(n4, Name == "TealRose", list(c("#009392", "#b1c7b3", "#e5b9ad", "#d0587e")))) ## TealRose fix

# qualitative color numbers fix
cartocolors_no_qual = cartocolors %>%
        filter(Type != "qualitative")

cartocolors_qual = cartocolors %>%
        filter(Type == "qualitative") %>%
        set_names(c("Name", "Type", paste0("n", 3:12)))

cartocolors = cartocolors_no_qual %>%
        bind_rows(cartocolors_qual)


# save data
devtools::use_data(cartocolors, overwrite = TRUE)
