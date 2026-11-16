/*
==========================================================
Create Database and Schemas
===========================================================
Script Purpose: 
    This script creates a database called 'DataWarehouse' and three schemas
    within it: bronze, silver, and gold. If the database exists, it is dropped 
    and recreated. Additionally, the script sets up three schemas within the database:
    'bronze', 'silver', and 'gold'. 


Warning:
    Running this script will drop the existing 'DataWarehouse' database if it exists, 
    resulting in the loss of all data within that database. All data in the database 
    will be permanently deleted. Proceed with caution and ensure you have proper 
    backups before running this script. 
*/

USE master;
GO -- GO is a separator, tells SQL to excecute the previous batch of statements and start a new batch. 

-- Drop and recreate the 'DataWarehouse' database 
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO 

-- Create Database 'DataWarehouse'
Create Database DataWarehouse;
GO 

USE DataWarehouse;

-- Create Schemas
GO 
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
