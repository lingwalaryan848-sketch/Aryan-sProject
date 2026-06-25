# SQLProject
## Project Overview

This project focuses on analyzing retail sales data using SQL to uncover meaningful business insights. The dataset contains information about customer purchases, product categories, sales amounts, and transaction details.

The analysis includes data cleaning, handling missing values, sales trend evaluation, customer behavior analysis, and category-wise performance tracking. Various SQL concepts such as filtering, aggregation, grouping, ranking functions, and subqueries were used to answer business-related questions and generate actionable insights.

This project demonstrates practical SQL skills commonly required in Data Analyst roles and showcases the ability to transform raw sales data into meaningful business intelligence.
## Objectives

- Perform data cleaning and validation on retail sales data.
- Analyze sales performance across different product categories.
- Identify top-performing customers and products.
- Evaluate monthly and yearly sales trends.
- Generate business insights using SQL queries.
- Practice real-world data analysis techniques using MySQL.
  ## SQL Query Structure

### 1. Database Setup
- Create Database
- Select Database
- Create Table

```sql
CREATE DATABASE RetailSalesDB;
USE RetailSalesDB;

CREATE TABLE retail_sales (...);
```

### 2. Data Validation
- Check available tables
- Verify imported records
- Preview dataset

```sql
SHOW TABLES;
SELECT * FROM retail_sales LIMIT 100;
```

### 3. Data Cleaning
- Identify missing values
- Validate data quality

```sql
SELECT *
FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL;
```

### 4. Exploratory Data Analysis (EDA)
- Total records count
- Sales overview
- Customer overview

```sql
SELECT COUNT(*) FROM retail_sales;
```

### 5. Sales Analysis
- Monthly sales trends
- Year-wise sales performance
- Revenue analysis

```sql
SELECT YEAR(sale_date),
       MONTH(sale_date),
       AVG(total_sale)
FROM retail_sales
GROUP BY 1,2;
```

### 6. Customer Analysis
- Customer spending behavior
- Age group analysis
- Gender-wise analysis

```sql
SELECT customer_id,
       SUM(total_sale)
FROM retail_sales
GROUP BY customer_id;
```

### 7. Product Category Analysis
- Category-wise sales
- Top performing categories

```sql
SELECT category,
       SUM(total_sale)
FROM retail_sales
GROUP BY category;
```

### 8. Advanced SQL Concepts
- Window Functions
- Ranking Functions
- Business Insights

```sql
RANK() OVER (
PARTITION BY YEAR(sale_date)
ORDER BY AVG(total_sale) DESC
)
```
## DATA ANALYSIS AND FINDING


### Q1. Retrieve all columns for sales made on '2022-11-05'

```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

### Q2. Retrieve all Clothing transactions with quantity greater than 4 in November 2022

```sql
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
AND quantity >= 4
AND YEAR(sale_date) = 2022
AND MONTH(sale_date) = 11;
```

### Q3. Calculate total sales for each category

```sql
SELECT category,
       SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category;
```

### Q4. Find the average age of customers who purchased Beauty products

```sql
SELECT AVG(age) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';
```

### Q5. Find all transactions where total_sale is greater than 1000

```sql
SELECT *
FROM retail_sales
WHERE total_sale > 1000;
```

### Q6. Find total transactions made by each gender in each category

```sql
SELECT category,
       gender,
       COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY category, gender;
```

### Q7. Find the best-selling month in each year

```sql
SELECT YEAR(sale_date) AS year,
       MONTH(sale_date) AS month,
       SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY total_sales DESC;
```

### Q8. Find the top 5 customers based on total sales

```sql
SELECT customer_id,
       SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```

### Q9. Find the number of unique customers in each category

```sql
SELECT category,
       COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;
```

### Q10. Create shifts and count orders

```sql
SELECT
CASE
    WHEN HOUR(sale_time) < 12 THEN 'Morning'
    WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
END AS Shift,
COUNT(*) AS Total_Orders
FROM retail_sales
GROUP BY Shift;
```
