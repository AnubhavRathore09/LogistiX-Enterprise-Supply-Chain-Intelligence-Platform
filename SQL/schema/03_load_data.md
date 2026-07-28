# Load Data into MySQL

## Step 1: Open MySQL Workbench

Connect to your MySQL Server.

---

## Step 2: Select Database

```sql
USE logistix_db;
```

---

## Step 3: Open Table Data Import Wizard

Navigate to:

Server → Table Data Import Wizard

---

## Step 4: Select CSV File

Choose:

Dataset/Raw/DataCoSupplyChainDataset.csv

Encoding:

latin1

---

## Step 5: Destination

Database:

logistix_db

Table:

fact_orders

---

## Step 6: Map Columns

Verify that all 53 CSV columns are correctly mapped to the table columns.

---

## Step 7: Import Data

Start the import process and wait until all records are loaded successfully.

Expected Records:

180,519

Expected Columns:

53

---

## Step 8: Verify Import

```sql
SELECT COUNT(*) FROM fact_orders;
```

Expected Output:

```
180519
```

---

## Next Step

After successful data import, continue with:

- 04_data_verification.sql