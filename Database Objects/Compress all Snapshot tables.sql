USE [Diagnostics_Store]
GO

-- this script loops through all the tables and compresses them
-- run it once after you have created all the tables

DECLARE @command	nvarchar(4000) = N''
DECLARE @system_object_name nvarchar(255), @system_object_schema nvarchar(255), @diagnostics_object_name nvarchar(255), @diagnostics_object_schema nvarchar(255)
DECLARE @object_name_to_check nvarchar(500)

DECLARE capture_cursor CURSOR FOR   
SELECT [system_object_name],[system_object_schema],[diagnostics_object_name],[diagnostics_object_schema]
FROM [Snapshot].[Information_To_Collect]  

OPEN capture_cursor 

FETCH NEXT FROM capture_cursor INTO @system_object_name, @system_object_schema, @diagnostics_object_name, @diagnostics_object_schema

WHILE @@FETCH_STATUS = 0  
BEGIN  

	SET @object_name_to_check = CONCAT (@diagnostics_object_schema,'.',@diagnostics_object_name)

	IF OBJECT_ID (@object_name_to_check) IS NOT NULL
	BEGIN
	SET @command = N'ALTER TABLE [' + @diagnostics_object_schema + '].[' + @diagnostics_object_name + ']  REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE) '
	
	--PRINT @command
	EXEC (@command)

	SET @command = N''
	END

	FETCH NEXT FROM capture_cursor INTO @system_object_name, @system_object_schema, @diagnostics_object_name, @diagnostics_object_schema
	
END

CLOSE capture_cursor 
DEALLOCATE capture_cursor 

