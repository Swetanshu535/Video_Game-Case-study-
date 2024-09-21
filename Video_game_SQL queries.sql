create database video_games;
use video_games;


-- Use dense rank to rank the global sales of the games 
select name,dense_rank() over (partition by Global_sales order by Name) as rnk_global_sales
from video_game;
-- Use rank to rank the NA sales of the games 
select name, rank() over ( partition by NA_sales) as rnk_NA_sales
from video_game;
-- give a row number to the games sold 
select name,row_number() over (Partition by Global_Sales order by Name) as row_no
from video_game;
-- Show the average of global sales 
select avg(Global_sales), name
from video_game
group by Name;
-- Give the sum of sales 
select name, round(sum(Global_Sales)) as total_round_sales
from video_game
group by Name;
-- concat the game name and genre
select name,genre,concat(Name, " ",Genre) as Name_g
from video_game;