
CREATE OR REPLACE PACKAGE inventory_pkg AS

    FUNCTION get_stock_status (
        p_product_id IN NUMBER
    ) RETURN VARCHAR2;

    PROCEDURE check_and_reorder (
        p_product_id IN NUMBER
    );

    PROCEDURE update_stock (
        p_product_id IN NUMBER,
        p_quantity   IN NUMBER
    );

END inventory_pkg;
/

CREATE OR REPLACE PACKAGE BODY inventory_pkg AS

    FUNCTION get_stock_status (
        p_product_id IN NUMBER
    ) RETURN VARCHAR2 IS
        v_qty inventory.quantity%TYPE;
        v_level products.reorder_level%TYPE;
    BEGIN
        SELECT i.quantity, p.reorder_level
        INTO v_qty, v_level
        FROM inventory i
        JOIN products p ON i.product_id = p.product_id
        WHERE p.product_id = p_product_id;

        IF v_qty < v_level THEN
            RETURN 'LOW STOCK';
        ELSE
            RETURN 'STOCK OK';
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'PRODUCT NOT FOUND';
    END;

    PROCEDURE check_and_reorder (
        p_product_id IN NUMBER
    ) IS
        v_qty inventory.quantity%TYPE;
        v_level products.reorder_level%TYPE;
    BEGIN
        SELECT i.quantity, p.reorder_level
        INTO v_qty, v_level
        FROM inventory i
        JOIN products p ON i.product_id = p.product_id
        WHERE p.product_id = p_product_id;

        IF v_qty < v_level THEN
            INSERT INTO purchase_orders
            (product_id, quantity, status)
            VALUES
            (p_product_id, v_level * 2, 'AUTO-GENERATED');
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20010, 'Product not found');
    END;

    PROCEDURE update_stock (
        p_product_id IN NUMBER,
        p_quantity   IN NUMBER
    ) IS
    BEGIN
        IF p_quantity < 0 THEN
            RAISE_APPLICATION_ERROR(-20020, 'Quantity cannot be negative');
        END IF;

        UPDATE inventory
        SET quantity = p_quantity,
            last_updated = SYSDATE
        WHERE product_id = p_product_id;

        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20030, 'Inventory record not found');
        END IF;
    END;

END inventory_pkg;
/
