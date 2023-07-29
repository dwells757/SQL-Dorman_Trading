USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep]
												@Registered_Rep='OPC01' --@Registered_Rep VARCHAR(5)

SET NOCOUNT OFF