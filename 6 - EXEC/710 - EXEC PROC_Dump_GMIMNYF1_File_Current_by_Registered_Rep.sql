USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep]
														@Registered_Rep='00118' --@Registered_Rep VARCHAR(5)

SET NOCOUNT OFF