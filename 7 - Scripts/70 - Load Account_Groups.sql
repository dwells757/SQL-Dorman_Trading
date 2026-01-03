USE [GMIDATA]
GO

SET NOCOUNT ON

--Backhouse
INSERT INTO [dbo].[Account_Groups](Account_Group,Account)VALUES('Backhouse','D-10019')

--SILVERCAPE_INVSMT
INSERT INTO [dbo].[Account_Groups](Account_Group,Account)VALUES('SILVERCAPE_INVSMT','D-10012')
INSERT INTO [dbo].[Account_Groups](Account_Group,Account)VALUES('SILVERCAPE_INVSMT','D-10013')
INSERT INTO [dbo].[Account_Groups](Account_Group,Account)VALUES('SILVERCAPE_INVSMT','D-10014')
INSERT INTO [dbo].[Account_Groups](Account_Group,Account)VALUES('SILVERCAPE_INVSMT','D-10016')
INSERT INTO [dbo].[Account_Groups](Account_Group,Account)VALUES('SILVERCAPE_INVSMT','D-10018')

SET NOCOUNT OFF