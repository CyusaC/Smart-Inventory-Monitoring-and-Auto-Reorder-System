

INSERT INTO suppliers (supplier_name, email, phone)
VALUES ('ABC Suppliers', 'abc@supply.com', '0788000000');

INSERT INTO products (product_name, unit_price, reorder_level, supplier_id)
VALUES ('Laptop', 1200, 10, 1);

INSERT INTO inventory (product_id, quantity)
VALUES (1, 5);

INSERT INTO holidays (holiday_date, description)
VALUES (TRUNC(SYSDATE), 'Test Public Holiday');

COMMIT;
