CREATE OR REPLACE TRIGGER restrict_weekday_inventory
BEFORE INSERT OR UPDATE OR DELETE ON inventory
BEGIN
    IF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH')
       IN ('MON','TUE','WED','THU','FRI') THEN

        INSERT INTO audit_log
        (username, action, table_name, details)
        VALUES
        (USER, 'BLOCKED', 'INVENTORY', 'Weekday restriction');

        RAISE_APPLICATION_ERROR(
            -20001,
            'Inventory changes not allowed on weekdays'
        );
    END IF;
END;
/
