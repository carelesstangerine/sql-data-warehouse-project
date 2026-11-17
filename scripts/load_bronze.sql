/*
===============================================================================
Script Name : load_bronze.sql
Project     : SQL Data Warehouse
Layer       : Bronze
Database    : DataWarehouse
===============================================================================

PURPOSE:
    Loads raw CSV data from CRM and ERP source systems into the Bronze
    layer of the data warehouse.

DESCRIPTION:
    This script performs a full-refresh load for six Bronze tables.

    CRM Tables:
        - bronze.crm_cust_info
        - bronze.crm_prd_info
        - bronze.crm_sales_details

    ERP Tables:
        - bronze.erp_cust_az12
        - bronze.erp_loc_a101
        - bronze.erp_px_cat_g1v2

LOAD STRATEGY:
    Full Refresh (TRUNCATE + BULK INSERT)

PREREQUISITES:
    - DataWarehouse database and Bronze tables exist.
    - Source CSV files are accessible inside the SQL Server container.
    - SQL Server has permission to read the files.

WARNING:
    Existing table data is deleted before each reload.
    Intended for development and testing environments.

===============================================================================
*/

USE DataWarehouse;
GO

-- =============================================================================
-- 1. LOAD CRM SOURCE TABLES
-- =============================================================================

-- 1.1 CRM Customer Information
TRUNCATE TABLE bronze.crm_cust_info;

BULK INSERT bronze.crm_cust_info
FROM '/var/opt/mssql/cust_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

-- 1.2 CRM Product Information
TRUNCATE TABLE bronze.crm_prd_info;

BULK INSERT bronze.crm_prd_info
FROM '/var/opt/mssql/prd_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

-- 1.3 CRM Sales Details
TRUNCATE TABLE bronze.crm_sales_details;

BULK INSERT bronze.crm_sales_details
FROM '/var/opt/mssql/sales_details.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

-- =============================================================================
-- 2. LOAD ERP SOURCE TABLES
-- =============================================================================

-- 2.1 ERP Customer Demographics
TRUNCATE TABLE bronze.erp_cust_az12;

BULK INSERT bronze.erp_cust_az12
FROM '/var/opt/mssql/CUST_AZ12.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

-- 2.2 ERP Customer Location
TRUNCATE TABLE bronze.erp_loc_a101;

BULK INSERT bronze.erp_loc_a101
FROM '/var/opt/mssql/LOC_A101.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

-- 2.3 ERP Product Categories
TRUNCATE TABLE bronze.erp_px_cat_g1v2;

BULK INSERT bronze.erp_px_cat_g1v2
FROM '/var/opt/mssql/PX_CAT_G1V2.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);


