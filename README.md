# Project 4 - SQL & Visualization Trough Tableau

We are a newly funded wine company from Europe, we want to produce red and white wine. We are starting in the following months, and we are deciding the fundamental aspects of our company. 
Through this project we want to decide which is the best location for the company for each variety of wine, we will have two locations, one location for the red wine and another one for the white one. We'll decide the location based on the wine production of each country and the wine rating. 
We also want to settle the price for our two wines based on the market value.
After deciding the location and price, we also want to develop an export strategy. We want to find the most suitable countries to start exporting our product.

## Requirements/Libraries Used: 

- Jupyter Notebook
- Python
- SQL
- Tableau


## Introduction

We have developed two wine varieties, red and white. The experts have tried our product and decided the following rating:

- Red wine variety has a rating of 3.8 out of 5
- White wine variety has a current review of 3.7 out of 5


## First Part - SQL

Our Database is based on the wine largest platform of the world, Vivino, this platform gathers the wine consumption worldwide. The Data frame has the following information:
- Wine's Name: Name of the wine that was consumed
- Country: Wines country
- Region: Wines region
- Winery: Company that produced the wine
- Rating: Rating given by the person who bought the wine (From 0 to 5)
- Number of Ratings: Quantity of people that has rated the wine
- Price: Wine's retail price
- Year: Wines production year
- Variety: Red or White wine

Through SQL and our database we developed a market analysis querying the information to understand the consumers and the wine sector. Ones we had a complete vision of the wine market, we proceed to search for the companies requirements.

## Second Part - Location, Price and Exports

In this part, we focused on the companies requirements. We had to decide a location for each variety, a price for both wines and exportation countries for each variety.

### Location

For this part, I wanted to find the ideal location for our winery. To select the location I took into the account the number of wines produced by country, selecting an interval rating, different for each wine. We looked into these criteria as the company wants to be surrounded by similar wineries to increase the know-how and see the best practices of this companies.

- White Wine:

We selected a range between a rating of 3.5 and 4 to find the country that produces the higher quantity of white wine. In the top 5 we find Germany, Italy, France, Spain and Austria. We select Germany as our candidate for setting our winery. We wanted to look also at Germany's wine evolution from 2010 to 2018 to finally make the decision. Furthermore, we can see that there is a remarkable evolution of wine consumption through this year's. So we can say that Germany is an excellent country to settle our white winery. After selecting the country, we want to choose the most favorable region. With the same analysis, I will look into Germany's different regions to see which one is the most suitable taking the criteria of higher wine production for white wines between a rating of 3.5 and 4 I decided that the region of Pfalz (Renania-Palatinado) is the best for our winery.

- Red Wine:

We underwent the same process with the red wine variety as the white wine to find the perfect location. With an interval between 3.5 and 4, we find that Italy is the best country to locate our winery. For the region, we decided that the one that suits best our company is the Tuscany.


### Price

The second crucial aspect for the company is deciding which price will each wine have. We will undergo a market analysis to choose the most accurate price.

- White wine:

Our White wine was given a rating of 3,7 out of 5.
Knowing this, we'll look at the results of the lowest price, the highest price and the average in a range of ratings between 3,65 and 3,75 to decide the price that fit the best. After analyzing it we find some insights; the lowest price of this category is 7,79€ with a rating of 3,7. The highest price is 18,49 € with also 3,7 rating. On the lowest end of the range (3,65 rating) we find that the lowest price for a wine is 8,7 € and the highest price is 18,29€. On the highest end of the range (3,75 rating) we find that the lowest price is 8,97€ and the highest price is 13,04€. We can see that there is no much correlation between the price and the rating as a lot of the times the rating is subjective. This information has given us a range where we can settle our price. Finally, we look to the average of this range and gives us an initial price of 12,08€.


- Red wine:

Our Red wine was given a rating of 3,8 out of 5.
Knowing this, we'll look at the results of the lowest price, the highest price and the average in a range of ratings between 3,75 and 3,85 to decide the price that fit the best. After the analysis we find some insights: The lowest price for red variety in Italy is 3,79€ with a rating of 3,8, the highest price is 42,3 € with a rating of 3,79. On the lowest end of the range (3,75 rating) we find that the lowest price for a wine is 7,65 € and the highest price is 28,81 €. On the highest end of the range (3,75 rating) we find that the lowest price is 6,58 € and the highest price is 32,85 €.

### Exportation

On this part we will select the countries where we will start our exports, for both varieties, red and white.

- White:

For our White wine we find that the countries that will be more suitable for our product, taking into account the rating (3,65 - 3,75) and the price established are Italy with a consumption of 792 different types of wines similar to ours, South Africa with 296, Spain with 256, United States with 135, Chile with 99, Australia with 67 and Argentina with 56. 

- Red: 

For our Red wine we find that the countries that will be more suitable for our product, taking into account the rating (3,75 - 3,85) and the price established are France with a consumption of 2.256 different types of wines similar to ours, Spain with 1.142, South Africa with 500, Chile with 326, Germany with 248, Australia with 246 and Argentina with 246.

## Conclusion

After the analysis, we find that:

Our white winery will be settled in Pfalz (Renania-Palatinado), Germany. The initial price for the wine will be 12,08€ and the countries of exportation will be Italy, South Africa, Spain, United States, Chile, Australia and Argentina

Our Red winery will be settled in the Gran Saint Emilion region, Italy. It will have an initial price of 15,60€ and the countries of exportation will be France, Spain, South Africa, Chile, Germany, Australia and Argentina.

