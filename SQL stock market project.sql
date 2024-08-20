CREATE DATABASE stock_market;
USE stock_market;

SELECT * FROM synthetic_stock_data;
SELECT COUNT(*) FROM synthetic_stock_data;

#KPI 1 - Average Daily Trading Volume
SELECT year(date), avg(volume) 
from synthetic_stock_data
group by year(date);


#KPI 2 - Most Volatile Stocks
SELECT ticker, avg(beta) as most_volatile
from synthetic_stock_data
group by ticker
order by avg(beta) desc;


#KPI 3 - Stocks with Highest Dividend and Lowest Dividend
SELECT ticker, avg(dividend_amount) 
from synthetic_stock_data
group by ticker
order by avg(dividend_amount) desc;


#KPI 4 - Highest and Lowest P/E Ratios
SELECT ticker, max(PE_ratio) , min(Pe_ratio)
from synthetic_stock_data
group by ticker;


#KPI 5 - Stocks with Highest Market Cap
SELECT ticker, avg(Market_Cap)
from synthetic_stock_data
group by ticker
order by avg(Market_Cap) desc;


#KPI 6 - Stocks Near 52 Week High
SELECT ticker, round(Avg((52_week_high)-(Close)),2) as highvalue_in_52week
from synthetic_stock_data
group by ticker;


#KPI 7 - Stocks Near 52 Week Low
SELECT ticker, round(Avg((Close)-(52_week_low)),2) as lowvalue_in_52week
from synthetic_stock_data
group by ticker;


#KPI 8 - Stocks with Strong Buy Signals and stocks with Strong Selling Signal
SELECT ticker, round(avg(RSI),4) as Avg_of_RSI, round(avg(MACD),4) as Avg_of_MACD
from synthetic_stock_data
group by ticker;		














#KPI 8 - Stocks with Strong Buy Signals and stocks with Strong Selling Signal
SELECT ticker, max(RSI) as High_RSI, min(RSI) as Low_RSI, max(MACD) as High_MACD, min(MACD) as Low_MACD
from synthetic_stock_data
group by ticker;	