# Analysis of NBA Player Height and Weight

## Summary:

Project to analyze the impact of NBA players height and weight on their performance. This analysis utilized individual player data from the last 10 full NBA seasons (13/14 to 22/23 seasons). Data was sourced from stathead.com and a public kaggle dataset.

The analysis was broken into 3 pieces to measure players' performance:

-   Overall impact on winning

-   Offensive impact

-   Defensive impact

The data was cleaned in excel and BigQuery and imported into Tableau to perform the analysis and create visualizations.

## Data Sources:
-   **[Stathead](stathead.com)**
    -   Downloaded csv files with the following advanced statistics:
        -   Overall impact:
            -   [Box Plus-Minus](https://www.basketball-reference.com/about/bpm2.html)
            -   [Win Shares per 48](https://www.basketball-reference.com/about/ws.html)
        -   Offense:
            -   [Offensive Rating](https://www.basketball-reference.com/about/ratings.html)
            -   Points/game
        -   Defense:
            -   [Defensive Rating](https://www.basketball-reference.com/about/ratings.html)

    -   Data covers the last 10 full seasons (2013/14 to 2022/23 seasons)
    -   Data includes regular season stats only, not playoffs
    -   Each stat/metric is the average per player per season during the 10 season timeframe
    -   Only includes players that played a minimum of 41 games a season (1/2 the season) and average at least 10 minutes/game

-   **[Kaggle](https://www.kaggle.com/datasets/justinas/nba-players-data/data)**: 

    -   Player stats from NBA API. Needed this to get players recorded height and weight by season.

## Data Cleaning:

-   **Stathead.com:**

    -   Filtered player stats as follows before exporting:

        -   2013/14 to 2022/23 seasons

        -   Regular season only (not Playoffs)

        -   Player must have minimum of 41 games played per season

        -   Player must have minimum of 10 minutes/game average

-   **Excel:**

    -   Combined stathead csv exports (*could only export 200 rows at a time for each query*)

    -   Players with multiple positions:

        -   Some players were listed as playing multiple positions (ex: C-F)

        -   Edited position column to only include the first position listed for each player (which is the player's primary position)

    -   Edited column names in Excel before importing to BigQuery to ensure column names were understandable and only contained allowed characters

    -   Fixed some differences in player names between stathead and kaggle (ex: JJ Redick vs J.J. Redick, Kevin Knox vs Kevin Knox II)

-   **BigQuery:**

    -   Joined stathead data with kaggle data

    -   Removed accents from player names in the stathead data because the kaggle data did not have them (Ex: Luka Dončić vs Luka Doncic)

## Analysis and Visualization:

-   **Tableau:**

    -   Exported the results from the BigQuery sql query to csv and imported the data to Tableau Public

    -   Created heatmap style visuals for each of the main categories and their chosen metrics

    -   Combined visuals into a single [dashboard](https://public.tableau.com/app/profile/russell.hopkins/viz/NBAHeightandWeightvsPerformance/Overall)


## Conclusions:

-   Each of the three categories (overall impact, offense, and defense) showed a similar trend that players with greater height and weight had more impact based on the chosen metrics.

-   Generally, the performance stats tended to be higher than average when players were approximately:

    -   6'8"/6'9" and taller

    -   220/230 lbs and heavier

