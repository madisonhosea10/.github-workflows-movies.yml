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

Main Files in This Project
File Name	Purpose
01_scrape.R	Collects data from IMDb + Box Office Mojo
02_clean.R	Cleans and appends new information
03_visualize.R	Creates a graph each run
movies.yml	The file that schedules automation
movies_master.csv	The cumulative dataset
movie_dashboard.png	Automatic visualization
What I Learned

How to scrape using R
How to clean and store real data
How to build a recurring automatic workflow
Learned more about navigating github

How to visualize changes over time

The hardest part was that Rotten Tomatoes could not be scraped. I switched to Box Office Mojo and my pipeline now runs correctly every day.
