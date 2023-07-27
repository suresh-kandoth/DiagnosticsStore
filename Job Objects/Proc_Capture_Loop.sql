USE [Diagnostics_Store]
GO
DROP PROCEDURE [Snapshot].[Capture_Loop]
GO

-- this is the entrypoint for the call from the job
CREATE PROCEDURE [Snapshot].[Capture_Loop]
AS
BEGIN
-- we have to make all these constants variable and dynamic, right now hard coded while testing them
DECLARE @DelayLength char(8) = '00:05:00' 
DECLARE @LastSnapTimeFrequent datetime, @LastSnapTimeInFrequent datetime, @LastSnapTimeDaily datetime

WHILE (1 = 1)
BEGIN
	-- Step 1 : collect frequent items
	WAITFOR DELAY @DelayLength
	
	INSERT INTO [Snapshot].[History]
	SELECT   
	GETDATE(),
	CONVERT(nvarchar(40),ConnectionProperty('net_transport')) AS 'net_transport',   
	CONVERT(nvarchar(40),ConnectionProperty('protocol_type')) AS 'protocol_type',
	CONVERT(nvarchar(40),ConnectionProperty('auth_scheme')) AS 'auth_scheme',
	CONVERT(nvarchar(48),ConnectionProperty('local_net_address')) AS 'local_net_address',	
	CONVERT(int,ConnectionProperty('local_tcp_port')) AS 'local_tcp_port',
	CONVERT(nvarchar(48),ConnectionProperty('client_net_address')) AS 'client_net_address',
	CONVERT(nvarchar(40),ConnectionProperty('physical_net_transport')) AS 'physical_net_transport',
	'Every 5 minutes' AS 'frequency'
	
	EXEC [Snapshot].[Capture_Frequent]

	-- Step 2 : collect in-frequent items

	SELECT @LastSnapTimeInFrequent = MAX(snap_time) FROM [Snapshot].[History] WHERE frequency = 'Every 1 hour'
	IF (@LastSnapTimeInFrequent IS NULL)
		SELECT @LastSnapTimeInFrequent = MIN(snap_time) FROM [Snapshot].[History] WHERE frequency = 'Every 5 minutes'
	IF DATEDIFF(hh,@LastSnapTimeInFrequent,GETDATE()) >= 1
	BEGIN

		INSERT INTO [Snapshot].[History]
		SELECT   
		GETDATE(),
		CONVERT(nvarchar(40),ConnectionProperty('net_transport')) AS 'net_transport',   
		CONVERT(nvarchar(40),ConnectionProperty('protocol_type')) AS 'protocol_type',
		CONVERT(nvarchar(40),ConnectionProperty('auth_scheme')) AS 'auth_scheme',
		CONVERT(nvarchar(48),ConnectionProperty('local_net_address')) AS 'local_net_address',	
		CONVERT(int,ConnectionProperty('local_tcp_port')) AS 'local_tcp_port',
		CONVERT(nvarchar(48),ConnectionProperty('client_net_address')) AS 'client_net_address',
		CONVERT(nvarchar(40),ConnectionProperty('physical_net_transport')) AS 'physical_net_transport',
		'Every 1 hour' AS 'frequency'
	
		EXEC [Snapshot].[Capture_InFrequent]

	END

	-- Step 3 : collect daily metrics/information

	SELECT @LastSnapTimeDaily = MAX(snap_time) FROM [Snapshot].[History] WHERE frequency = 'Every 1 day'
	IF (@LastSnapTimeDaily IS NULL)
		SELECT @LastSnapTimeDaily = MIN(snap_time) FROM [Snapshot].[History] WHERE frequency = 'Every 5 minutes'
	IF DATEDIFF(dd,@LastSnapTimeDaily,GETDATE()) >= 1
	BEGIN

		INSERT INTO [Snapshot].[History]
		SELECT   
		GETDATE(),
		CONVERT(nvarchar(40),ConnectionProperty('net_transport')) AS 'net_transport',   
		CONVERT(nvarchar(40),ConnectionProperty('protocol_type')) AS 'protocol_type',
		CONVERT(nvarchar(40),ConnectionProperty('auth_scheme')) AS 'auth_scheme',
		CONVERT(nvarchar(48),ConnectionProperty('local_net_address')) AS 'local_net_address',	
		CONVERT(int,ConnectionProperty('local_tcp_port')) AS 'local_tcp_port',
		CONVERT(nvarchar(48),ConnectionProperty('client_net_address')) AS 'client_net_address',
		CONVERT(nvarchar(40),ConnectionProperty('physical_net_transport')) AS 'physical_net_transport',
		'Every 1 day' AS 'frequency'
	
		EXEC [Snapshot].[Capture_Daily]

	END

END

END
GO


