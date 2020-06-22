-- create all tables in sql database northwind

CREATE TABLE territories (
    territory_id INTEGER,
    territory_description VARCHAR(100),
    region_id INTEGER
);

COPY territories FROM '/Users/sabrinafruhauf/Desktop/05_SpicedCourse/project_northwind_database/northwind_data_clean-master/data/territories.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE categories (
    category_id INTEGER,
    category_name VARCHAR(100),
    description TEXT,
    picture TEXT
);

COPY categories FROM '/Users/sabrinafruhauf/Desktop/05_SpicedCourse/project_northwind_database/northwind_data_clean-master/data/categories.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE customers (
    customer_id VARCHAR(10),
    company_name VARCHAR(100),
    contact_name VARCHAR(100),
    contact_title VARCHAR(50),
    address TEXT,
    city VARCHAR(50),
    region VARCHAR(50),
    postal_code VARCHAR(50),
    country VARCHAR(50),
    phone VARCHAR(50),
    fax VARCHAR(50)
);

COPY customers FROM '/Users/sabrinafruhauf/Desktop/05_SpicedCourse/project_northwind_database/northwind_data_clean-master/data/customers.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE employee_territories (
    employee_id INTEGER,
    territory_id INTEGER
);

COPY employee_territories FROM '/Users/sabrinafruhauf/Desktop/05_SpicedCourse/project_northwind_database/northwind_data_clean-master/data/employee_territories.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE employees (
    employee_id INTEGER,
    last_name VARCHAR(50),
    first_name VARCHAR(50),
    title VARCHAR(50),
    title_of_courtesy VARCHAR(10),
    birth_date TEXT,
    hire_date TEXT,
    address TEXT,
    city VARCHAR(50),
    region VARCHAR(50),
    postal_code VARCHAR(50),
    country VARCHAR(50),
    home_phone VARCHAR(50),
    extension INTEGER,
    photo TEXT,
    notes TEXT,
    reports_to TEXT,
    photo_path TEXT
);

COPY employees FROM '/Users/sabrinafruhauf/Desktop/05_SpicedCourse/project_northwind_database/northwind_data_clean-master/data/employees.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE order_details (
    order_id INTEGER,
    product_id INTEGER,
    unit_price FLOAT,
    quantity FLOAT,
    discount FLOAT
);

COPY order_details FROM '/Users/sabrinafruhauf/Desktop/05_SpicedCourse/project_northwind_database/northwind_data_clean-master/data/order_details.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE orders (
    order_id INTEGER,
    customer_id VARCHAR(10),
    employee_id INTEGER,
    order_date TEXT,
    required_date TEXT,
    shipped_date TEXT,
    ship_via INTEGER,
    freight FLOAT,
    ship_name VARCHAR(50),
    ship_address VARCHAR(50),
    ship_city VARCHAR(50),
    ship_region VARCHAR(50),
    ship_postal_code VARCHAR(50),
    ship_country VARCHAR(50)
);

COPY orders FROM '/Users/sabrinafruhauf/Desktop/05_SpicedCourse/project_northwind_database/northwind_data_clean-master/data/orders.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE products (
    product_id INTEGER,
    product_name VARCHAR(100),
    supplier_id INTEGER,
    category_id INTEGER,
    quantity_per_unit VARCHAR(100),
    unit_price FLOAT,
    units_in_stock INTEGER,
    units_on_order INTEGER,
    reorder_level INTEGER,
    discontinued INTEGER
);

COPY products FROM '/Users/sabrinafruhauf/Desktop/05_SpicedCourse/project_northwind_database/northwind_data_clean-master/data/products.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE shippers (
    shipper_id INTEGER,
    company_name VARCHAR(100),
    phone VARCHAR(100)
);

COPY shippers FROM '/Users/sabrinafruhauf/Desktop/05_SpicedCourse/project_northwind_database/northwind_data_clean-master/data/shippers.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE suppliers (
    supplier_id INTEGER,
    company_name VARCHAR(100),
    contact_name VARCHAR(100),
    contact_title VARCHAR(100),
    address TEXT,
    city VARCHAR(50),
    region VARCHAR(50),
    postal_code VARCHAR(50),
    country VARCHAR(50),
    phone VARCHAR(50),
    fax VARCHAR(50),
    homePage TEXT
);

COPY suppliers FROM '/Users/sabrinafruhauf/Desktop/05_SpicedCourse/project_northwind_database/northwind_data_clean-master/data/suppliers.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE regions (
    region_id INTEGER,
    region_description VARCHAR(50)
);

COPY regions FROM '/Users/sabrinafruhauf/Desktop/05_SpicedCourse/project_northwind_database/northwind_data_clean-master/data/regions.csv' DELIMITER ',' CSV HEADER;
