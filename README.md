# 2.1.-BaseDades_N1_Ex2
This project defines the database structure for allowing customers from a pizza place to place food delivery orders online. The database includes tables for provinces, locations, shops, employees, clients, orders, delivery, categories, products, products_order and pizza. It is designed to handle key operations such as recording client information, tracking orders, and managing delivery.

## Database Structure
### 1. `provinces` Table: 
Tracks the provinces to which the towns belong.

- **Columns**:
  - id_province (Primary key): Unique auto-incremented identifier for each province.
  - name: Name of the province.


### 2. `locations` Table: 
Tracks the towns from the orders and shops.

- **Columns**:
  - id_town (Primary key): Unique auto-incremented identifier for each town or location.
  - name: Name of the town or location.
  - id_province (Foreign Key): Reference to the provinces table.


### 3. `shops` Table: 
Stores information about shop locations, including their address, town, and province.

- **Columns**:
  - id_shop (Primary key): Unique auto-incremented identifier for each town or location.
  - address: Full address of the shop.
  - postal_code: ZIP code of the shop.
  - town: Name of the town of the shop.
  - id_town (Foreign Key): Reference to the locations table.
  - province: Name of the province for the shop.
  - id_province (Foreign Key): Reference to the provinces table.


### 4. `employees` Table: 
Tracks inventory for the employees working in the business.

- **Columns**:
  - id_employee (Primary key): Unique auto-incremented identifier for each employee.
  - first_name: First name of the employee.
  - last_name: Last name of the employee.
  - id_number: Employee's ID.
  - phone: Employee's contact phone number.
  - type_employee: Enum field indicating whether the employee is a cook or deliveryman.
  - id_shop (Foreign Key): Reference to the shops table (shop where the employee works).


### 5. `clients` Table
Stores the information from the clients.

- **Columns**:
  - id_clients (Primary key): Unique auto-incremented identifier for each client
  - first_name: First name of the employee.
  - last_name: Last name of the employee.
  - address: Full address of the client.
  - postal_code: ZIP code of their address.
  - town: Name of the town for the shop.
  - id_town (Foreign Key): Reference to the locations table.
  - province: Name of the province for the shop.
  - id_province (Foreign Key): Reference to the provinces table.
  - phone: Client's contact phone number.


### 6. `orders` Table
Stores details of the orders.

- **Columns**:
  - id_order (Primary key): Unique auto-incremented identifier for each order.
  - date_time: The date and time when the order was placed.
  - order_type: Enum field indicating whether the order is for distribution or collection.
  - total_products: The total number of products in the order.
  - total_price: Total price of the order.
  - id_client (Foreign Key): Reference to the clients table (customer who placed the order).
  - id_shop (Foreign Key): Reference to the shops table (shop from which the order was made).
  - id_employee: Foreign key referencing the employees table (employee who processed the order).


### 7. `delivery` Table
Stores the orders' delivery.

- **Columns**:
  - id_delivery: Primary key, auto-incremented ID for each delivery.
  - id_order (Foreign Key): Reference to the orders table (the order being delivered).
  - id_deliveryman (Foreign Key): Reference to the employees table (deliveryman responsible for the delivery).
  - delivery_datetime: The date and time when the delivery occurred.
  - delivery_status: The status of the delivery (pending, delivered, failed).


### 8. `categories` Table
Tracks categories from the pizzas.

- **Columns**:
  - id_category (Primary key): Unique auto-incremented identifier for each category.
  - name: Enum field indicating whether the pizza is classic, special or the pizza of the day.


### 9. `products` Table
Stores information about the products of the pizza place.

- **Columns**:
  - id_product (Primary key): Unique auto-incremented identifier for each product.
  - name: Name of the product.
  - description: Description of the product.
  - image: URL or filename of the product image (nullable) - empty.
  - price: Price of the product.
  - id_category (Foreign Key): Reference to referencing the categories table.
  - type: The type of product (pizza, hamburger, or drink).


### 10. `product_orders` Table
Tracks products quantity from orders.

- **Columns**:
  - id_products_orders (Primary key): Unique auto-incremented identifier for each product order.
  - id_order (Foreign Key): Reference to the orders table. 
  - id_product (Foreign Key): Reference to the products table.
  - quantity: Number of units of the product ordered.
 

### 11. `pizzas` Table
Tracks pizza-related information.

- **Columns**:
  - id_pizza (Primary key): Unique auto-incremented identifier for each pizza.
  - id_category (Foreign Key): Reference to the categories table.
  - id_product (Foreign Key): Reference to the products table.



## Setup
1. Create the database schema by executing the provided SQL script.
2. Insert the data into the respective tables.
3. Ensure all foreign key relationships and constraints are maintained.
