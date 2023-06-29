-- =============================================
-- Create database 
-- =============================================
USE master
GO

-- Drop the database if it already exists
IF  EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'Diagnostics_Store'
)
DROP DATABASE Diagnostics_Store
GO

-- Customize the location and other options for database as needed
CREATE DATABASE Diagnostics_Store
GO

USE [master]
GO
ALTER DATABASE [Diagnostics_Store] SET RECOVERY SIMPLE WITH NO_WAIT
GO
