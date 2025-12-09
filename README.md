Automated Movie Data Tracker - DATA 330 Final Project
By Madison Hosea

This project collects movie data from the internet and updates it every 24 hours. The goal is to track how movies perform each day and compare ratings with earnings. 
The files update by themselves through GitHub Actions.

Data Sources:
IMDb Box Office	Top 10 movies, IMDb ratings, weekend revenue
Box Office Mojo Daily Chart	Daily earnings and number-one movie

These sites change often, so collecting data daily shows how performance moves over time.

How the Automation Works
- Every 24 hours, the workflow runs automatically and:
- Scrapes new movie data from both websites
- Cleans and organizes the information
- Adds new rows to the main dataset
- Builds a new visual chart
- Saves all changes in the repository

It updates by itself!

What I Learned:

How to scrape using R
How to clean and store data
How to build a recurring automatic workflow
Learned more about navigating github

The hardest part was that Rotten Tomatoes could not be scraped. I switched to Box Office Mojo and my pipeline now runs correctly every day.
Navigating the errors, and having to have patience for it was difficult as well
