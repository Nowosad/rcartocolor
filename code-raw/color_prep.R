# https://github.com/CartoDB/CartoColor/blob/master/cartocolor.js

library(jsonlite)
library(tidyverse)

cc = fromJSON("code-raw/cartocolor.js") %>%
        map(t) %>%
        map(as_data_frame) %>%
        map_df(bind_rows, .id = "Name") %>%
        select(Name, tags, everything()) %>%
        set_names(c("Name", "Tags", paste0("n", 2:11)))

cc %>% View


