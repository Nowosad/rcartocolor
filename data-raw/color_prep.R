# https://github.com/CartoDB/CartoColor/blob/5302a3d7245595251ea5dd90fc09efcb8d3254fb/cartocolor.js

library(jsonlite)
library(tidyverse)

cartocolors = fromJSON("data-raw/cartocolor.json") %>%
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
        bind_rows(cartocolors_qual) %>%
        arrange(Type, desc(Name))

# save data
usethis::use_data(cartocolors, overwrite = TRUE)
