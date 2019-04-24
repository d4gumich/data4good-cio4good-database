-- Starting with a single table to make sure I can pull some data back then going to decouple

-- SET FOREIGN_KEY_CHECKS=0;
-- Replace the tables below with the ones created.
DROP TABLE IF EXISTS cio4good;
SET FOREIGN_KEY_CHECKS=1;


CREATE TABLE IF NOT EXISTS cio4good
  (
    data_id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    size VARCHAR(20) NOT NULL,
    number_of_desktop_per_FTE DECIMAL(10,3),
    capital_IT_budget_as_percent_of_IT_spend DECIMAL(10,4),
    capital_IT_budget_as_percent_of_revenue DECIMAL(10,4),
    organization_count INTEGER,
    IT_cost_to_IT_staff_ratio DECIMAL(10,4),
    IT_staff_percent_of_total_staff DECIMAL(10,4),
    last_fiscal_year_IT_capital_budget DECIMAL(10,3),
    last_fiscal_year_revenue DECIMAL(20,3),
    last_year_total_IT_operating_budget DECIMAL(20,3),
    staff_to_IT_help_desk_staff DECIMAL(10,3),
    staff_to_IT_staff_ratio DECIMAL(5,4),
    total_IT_spend_per_employee DECIMAL(15,3),
    total_IT_spend_as_percent_of_revenue DECIMAL(15,3),
    total_IT_staff_FTE DECIMAL(10,3),
    year VARCHAR(4),
    organization_staff_number DECIMAL(10,3),
    PRIMARY KEY (data_id)
  )
ENGINE=InnoDB
CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;

LOAD DATA LOCAL INFILE './data/Cleaned_ACCUMULATIVE_CIO_Data_For_Database.csv'
INTO TABLE cio4good
  CHARACTER SET utf8mb4
  FIELDS TERMINATED BY ','
  ENCLOSED BY '"'
  LINES TERMINATED BY '\n'
  IGNORE 1 LINES
  (size
   ,number_of_desktop_per_FTE
   ,capital_IT_budget_as_percent_of_revenue
   ,capital_IT_budget_as_percent_of_IT_spend
   ,organization_count
   ,IT_cost_to_IT_staff_ratio
   ,IT_staff_percent_of_total_staff
   ,last_fiscal_year_IT_capital_budget
   ,last_fiscal_year_revenue
   ,last_year_total_IT_operating_budget
   ,staff_to_IT_help_desk_staff
   ,staff_to_IT_staff_ratio
   ,total_IT_spend_per_employee
   ,total_IT_spend_as_percent_of_revenue
   ,total_IT_staff_FTE
   ,year 
   ,organization_staff_number);


