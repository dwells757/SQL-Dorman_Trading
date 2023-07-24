DEL C:\React\Files\Top_Day\3_Load_Global_Risk_File_Raw.log

SET Log=C:\React\Files\Top_Day\3_Load_Global_Risk_File_Raw.log

REM ****************************************************************************************************************************
REM START - Get "Global Risk" file from CQG
REM ****************************************************************************************************************************
echo CD \React\Files\Top_Day >> %Log%
CD \React\Files\Top_Day >> %Log%

echo DEL GBLRSKRTG.zip >> %Log%
DEL GBLRSKRTG.zip >> %Log%

echo DEL GBLRSKRTG.CSV >> %Log%
DEL GBLRSKRTG.CSV >> %Log%

echo DEL WinSCP.log >> %Log%
DEL WinSCP.log >> %Log%

echo "C:\Program Files (x86)\WinSCP\WinSCP.exe" /log="C:\React\Files\Top_Day\WinSCP.log" /ini=nul /script="C:\React\Files\Top_Day\WinSCP_Script.txt"
"C:\Program Files (x86)\WinSCP\WinSCP.exe" /log="C:\React\Files\Top_Day\WinSCP.log" /ini=nul /script="C:\React\Files\Top_Day\WinSCP_Script.txt"

echo DIR GBLRSKRTG.zip >> %Log%
DIR GBLRSKRTG.zip >> %Log%

echo "C:\Program Files\7-Zip\7z" e GBLRSKRTG.zip >> %Log%
"C:\Program Files\7-Zip\7z" e GBLRSKRTG.zip >> %Log%

echo DIR GBLRSKRTG.CSV >> %Log%
DIR GBLRSKRTG.CSV >> %Log%

REM ****************************************************************************************************************************
REM END - Get "Global Risk" file from CQG
REM ****************************************************************************************************************************

echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[Global_Risk_File_Raw]" -S REACT -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[Global_Risk_File_Raw]" -S REACT -b >> %Log%

IF EXIST C:\React\Files\Top_Day\GBLRSKRTG.CSV (
	echo bcp GMIDATA..Global_Risk_File_Raw in C:\React\Files\Top_Day\GBLRSKRTG.CSV -f C:\React\Code\Format_Files\Global_Risk_File_Raw.xml -m50 -S REACT -T -h"TABLOCK" -F 2 >> %Log%
	bcp GMIDATA..Global_Risk_File_Raw in C:\React\Files\Top_Day\GBLRSKRTG.CSV -f C:\React\Code\Format_Files\Global_Risk_File_Raw.xml -m50 -S REACT -T -h"TABLOCK" -F 2 >> %Log%
)

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Global_Risk_File_Current_Transactions]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Global_Risk_File_Current_Transactions]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Update_GMI_Current_Price]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Update_GMI_Current_Price]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Current_Positions_Detailed]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Current_Positions_Detailed]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Current_Positions_Summarized]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Current_Positions_Summarized]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Global_Risk_File_Current_Cash]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Global_Risk_File_Current_Cash]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Snapshot_Top_Day]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Snapshot_Top_Day]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Snapshot_Current]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Snapshot_Current]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Current_Accounts]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Current_Accounts]" -S REACT -b -h-1 >> %Log%
