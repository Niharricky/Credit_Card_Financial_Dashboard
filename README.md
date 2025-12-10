# Credt_Card_Financial_Dashboard
This README explains how to import data into SQL, connect it to Power BI, and build a complete dashboard/report.

✅ 1. Prepare CSV Files

Collect all your dataset files in CSV format
Example:
credit_card.csv ,
customer.csv

cc_add.csv and cust_add.csv are add on files means one week files

Make sure:
Column names are clean
No extra spaces
Dates are in proper format (yyyy-mm-dd)
Numeric fields do NOT contain text


✅ 2. Create Tables in SQL
Open MySQL Workbench / SQL Server / PostgreSQL
Create a new database:
CREATE DATABASE database_name;
USE database_name;


Create tables for each CSV file.
Example:
CREATE TABLE cust_detail (
    customer_id INT,
    customer_age INT,
    income FLOAT,
    gender VARCHAR(20),
    state VARCHAR(20)
);

CREATE TABLE cc_detail (
    customer_id INT,
    week_start_date DATE,
    annual_fees FLOAT,
    total_trans_amt FLOAT,
    interest_earned FLOAT
);


Create similar tables for all CSVs.



✅ 3. Import CSV Files Into SQL

After creating tables:
Option 1 – SQL Workbench Import Wizard
Right-click table → Table Data Import Wizard
Choose CSV → Import → Finish

Option 2 – SQL Query Method
LOAD DATA INFILE 'path/to/cust_detail.csv'
INTO TABLE cust_detail
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;


Repeat for all datasets.


✅ 4. Connect SQL Database to Power BI
Open Power BI Desktop
Click Get Data → SQL Server or mysql database

Enter:
Server Name
Database Name: the database name you created

Choose Import Mode
Select tables:


Click Load
Your SQL data will now appear in Power BI.


✅ 5. Perform Data Operations in Power BI

You can now:
✔ Create relationships

cust_detail.customer_id → cc_detail.customer_id

✔ Create DAX Calculations

Examples:
Revenue
Revenue =
'cc_detail'[annual_fees] +
'cc_detail'[total_trans_amt] +
'cc_detail'[interest_earned]


Age Group
AgeGroup = SWITCH(
    TRUE(),
    'cust_detail'[customer_age] < 30, "20-30",
    'cust_detail'[customer_age] < 40, "30-40",
    'cust_detail'[customer_age] < 50, "40-50",
    'cust_detail'[customer_age] < 60, "50-60",
    "60+"
)

✔ Clean data using Power Query

Remove nulls
Change data types
Fix dates
Create custom columns


✅ 6. Build Dashboard & Generate Report

After data cleaning + DAX:
Create visuals such as:
KPI Cards (Revenue, Interest, Transactions)
Bar charts (State-wise revenue)
Donut charts (Card category)
Line chart (Weekly trend)

Gender-based revenue comparison

Activation & Delinquency rate visuals

Add slicers:

Age Group
Income Group
Gender
State
Week Number

Arrange visuals to form the final dashboard.
