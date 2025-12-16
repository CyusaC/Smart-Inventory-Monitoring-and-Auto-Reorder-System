CREATE OR REPLACE PROCEDURE check_and_reorder (
    p_product_id IN NUMBER
) AS
    v_qty inventory.quantity%TYPE;
    v_reorder inventory.reorder_level%TYPE;
BEGIN
    SELECT quantity, reorder_level
    INTO v_qty, v_reorder
    FROM inventory
    WHERE product_id = p_product_id;

    IF v_qty < v_reorder THEN
        INSERT INTO purchase_orders (
            product_id, quantity, status
        )
        VALUES (
            p_product_id, v_reorder * 2, 'AUTO-GENERATED'
        );
    END IF;
END;
/
