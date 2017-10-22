# https://github.com/CartoDB/CartoColor/blob/master/cartocolor.js

library(jsonlite)
library(tidyverse)

cc = fromJSON("code-raw/cartocolor.js") %>%
        map(t) %>%
        map(as.data.frame) %>%
        map_df(bind_rows, .id = "Name") %>%
        select(Name, tags, everything()) %>%
        set_names(c("Name", "Type", paste0("n", 2:11))) %>%
        mutate(Type = replace(Type, Name == "Safe", "qualitative"))

cc %>% View

my_color = cc[cc$Name == "Burg", "n4"][[1]]
