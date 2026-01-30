use ccdb ;
load data local infile "D:/Python All/Credit card power bi/cust_add.csv"
into table cust_detail
fields	terminated by ","
enclosed by ""
lines terminated by "\n"
ignore 1 lines;