USE master
GO

SET NOCOUNT ON

ALTER DATABASE GMIDATA
    SET OFFLINE
	WITH ROLLBACK IMMEDIATE; --automatically roll back and disconnect all other connections to the database,

SET NOCOUNT OFF