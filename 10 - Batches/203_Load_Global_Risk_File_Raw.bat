DEL C:\HCC\Files\Top_Day\203_Load_Global_Risk_File_Raw.log

SET Log=C:\HCC\Files\Top_Day\203_Load_Global_Risk_File_Raw.log

REM ****************************************************************************************************************************
REM START - Get "Global Risk" file from CQG
REM ****************************************************************************************************************************
echo CD \HCC\Files\Top_Day >> %Log%
CD \HCC\Files\Top_Day >> %Log%

echo DEL GBLRSKRTG.zip >> %Log%
DEL GBLRSKRTG.zip >> %Log%

echo DEL GBLRSKRTG.CSV >> %Log%
DEL GBLRSKRTG.CSV >> %Log%

echo DEL WinSCP.log >> %Log%
DEL WinSCP.log >> %Log%

echo "C:\Program Files (x86)\WinSCP\WinSCP.exe" /log="C:\HCC\Files\Top_Day\WinSCP.log" /ini=nul /script="C:\HCC\Files\Top_Day\WinSCP_Script.txt"
"C:\Program Files (x86)\WinSCP\WinSCP.exe" /log="C:\HCC\Files\Top_Day\WinSCP.log" /ini=nul /script="C:\HCC\Files\Top_Day\WinSCP_Script.txt"

echo DIR GBLRSKRTG.zip >> %Log%
DIR GBLRSKRTG.zip >> %Log%

echo "C:\Program Files\7-Zip\7z" e GBLRSKRTG.zip >> %Log%
"C:\Program Files\7-Zip\7z" e GBLRSKRTG.zip >> %Log%

echo DIR GBLRSKRTG.CSV >> %Log%
DIR GBLRSKRTG.CSV >> %Log%

REM ****************************************************************************************************************************
REM END - Get "Global Risk" file from CQG
REM ****************************************************************************************************************************

echo sqlcmd -Q"TRUNCATE TABLE [dbo].[Global_Risk_File_Raw]" -d gmidata -S ncusprdsql01.database.windows.net -b -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
sqlcmd -Q"TRUNCATE TABLE [dbo].[Global_Risk_File_Raw]" -d gmidata -S ncusprdsql01.database.windows.net -b -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

IF EXIST C:\HCC\Files\Top_Day\GBLRSKRTG.CSV (
	echo bcp [dbo].[Global_Risk_File_Raw] in C:\HCC\Files\Top_Day\GBLRSKRTG.CSV -f C:\HCC\Code\Format_Files\Global_Risk_File_Raw.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -h"TABLOCK" >> %Log%
	bcp [dbo].[Global_Risk_File_Raw] in C:\HCC\Files\Top_Day\GBLRSKRTG.CSV -f C:\HCC\Code\Format_Files\Global_Risk_File_Raw.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -h"TABLOCK" >> %Log%
)

echo sqlcmd -Q"EXEC [dbo].[PROC_Add_Records_to_Global_Risk_File_Raw]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Add_Records_to_Global_Risk_File_Raw]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%

echo sqlcmd -Q"EXEC [dbo].[PROC_Load_Global_Risk_File_Current_Transactions]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Load_Global_Risk_File_Current_Transactions]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%

echo sqlcmd -Q"EXEC [dbo].[PROC_Load_Global_Risk_File_Current_Transactions_2]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Load_Global_Risk_File_Current_Transactions_2]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%

echo sqlcmd -Q"EXEC [dbo].[PROC_Update_GMI_Current_Price]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Update_GMI_Current_Price]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%

echo sqlcmd -Q"EXEC [dbo].[PROC_Load_GMI_Current_Positions_Detailed]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Load_GMI_Current_Positions_Detailed]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%

echo sqlcmd -Q"EXEC [dbo].[PROC_Load_GMI_Current_Positions_Summarized]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Load_GMI_Current_Positions_Summarized]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%

echo sqlcmd -Q"EXEC [dbo].[PROC_Load_Global_Risk_File_Current_Cash]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Load_Global_Risk_File_Current_Cash]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%

echo sqlcmd -Q"EXEC [dbo].[PROC_Load_GMI_Snapshot_Top_Day]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Load_GMI_Snapshot_Top_Day]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%

echo sqlcmd -Q"EXEC [dbo].[PROC_Load_GMI_Snapshot_Current]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Load_GMI_Snapshot_Current]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%

echo sqlcmd -Q"EXEC [dbo].[PROC_Load_Current_Accounts]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Load_Current_Accounts]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%

echo sqlcmd -Q"EXEC [dbo].[PROC_Update_Current_Information_Snapshot_Time]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Update_Current_Information_Snapshot_Time]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 >> %Log%
