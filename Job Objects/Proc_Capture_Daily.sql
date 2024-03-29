USE [Diagnostics_Store]
GO
DROP PROCEDURE [Snapshot].[Capture_Daily]
GO

-- this proc captures the DMV or catalog view information and persists them in the snapshot tables
CREATE PROCEDURE [Snapshot].[Capture_Daily]
AS
BEGIN

DECLARE @snaptime datetime
SET @snaptime = GETDATE()

DECLARE @command	nvarchar(4000)
DECLARE @system_object_name nvarchar(255), @system_object_schema nvarchar(255), @diagnostics_object_name nvarchar(255), @diagnostics_object_schema nvarchar(255), @scope nvarchar(255)

DECLARE capture_cursor CURSOR FOR   
SELECT [system_object_name],[system_object_schema],[diagnostics_object_name],[diagnostics_object_schema],[scope]
FROM [Snapshot].[Information_To_Collect]  
WHERE [frequency] = N'Every 1 day'

OPEN capture_cursor 

FETCH NEXT FROM capture_cursor INTO @system_object_name, @system_object_schema, @diagnostics_object_name, @diagnostics_object_schema, @scope

WHILE @@FETCH_STATUS = 0  
BEGIN  
	-- if this is a server scoped object  we just execute once and save results
	IF @scope = N'server'
	BEGIN
		SET @command = N'INSERT INTO [' + @diagnostics_object_schema + '].[' + @diagnostics_object_name + '] 
		SELECT ''' + CONVERT(nvarchar(50),@snaptime,121) + ''' as [snap_time], *
		FROM ' + @system_object_schema + '.' + @system_object_name

		EXEC (@command)
	END
	-- if this is a database scoped object we execute it in the context of each database
	IF @scope = N'database'
	BEGIN
		SET @command = N'USE ? INSERT INTO [Diagnostics_Store].[' + @diagnostics_object_schema + '].[' + @diagnostics_object_name + '] 
		SELECT ''' + CONVERT(nvarchar(50),@snaptime,121) + ''' as [snap_time], *
		FROM ' + @system_object_schema + '.' + @system_object_name

		EXEC sp_MSforeachdb @command
	END

	SET @command = N''
	FETCH NEXT FROM capture_cursor INTO @system_object_name, @system_object_schema, @diagnostics_object_name, @diagnostics_object_schema, @scope
END

CLOSE capture_cursor 
DEALLOCATE capture_cursor 

END
GO

--EXEC [Snapshot].[Capture_Daily]
--GO

