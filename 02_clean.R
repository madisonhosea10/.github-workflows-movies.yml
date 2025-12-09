library(readr)
library(stringr)
library(dplyr)

imdb <- read_csv("imdb_raw.csv")
bom <- read_csv("bom_raw.csv")

imdb$weekend_revenue_num <- as.numeric(gsub("M", "", gsub("\\$", "", imdb$weekend_revenue))) * 1e6


full <- left_join(imdb, bom, by = "title")

if (file.exists("movies_master.csv")) {
  old <- read_csv("movies_master.csv")
  new <- bind_rows(old, full)
  write_csv(new, "movies_master.csv")
} else {
  write_csv(full, "movies_master.csv")
}
