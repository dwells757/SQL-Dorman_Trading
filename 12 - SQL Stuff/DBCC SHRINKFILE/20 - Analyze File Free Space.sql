USE GMIDATA
GO

SET NOCOUNT ON

SELECT name
    , size / 128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS INT) / 128.0 AS AvailableSpaceInMB
FROM sys.database_files;

SET NOCOUNT OFF