USE [Diagnostics_Store]
GO

-- this table maintains history of the snapshot captures
CREATE TABLE [Snapshot].[History](
	[snap_time] [datetime] NULL,
	[net_transport]	nvarchar(40) NULL,	
	[protocol_type]	nvarchar(40) NULL,
	[auth_scheme]	nvarchar(40) NULL,
	[local_net_address] varchar(48) NULL,
	[local_tcp_port] int NULL,
	[client_net_address] varchar(48) NULL,
	[physical_net_transport] nvarchar(40) NULL
) ON [PRIMARY]
GO


SELECT * FROM [Snapshot].[History]
GO

TRUNCATE TABLE [Snapshot].[History]
GO
