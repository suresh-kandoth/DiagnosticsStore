USE Diagnostics_Store
GO
DROP TABLE [Snapshot].[Information_To_Collect]
GO

-- This table stores the list of DMV or catalog views that needs to be polled, intervals to poll, scope of the DMV execution
CREATE TABLE [Snapshot].[Information_To_Collect]
(
[system_object_name]	nvarchar(255),
[system_object_schema]	nvarchar(255),
[diagnostics_object_name]	nvarchar(255),
[diagnostics_object_schema]	nvarchar(255),
[frequency]	nvarchar(255),
[scope]	nvarchar(255)
)
GO

-- adjust the following list based on specific needs

-- SQL Server Operating System Related Dynamic Management Views
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_dispatcher_pools','sys','dm_os_dispatcher_pools','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_hosts','sys','dm_os_hosts','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_latch_stats','sys','dm_os_latch_stats','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_memory_brokers','sys','dm_os_memory_brokers','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_memory_cache_clock_hands','sys','dm_os_memory_cache_clock_hands','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_memory_cache_counters','sys','dm_os_memory_cache_counters','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_memory_cache_hash_tables','sys','dm_os_memory_cache_hash_tables','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_memory_clerks','sys','dm_os_memory_clerks','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_memory_nodes','sys','dm_os_memory_nodes','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_memory_objects','sys','dm_os_memory_objects','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_memory_pools','sys','dm_os_memory_pools','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_nodes','sys','dm_os_nodes','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_performance_counters','sys','dm_os_performance_counters','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_process_memory','sys','dm_os_process_memory','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_schedulers','sys','dm_os_schedulers','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_spinlock_stats','sys','dm_os_spinlock_stats','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_sys_memory','sys','dm_os_sys_memory','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_tasks','sys','dm_os_tasks','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_threads','sys','dm_os_threads','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_waiting_tasks','sys','dm_os_waiting_tasks','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_wait_stats','sys','dm_os_wait_stats','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_workers','sys','dm_os_workers','Snapshot','Every 5 minutes','server')

INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_sys_info','sys','dm_os_sys_info','Snapshot','Every 1 day','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_loaded_modules','sys','dm_os_loaded_modules','Snapshot','Every 1 day','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_os_virtual_address_dump','sys','dm_os_virtual_address_dump','Snapshot','Every 1 day','server')
GO
-- I/O Related Dynamic Management Views and Functions
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_io_virtual_file_stats(NULL,NULL)','sys','dm_io_virtual_file_stats','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_io_pending_io_requests','sys','dm_io_pending_io_requests','Snapshot','Every 5 minutes','server')
GO
-- Database Related Dynamic Management Views 
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_db_file_space_usage','sys','dm_db_file_space_usage','Snapshot','Every 5 minutes','database')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_db_log_space_usage','sys','dm_db_log_space_usage','Snapshot','Every 5 minutes','database')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_db_session_space_usage','sys','dm_db_session_space_usage','Snapshot','Every 5 minutes','database')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_db_task_space_usage','sys','dm_db_task_space_usage','Snapshot','Every 5 minutes','database')

INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_db_partition_stats','sys','dm_db_partition_stats','Snapshot','Every 1 day','database')
GO
-- Execution Related Dynamic Management Views
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_background_job_queue','sys','dm_exec_background_job_queue','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_background_job_queue_stats','sys','dm_exec_background_job_queue_stats','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_connections','sys','dm_exec_connections','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_distributed_request_steps','sys','dm_exec_distributed_request_steps','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_distributed_requests','sys','dm_exec_distributed_requests','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_distributed_sql_requests','sys','dm_exec_distributed_sql_requests','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_external_operations','sys','dm_exec_external_operations','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_external_work','sys','dm_exec_external_work','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_query_memory_grants','sys','dm_exec_query_memory_grants','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_query_optimizer_memory_gateways','sys','dm_exec_query_optimizer_memory_gateways','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_query_parallel_workers','sys','dm_exec_query_parallel_workers','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_query_resource_semaphores','sys','dm_exec_query_resource_semaphores','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_requests','sys','dm_exec_requests','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_session_wait_stats','sys','dm_exec_session_wait_stats','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_sessions','sys','dm_exec_sessions','Snapshot','Every 5 minutes','server')

INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_query_stats','sys','dm_exec_query_stats','Snapshot','Every 1 hour','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_trigger_stats','sys','dm_exec_trigger_stats','Snapshot','Every 1 hour','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_procedure_stats','sys','dm_exec_procedure_stats','Snapshot','Every 1 hour','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_exec_function_stats','sys','dm_exec_function_stats','Snapshot','Every 1 hour','server')

GO
-- Transaction Related Dynamic Management Views
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_tran_active_snapshot_database_transactions','sys','dm_tran_active_snapshot_database_transactions','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_tran_active_transactions','sys','dm_tran_active_transactions','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_tran_current_snapshot','sys','dm_tran_current_snapshot','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_tran_current_transaction','sys','dm_tran_current_transaction','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_tran_database_transactions','sys','dm_tran_database_transactions','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_tran_session_transactions','sys','dm_tran_session_transactions','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_tran_transactions_snapshot','sys','dm_tran_transactions_snapshot','Snapshot','Every 5 minutes','server')
INSERT INTO [Snapshot].Information_To_Collect VALUES ('dm_tran_aborted_transactions','sys','dm_tran_aborted_transactions','Snapshot','Every 5 minutes','server')

GO

SELECT * FROM [Snapshot].[Information_To_Collect]
ORDER BY frequency, scope, system_object_name
GO
