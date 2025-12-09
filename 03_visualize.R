library(readr)
library(ggplot2)

movies <- read_csv("movies_master.csv")

png("movie_dashboard.png", width=1200, height=800)

ggplot(movies, aes(x = imdb_rating, y = weekend_revenue_num,
                   size = daily_gross, color = top10_gross)) +
  geom_point(alpha = 0.7) +
  labs(title = "Do Highly-Rated Movies Earn More?",
       x = "IMDb Rating",
       y = "Weekend Revenue ($)",
       size = "Daily Gross (Box Office Mojo)",
       color = "Top 10 Total Gross") +
  theme_minimal()

dev.off()
