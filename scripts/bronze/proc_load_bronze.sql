/*
============================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
============================================================

Script Purpose:
  This stored procedure loads data into the 'bronze' schema from external CSV files.
  It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the BULK INSERT command to load data from CSV files into bronze tables.

Parameters:
  None.
  This stored procedure does not accept any parameters or return any values.

Usage Example:
  EXEC bronze.load_bronze;
============================================================
*/

CREATE OR ALTER PROCEDURE [bronze].[load_bronze]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @start_time DATETIME2(3), @end_time DATETIME2(3);

    PRINT '============================================';
    PRINT 'Loading Bronze Layer';
    PRINT '============================================';

    PRINT '---------------------------------------------';
    PRINT 'Loading CRM Tables';
    PRINT '---------------------------------------------';

    ------------------------------------------------------------------
    -- crm_cust_info
    PRINT '>> Truncating Table: bronze.crm_cust_info';
    TRUNCATE TABLE bronze.crm_cust_info;

    PRINT '>> Loading Table: bronze.crm_cust_info';
    SET @start_time = SYSDATETIME();
    BULK INSERT bronze.crm_cust_info
    FROM 'C:\Users\etiem\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
    WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );
    SET @end_time = SYSDATETIME();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
    PRINT '---------';

    ------------------------------------------------------------------
    -- crm_prd_info
    PRINT '>> Truncating Table: bronze.crm_prd_info';
    TRUNCATE TABLE bronze.crm_prd_info;

    PRINT '>> Loading Table: bronze.crm_prd_info';
    SET @start_time = SYSDATETIME();
    BULK INSERT bronze.crm_prd_info
    FROM 'C:\Users\etiem\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
    WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );
    SET @end_time = SYSDATETIME();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
    PRINT '---------';

    ------------------------------------------------------------------
    -- crm_sales_details
    PRINT '>> Truncating Table: bronze.crm_sales_details';
    TRUNCATE TABLE bronze.crm_sales_details;

    PRINT '>> Loading Table: bronze.crm_sales_details';
    SET @start_time = SYSDATETIME();
    BULK INSERT bronze.crm_sales_details
    FROM 'C:\Users\etiem\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
    WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );
    SET @end_time = SYSDATETIME();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
    PRINT '---------';

    ------------------------------------------------------------------
    -- erp_cust_az12
    PRINT '>> Truncating Table: bronze.erp_cust_az12';
    TRUNCATE TABLE bronze.erp_cust_az12;

    PRINT '>> Loading Table: bronze.erp_cust_az12';
    SET @start_time = SYSDATETIME();
    BULK INSERT bronze.erp_cust_az12
    FROM 'C:\Users\etiem\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
    WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );
    SET @end_time = SYSDATETIME();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
    PRINT '---------';

    ------------------------------------------------------------------
    -- erp_loc_a101
    PRINT '>> Truncating Table: bronze.erp_loc_a101';
    TRUNCATE TABLE bronze.erp_loc_a101;

    PRINT '>> Loading Table: bronze.erp_loc_a101';
    SET @start_time = SYSDATETIME();
    BULK INSERT bronze.erp_loc_a101
    FROM 'C:\Users\etiem\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
    WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );
    SET @end_time = SYSDATETIME();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
    PRINT '---------';

    ------------------------------------------------------------------
    -- erp_px_cat_g1v2
    PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;

    PRINT '>> Loading Table: bronze.erp_px_cat_g1v2';
    SET @start_time = SYSDATETIME();
    BULK INSERT bronze.erp_px_cat_g1v2
    FROM 'C:\Users\etiem\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
    WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );
    SET @end_time = SYSDATETIME();
    PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
    PRINT '---------';
END
