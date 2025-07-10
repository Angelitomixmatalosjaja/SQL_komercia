PRAGMA foreign_keys = ON;

CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  name TEXT,
  email TEXT,
  country TEXT,
  signup_date TEXT
);

INSERT INTO customers VALUES
(1, 'Ana Torres', 'ana@email.com', 'México', '2022-03-10'),
(2, 'Luis Pérez', 'luis@email.com', 'México', '2022-04-22'),
(3, 'Laura Jiménez', 'laura@email.com', 'Colombia', '2022-05-05'),
(4, 'Carlos Díaz', 'carlos@email.com', 'Argentina', '2022-06-12'),
(5, 'María Gómez', 'maria@email.com', 'Perú', '2022-07-01');

CREATE TABLE products (
  product_id INTEGER PRIMARY KEY,
  product_name TEXT,
  category TEXT,
  cost_price REAL
);

INSERT INTO products VALUES
(1, 'Camiseta Blanca', 'Ropa', 5.00),
(2, 'Pantalón Jeans', 'Ropa', 12.00),
(3, 'Mouse Inalámbrico', 'Electrónica', 8.50),
(4, 'Teclado Mecánico', 'Electrónica', 20.00),
(5, 'Botella de Agua Reutilizable', 'Hogar', 3.00);

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER,
  order_date TEXT,
  payment_method TEXT,
  sales_channel TEXT,
  total_amount REAL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(101, 1, '2022-08-01', 'Tarjeta', 'web', 30.00),
(102, 2, '2022-08-03', 'PayPal', 'mobile', 25.00),
(103, 3, '2022-08-05', 'Tarjeta', 'store', 45.00),
(104, 1, '2022-09-01', 'Tarjeta', 'web', 20.00),
(105, 5, '2022-09-03', 'Efectivo', 'store', 10.00);

CREATE TABLE order_items (
  order_item_id INTEGER PRIMARY KEY,
  order_id INTEGER,
  product_id INTEGER,
  quantity INTEGER,
  unit_price REAL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(201, 101, 1, 2, 10.00),
(202, 101, 5, 1, 10.00),
(203, 102, 2, 1, 15.00),
(204, 103, 3, 1, 15.00),
(205, 103, 4, 1, 30.00),
(206, 104, 1, 1, 10.00),
(207, 104, 5, 1, 10.00),
(208, 105, 5, 2, 5.00);

CREATE TABLE reviews (
  review_id INTEGER PRIMARY KEY,
  order_id INTEGER,
  rating INTEGER,
  review_text TEXT,
  review_date TEXT,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO reviews VALUES
(301, 101, 4, 'Buen producto.', '2022-08-02'),
(302, 102, 5, 'Me encantó.', '2022-08-04'),
(303, 103, 3, 'Normal.', '2022-08-06'),
(304, 104, 4, 'Buena calidad.', '2022-09-02'),
(305, 105, 2, 'No era lo que esperaba.', '2022-09-04');
