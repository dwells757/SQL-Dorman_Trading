USE [GMIDATA]
GO

SET NOCOUNT ON

EXEC [dbo].[PROC_Fee_Report_Details_by_Registered_Rep]
												@Start_Date='1/1/25', --@Start_Date DATE,
												@End_Date='12/31/25', --@End_Date DATE,
												--@Registered_Rep='00581' --@Registered_Rep VARCHAR(5)
												--@Registered_Rep='00582' --@Registered_Rep VARCHAR(5)
												--@Registered_Rep='00583' --@Registered_Rep VARCHAR(5)
												--@Registered_Rep='00584' --@Registered_Rep VARCHAR(5)
												--@Registered_Rep='00585' --@Registered_Rep VARCHAR(5)
												--@Registered_Rep='00587' --@Registered_Rep VARCHAR(5)
												--@Registered_Rep='00589' --@Registered_Rep VARCHAR(5)
												--@Registered_Rep='00591' --@Registered_Rep VARCHAR(5)
												--@Registered_Rep='OPC01' --@Registered_Rep VARCHAR(5)
												@Registered_Rep='00615' --@Registered_Rep VARCHAR(5)


SET NOCOUNT OFF