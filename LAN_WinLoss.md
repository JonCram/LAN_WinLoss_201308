#### LAN_WinLoss

###### Analyzing Dodger's Win/Loss Record
1. by year
- 


#### notes

into outfile 'results.csv'
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'


SELECT a,b,a+b INTO OUTFILE '/tmp/result.txt'
  FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
  LINES TERMINATED BY '\n'
  FROM test_table;
