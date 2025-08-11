use campervan;



CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    day INT,
    month INT,
    month_name VARCHAR(15),
    quarter VARCHAR(5),
    fiscal_quarter VARCHAR(5),
    year INT,
    fiscal_year INT
);

CREATE TABLE dim_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50),
    sub_category_name VARCHAR(50)
);


CREATE TABLE dim_employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    role VARCHAR(50),
    hire_date DATE
);

CREATE TABLE fact_expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    category_id INT,
    date_id DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES dim_employee(employee_id),
    FOREIGN KEY (category_id) REFERENCES dim_category(category_id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);
