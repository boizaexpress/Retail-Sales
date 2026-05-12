SELECT * 
FROM `retail_analysis`.`default`.`retail_sales_dataset` 
LIMIT 100;

SELECT `Product Category`,
       `Price per Unit`
FROM `retail_analysis`.`default`.`retail_sales_dataset`;

SELECT MAX(`Age`) AS max_age,
       MIN(`Age`) AS min_age
FROM `retail_analysis`.`default`.`retail_sales_dataset`;

SELECT Gender,
       `Customer ID`,
       Age,
CASE 
      WHEN `Age` BETWEEN 18 AND 35 THEN 'Youth'
      WHEN `Age` BETWEEN 36 AND 50 THEN 'Adult'
      ELSE 'Pensioner'
      END AS `Age Category`
FROM `retail_analysis`.`default`.`retail_sales_dataset`;


SELECT SUM(`Quantity` * `Price per Unit`) AS revenue,
       `Product Category`
FROM `retail_analysis`.`default`.`retail_sales_dataset`
GROUP BY `Product Category`;

SELECT MIN(`Date`) AS min_date,
       MAX(`Date`) AS max_date
FROM `retail_analysis`.`default`.`retail_sales_dataset`;

SELECT MONTHNAME(`Date`) AS month_name,
       DAYNAME(`Date`) AS day_name,
       SUM(`Quantity`) AS sum_qty,
       SUM(`Quantity` * `Price per Unit`) AS revenue,
       `Product Category`
FROM `retail_analysis`.`default`.`retail_sales_dataset`
GROUP BY MONTHNAME(`Date`), DAYNAME(`Date`), `Product Category`;

SELECT COUNT(DISTINCT `Product Category`) AS Product_Category,
       COUNT(DISTINCT `Customer ID`) AS Customer_ID,
       COUNT(DISTINCT `Transaction ID`) AS Transaction_ID
FROM `retail_analysis`.`default`.`retail_sales_dataset`;

SELECT `Product Category`,
       Age,
       Gender,
       CASE 
         WHEN `Age` BETWEEN 18 AND 35 THEN 'Youth'
         WHEN `Age` BETWEEN 36 AND 50 THEN 'Adult'
         ELSE 'Pensioner'
       END AS `Age Category`,
       MONTHNAME(`Date`) AS month_name,
       DAYNAME(`Date`) AS day_name,
       Quantity,
       `Price per Unit`,
       SUM(`Quantity` * `Price per Unit`) AS revenue
FROM `retail_analysis`.`default`.`retail_sales_dataset`
GROUP BY `Product Category`, Quantity, Age, Gender,
         MONTHNAME(`Date`), DAYNAME(`Date`), `Price per Unit`,
         CASE 
           WHEN `Age` BETWEEN 18 AND 35 THEN 'Youth'
           WHEN `Age` BETWEEN 36 AND 50 THEN 'Adult'
           ELSE 'Pensioner'
         END
