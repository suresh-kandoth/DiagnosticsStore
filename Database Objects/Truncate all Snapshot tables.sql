DECLARE @command	nvarchar(4000)
DECLARE @system_object_name nvarchar(255), @system_object_schema nvarchar(255), @diagnostics_object_name nvarchar(255), @diagnostics_object_schema nvarchar(255)

DECLARE capture_cursor CURSOR FOR   
SELECT [system_object_name],[system_object_schema],[diagnostics_object_name],[diagnostics_object_schema]
FROM [Snapshot].[Information_To_Collect]  

OPEN capture_cursor 

FETCH NEXT FROM capture_cursor INTO @system_object_name, @system_object_schema, @diagnostics_object_name, @diagnostics_object_schema

WHILE @@FETCH_STATUS = 0  
BEGIN  
	SET @command = N'TRUNCATE TABLE [' + @diagnostics_object_schema + '].[' + @diagnostics_object_name + '] '

	--PRINT @command
	EXEC (@command)

	FETCH NEXT FROM capture_cursor INTO @system_object_name, @system_object_schema, @diagnostics_object_name, @diagnostics_object_schema
END

CLOSE capture_cursor 
DEALLOCATE capture_cursor 