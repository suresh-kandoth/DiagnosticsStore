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

WHILE (1 = 1)
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
	CONVERT(nvarchar(40),ConnectionProperty('physical_net_transport')) AS 'physical_net_transport'

	WAITFOR DELAY @DelayLength

	EXEC [Snapshot].[Capture_Frequent]

END

END
GO


