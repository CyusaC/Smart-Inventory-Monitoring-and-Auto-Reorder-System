CREATE OR REPLACE TRIGGER restrict_weekday_dml
BEFORE INSERT OR UPDATE OR DELETE ON inventory
BEGIN
    IF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH')
       IN ('MON','TUE','WED','THU','FRI') THEN

        INSERT INTO audit_log
        (username, action, table_name, details)
        VALUES
        (USER, 'DML BLOCKED', 'INVENTORY', 'Weekday access denied');

        RAISE_APPLICATION_ERROR(
            -20001,
            'DML operations are not allowed on weekdays'
        );
    END IF;
END;
/
