CREATE OR REPLACE FUNCTION stock_status (
    p_product_id IN NUMBER
) RETURN VARCHAR2 IS
    v_qty NUMBER;
    v_level NUMBER;
BEGIN
    SELECT quantity, reorder_level
    INTO v_qty, v_level
    FROM inventory
    WHERE product_id = p_product_id;

    IF v_qty < v_level THEN
        RETURN 'LOW STOCK';
    ELSE
        RETURN 'SUFFICIENT';
    END IF;
END;
/
