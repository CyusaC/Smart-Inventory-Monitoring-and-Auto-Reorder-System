INSERT INTO suppliers (supplier_name, email, phone)
VALUES ('ABC Suppliers', 'abc@supply.com', '0788000000');

INSERT INTO products (product_name, supplier_id, unit_price)
VALUES ('Laptop', 1, 1200);

INSERT INTO inventory (product_id, quantity, reorder_level)
VALUES (1, 10, 5);

COMMIT;
