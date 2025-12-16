-- Test reorder
EXEC check_and_reorder(1);

-- Check stock status
SELECT stock_status(1) FROM dual;

-- View audit log
SELECT * FROM audit_log;
