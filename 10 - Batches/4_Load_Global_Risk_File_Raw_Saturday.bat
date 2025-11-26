DEL C:\React\Files\Top_Day\4_Load_Global_Risk_File_Raw_Saturday.log

SET Log=C:\React\Files\Top_Day\4_Load_Global_Risk_File_Raw_Saturday.log

echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[Global_Risk_File_Raw]" -S DORT-DB-1 -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[Global_Risk_File_Raw]" -S DORT-DB-1 -b >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Global_Risk_File_Current_Transactions]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Global_Risk_File_Current_Transactions]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Update_GMI_Current_Price]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Update_GMI_Current_Price]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Current_Positions_Detailed]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Current_Positions_Detailed]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Current_Positions_Summarized]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Current_Positions_Summarized]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Global_Risk_File_Current_Cash]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Global_Risk_File_Current_Cash]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Snapshot_Top_Day]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Snapshot_Top_Day]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Snapshot_Current]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Snapshot_Current]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Current_Accounts]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Current_Accounts]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Update_Current_Information_Snapshot_Time]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Update_Current_Information_Snapshot_Time]" -S DORT-DB-1 -b -h-1 >> %Log%