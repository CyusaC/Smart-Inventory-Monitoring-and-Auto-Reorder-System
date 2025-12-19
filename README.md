  Smart Inventory Monitoring & Auto-Reorder System  


 Cyusa Chrispin
 27135 

1. Project Overview

The Smart Inventory Monitoring & Auto-Reorder System is an Oracle-based database application designed to automate inventory management using SQL and PL/SQL.

The system tracks inventory levels, automatically generates purchase orders when stock is low, enforces business rules using triggers, and logs restricted operations for auditing purposes.

---

2. Problem Statement

Manual inventory management leads to:
- Stock shortages
- Overstocking
- Human errors
- Delayed reordering from suppliers

These issues reduce operational efficiency and affect decision-making.

---

3. Proposed Solution

The proposed system:
- Stores inventory data in a normalized relational database
- Monitors stock levels in real time
- Automatically generates purchase orders
- Restricts inventory updates on weekdays and public holidays
- Audits all restricted operations

---

4. System Features

- Supplier and product management
- Inventory tracking
- Automatic reorder logic
- PL/SQL package for modular programming
- Business rule enforcement using triggers
- Audit logging
- Holiday-based inventory restriction

---

5. Database Design (ER Diagram)

The system is designed using the following entities:

- SUPPLIERS
- PRODUCTS
- INVENTORY
- PURCHASE_ORDERS
- AUDIT_LOG
- HOLIDAYS

### Relationships
- One supplier supplies many products
- Each product has one inventory record
- A product can generate many purchase orders
- Inventory operations are audited
- Inventory updates are restricted on public holidays

 ER Diagram:
---

6. Database Tables Implemented

- SUPPLIERS
- PRODUCTS
- INVENTORY
- PURCHASE_ORDERS
- AUDIT_LOG
- HOLIDAYS

All tables include appropriate primary keys, foreign keys, and constraints.

---

7.PL/SQL Implementation

### Package: `inventory_pkg`

The package groups all inventory-related logic.

#### Functions
- `get_stock_status(product_id)`
  - Returns stock condition (`LOW STOCK`, `STOCK OK`, or `PRODUCT NOT FOUND`)

#### Procedures
- `check_and_reorder(product_id)`
  - Automatically generates purchase orders when stock is below reorder level
- `update_stock(product_id, quantity)`
  - Updates inventory with validation and exception handling

---

8. Exception Handling

The system handles:
- Invalid product IDs
- Negative stock quantities
- Missing inventory records

Errors are raised using `RAISE_APPLICATION_ERROR` with meaningful messages.

---

9.Business Rules & Triggers

### Weekday Restriction Trigger
- Prevents INSERT, UPDATE, DELETE operations on INVENTORY during weekdays
- Logs blocked attempts in AUDIT_LOG

### Holiday Restriction Trigger
- Prevents inventory updates on public holidays
- Uses the HOLIDAYS table
- Logs violations in AUDIT_LOG

---

10. Auditing

The AUDIT_LOG table records:
- Username
- Action type
- Table name
- Timestamp
- Reason for restriction

This ensures accountability and traceability.

---

11. Screenshots (Evidence)

Screenshots are included to demonstrate:
- Table creation
- Data insertion
- Procedure execution
- Function execution
- Trigger violation errors
- Audit log entries
- ER diagram

 Location: 
---

12. How to Run the Project

1. Connect to Oracle Database XE (Service: XEPDB1)
2. Login as user `SMART_INVENTORY`
3. Run scripts in order:
4. 
4. Execute procedures and functions to test functionality

---

13. Conclusion

This project demonstrates:
- Proper relational database design
- Effective use of PL/SQL packages
- Strong exception handling
- Advanced trigger-based business rules
- Auditing and data integrity enforcement

The system is suitable for real-world inventory management scenarios.

---

14. Technologies Used

- Oracle Database XE 21c
- Oracle SQL Developer
- PL/SQL
- draw.io
- GitHub




