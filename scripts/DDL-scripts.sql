
/*
===============================================================================
Script Name : ddl_bronze.sql
Project     : SQL Data Warehouse
Layer       : Bronze
Database    : DataWarehouse
===============================================================================

PURPOSE:
    Defines the table structures for the Bronze layer of the data warehouse.

DESCRIPTION:
    This script creates six tables within the Bronze schema to store
    source data from CRM and ERP systems.

    CRM Source Tables:
        - bronze.crm_cust_info
        - bronze.crm_prd_info
        - bronze.crm_sales_details

    ERP Source Tables:
        - bronze.erp_cust_az12
        - bronze.erp_loc_a101
        - bronze.erp_px_cat_g1v2

    The Bronze layer serves as the initial landing zone for source data.
    Data cleaning, standardization, and business transformations are
    performed in subsequent layers.

PREREQUISITES:
    - Microsoft SQL Server 2016 or later
    - DataWarehouse database exists
    - Bronze schema has been created
    - Appropriate database permissions

EXECUTION:
    1. Connect to the SQL Server instance.
    2. Execute this script to create the Bronze tables.
    3. Run the Bronze data ingestion script to load source data.

WARNING:
    This script drops and recreates existing Bronze tables.
    All previously loaded data in these tables will be deleted.
    Intended for development and testing environments only.

===============================================================================
*/

USE DataWarehouse;
GO

-- =============================================================================
-- 1. CRM SOURCE TABLES
-- =============================================================================

-- 1.1 Customer Information
DROP TABLE IF EXISTS bronze.crm_cust_info;
GO

CREATE TABLE bronze.crm_cust_info (
    cst_id             INT,
    cst_key            NVARCHAR(50),
    cst_firstname      NVARCHAR(50),
    cst_lastname       NVARCHAR(50),
    cst_marital_status NVARCHAR(50),
    cst_gndr           NVARCHAR(50),
    cst_create_date    DATE
);
GO

-- 1.2 Product Information
DROP TABLE IF EXISTS bronze.crm_prd_info;
GO

CREATE TABLE bronze.crm_prd_info (
    prd_id         INT,
    prd_key        NVARCHAR(50),
    prd_nm         NVARCHAR(255),
    prd_cost       INT,
    prd_line       NVARCHAR(10),
    prd_start_dt   DATE,
    prd_end_dt     DATE
);
GO

-- 1.3 Sales Details
DROP TABLE IF EXISTS bronze.crm_sales_details;
GO

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num    NVARCHAR(50),
    sls_prd_key    NVARCHAR(50),
    sls_cust_id    INT,
    sls_order_dt   INT,
    sls_ship_dt    INT,
    sls_due_dt     INT,
    sls_sales      INT,
    sls_quantity   INT,
    sls_price      INT
);
GO

-- =============================================================================
-- 2. ERP SOURCE TABLES
-- =============================================================================

-- 2.1 Customer Demographics
DROP TABLE IF EXISTS bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12 (
    CID     NVARCHAR(50),
    BDATE   DATE,
    GEN     NVARCHAR(10)
);
GO

-- 2.2 Customer Location
DROP TABLE IF EXISTS bronze.erp_loc_a101;
GO

CREATE TABLE bronze.erp_loc_a101 (
    CID     NVARCHAR(50),
    CNTRY   NVARCHAR(50)
);
GO

-- 2.3 Product Categories
DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2 (
    ID           NVARCHAR(50),
    CAT          NVARCHAR(50),
    SUBCAT       NVARCHAR(100),
    MAINTENANCE  NVARCHAR(10)
);
GO


-- Drop ERP Product Category Table
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO
