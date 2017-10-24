library(rcartocolor)
library(tidyverse)

metacartocolors = cartocolors %>%
        # select(-Type) %>%
        gather(key, value, n2:n11) %>%
        mutate(key = as.numeric(gsub("n", "", key))) %>%
        filter(!map_lgl(value, is.null)) %>%
        group_by(Name, Type) %>%
        summarise(Min_n = min(key), Max_n = max(key)) %>%
        arrange(Type)

devtools::use_data(metacartocolors, overwrite = TRUE)

