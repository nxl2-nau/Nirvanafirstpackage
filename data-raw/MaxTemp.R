library(tidyverse)

MaxTemp <- read.csv('data-raw/FlagMaxTemp.csv') %>%
  gather('DOM', 'MaxTemp', X1:X31) %>%
  drop_na() %>%
  mutate(DOM  = str_remove(DOM, fixed('X')) ) %>%
  mutate(Date = lubridate::ymd( paste( Year, Month, DOM )) ) %>%
  select(Date, MaxTemp)

usethis::use_data(MaxTemp, overwrite = TRUE)
