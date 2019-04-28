library(rcartocolor)
library(tidyverse)

metacartocolors = cartocolors %>%
        # select(-Type) %>%
        gather(key, value, n2:n12) %>%
        mutate(key = as.numeric(gsub("n", "", key))) %>%
        filter(!map_lgl(value, is.null)) %>%
        group_by(Name, Type) %>%
        summarise(Min_n = min(key), Max_n = max(key)) %>%
        arrange(Type) %>%
        as.data.frame()

# colorblind friendly -----------------------------------------------------
quantitative_list = metacartocolors$Name[metacartocolors$Type == "quantitative"]
colorblind_list = c("Earth", "ArmyRose", "Safe", "ag_Sunset", "ag_GrnYl", quantitative_list)
colorblind_friendly = metacartocolors$Name %in% colorblind_list

metacartocolors$Colorblind_friendly = colorblind_friendly

usethis::use_data(metacartocolors, overwrite = TRUE)

