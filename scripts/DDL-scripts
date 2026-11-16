
/*
===============================================================================
Script Name : ddl_bronze.sql
Project     : SQL Data Warehouse
Layer       : Bronze (Raw Data)
Purpose     : Create Bronze layer tables for CRM and ERP source data.
===============================================================================

DESCRIPTION:
    This script creates six tables in the Bronze schema to store raw
    data extracted from CRM and ERP source systems.

    CRM Tables:
        - crm_crust_info
        - crm_prd_info
        - crm_sales_details

    ERP Tables:
        - erp_cust_az12
        - erp_loc_a101
        - erp_px_cat_g1v2

    The Bronze layer preserves source data before cleaning,
    standardization, and transformation in the Silver layer.

EXECUTION:
    1. Ensure the DataWarehouse database and bronze schema exist.
    2. Connect to Microsoft SQL Server.
    3. Execute this script to recreate the Bronze tables.
    4. Load source data using the Bronze ingestion process.

WARNING:
    This script drops existing Bronze tables before recreating them.
    ALL DATA in these tables will be permanently deleted.
    Intended for development and learning environments only.

===============================================================================
*/

USE DataWarehouse;
GO

-- Drop CRM Customer Information Table
IF OBJECT_ID('bronze.crm_crust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_crust_info;
GO

-- Drop CRM Product Information Table
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
GO

-- Drop CRM Sales Details Table
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
GO

-- Drop ERP Customer Table
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
GO

-- Drop ERP Location Table
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
GO

-- Drop ERP Product Category Table
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO
