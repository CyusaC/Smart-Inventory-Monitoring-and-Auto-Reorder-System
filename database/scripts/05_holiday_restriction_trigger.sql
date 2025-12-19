CREATE OR REPLACE TRIGGER restrict_holiday_inventory
BEFORE INSERT OR UPDATE OR DELETE ON inventory
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM holidays
    WHERE holiday_date = TRUNC(SYSDATE);

    IF v_count > 0 THEN
        INSERT INTO audit_log
        (username, action, table_name, details)
        VALUES
        (USER, 'BLOCKED', 'INVENTORY',
         'Inventory modification blocked on public holiday');

        RAISE_APPLICATION_ERROR(
            -20040,
            'Inventory changes are not allowed on public holidays'
        );
    END IF;
END;
/
