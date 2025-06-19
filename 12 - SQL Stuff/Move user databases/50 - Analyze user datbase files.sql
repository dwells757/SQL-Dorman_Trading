USE master
GO

SET NOCOUNT ON

SELECT name,
       physical_name AS CurrentLocation,
       state_desc
FROM sys.master_files
WHERE database_id = DB_ID(N'GMIDATA');

SET NOCOUNT OFF