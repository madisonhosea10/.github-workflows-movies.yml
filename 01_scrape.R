library(rvest)
library(stringr)
library(readr)
library(tibble)

url <- "https://www.imdb.com/chart/boxoffice/"
page <- read_html(url)

titles_nodes <- html_nodes(page, "h3.ipc-title__text")
titles <- html_text(titles_nodes)[1:10]

cards <- html_nodes(page, ".ipc-metadata-list-summary-item__tc")
text <- html_text(cards)

gross <- regmatches(text, regexpr("Weekend Gross: \\$[0-9\\.]+M?", text))
gross <- gsub("Weekend Gross: ", "", gross)
gross <- gross[1:10]

ratings_nodes <- html_nodes(page, "span.ipc-rating-star--rating")
ratings <- as.numeric(html_text(ratings_nodes)[1:10])

imdb <- tibble(
  title = titles,
  imdb_rating = ratings,
  weekend_revenue = gross,
  date = Sys.Date()
)

#

daily_url <- "https://www.boxofficemojo.com/date/?ref_=bo_nb_wey_secondarytab"
daily_page <- read_html(daily_url)

tbl_node <- html_node(daily_page, "table")
tbl <- html_table(tbl_node, fill = TRUE)

bom <- tibble(
  date = tbl$Date,
  top10_gross = as.numeric(gsub("[\\$,]", "", tbl$`Top 10 Gross`)),
  change_YD = tbl$`%± YD`,
  change_LW = tbl$`%± LW`,
  releases = as.numeric(tbl$Releases),
  title = tbl$`#1 Release`,
  daily_gross = as.numeric(gsub("[\\$,]", "", tbl$Gross)),
  scrape_date = Sys.Date()
)

write_csv(imdb, "imdb_raw.csv")
write_csv(bom, "bom_raw.csv")
