DEL C:\React\Files\2_Load_GMI_Files.log

SET Log=C:\React\Files\2_Load_GMI_Files.log

echo CD \React\Files >> %Log%
CD \React\Files >> %Log%

REM **************************************************************
REM START - Generate %YESTERDAY%
REM **************************************************************
FOR /F "usebackq tokens=*" %%t IN (`powershell -NoProfile -Command "(Get-Date).AddDays(-1).ToString('yyyyMMdd')"`) DO (SET "YESTERDAY=%%t")
REM FOR /F "usebackq tokens=*" %%t IN (`powershell -NoProfile -Command "(Get-Date).AddDays(-10).ToString('yyyyMMdd')"`) DO (SET "YESTERDAY=%%t")

echo Yesterday: >> %Log%
echo %YESTERDAY% >> %Log%
REM **************************************************************
REM END - Generate %YESTERDAY%
REM **************************************************************

REM **************************************************************
REM START - Generate Current_Processing_Date.txt
REM **************************************************************

echo DEL Current_Processing_Date.txt >> %Log%
DEL Current_Processing_Date.txt >> %Log%

echo creating Current_Processing_Date.txt ... >> %Log%
echo %YESTERDAY% > Current_Processing_Date.txt

echo DIR Current_Processing_Date.txt >> %Log%
DIR Current_Processing_Date.txt >> %Log%

REM **************************************************************
REM END - Generate Current_Processing_Date.txt
REM **************************************************************

REM **************************************************************
REM START - Load [dbo].[Current_Processing_Date]
REM **************************************************************

echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[Current_Processing_Date]" -S DORT-DB-1 -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[Current_Processing_Date]" -S DORT-DB-1 -b >> %Log%

echo bcp GMIDATA..Current_Processing_Date in C:\React\Files\Current_Processing_Date.txt -f C:\React\Code\Format_Files\Current_Processing_Date.FMT -m50 -S DORT-DB-1 -T -h"TABLOCK" >> %Log%
bcp GMIDATA..Current_Processing_Date in C:\React\Files\Current_Processing_Date.txt -f C:\React\Code\Format_Files\Current_Processing_Date.FMT -m50 -S DORT-DB-1 -T -h"TABLOCK" >> %Log%

REM **************************************************************
REM END - Load [dbo].[Current_Processing_Date]
REM **************************************************************

REM **************************************************************
REM START - Load [dbo].[Current_Information]
REM **************************************************************
REM (DWH 3/30/24) echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Update_Current_Information_with_GMIPOSF1]" -S DORT-DB-1 -b -h-1 >> %Log%
REM (DWH 3/30/24) sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Update_Current_Information_with_GMIPOSF1]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Update_Current_Information_with_Current_Processing_Date]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Update_Current_Information_with_Current_Processing_Date]" -S DORT-DB-1 -b -h-1 >> %Log%
REM **************************************************************
REM END - Load [dbo].[Current_Information]
REM **************************************************************

REM **************************************************************
REM START - Get GMI Files
REM **************************************************************
echo DEL *.csv >> %Log%
DEL *.csv >> %Log%

echo DEL *.zip >> %Log%
DEL *.zip >> %Log%

REM echo COPY "R:\*%YESTERDAY%.zip" >> %Log%
REM COPY "R:\*%YESTERDAY%.zip" >> %Log%

echo COPY "\\LASERVAULT\ftproot\GMI\Dorman Reports\*%YESTERDAY%.zip" >> %Log%
COPY "\\LASERVAULT\ftproot\GMI\Dorman Reports\*%YESTERDAY%.zip" >> %Log%

echo DIR *.zip >> %Log%
DIR *.zip >> %Log%

echo "C:\Program Files\7-Zip\7z" e *%YESTERDAY%.zip >> %Log%
"C:\Program Files\7-Zip\7z" e *%YESTERDAY%.zip >> %Log%

echo DIR C:\React\Files\*%YESTERDAY%*.csv >> %Log%
DIR C:\React\Files\*%YESTERDAY%*.csv >> %Log%
REM **************************************************************
REM END - Get GMI Files
REM **************************************************************

REM **************************************************************
REM START - Truncate Raw Tables
REM **************************************************************
echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIMNYF1_File_Raw]" -S DORT-DB-1 -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIMNYF1_File_Raw]" -S DORT-DB-1 -b >> %Log%

echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIPOSF1_File_Raw]" -S DORT-DB-1 -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIPOSF1_File_Raw]" -S DORT-DB-1 -b >> %Log%

echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIST4F1_File_Raw]" -S DORT-DB-1 -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIST4F1_File_Raw]" -S DORT-DB-1 -b >> %Log%

echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GNACMFF1_File_Raw]" -S DORT-DB-1 -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GNACMFF1_File_Raw]" -S DORT-DB-1 -b >> %Log%

echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GNACMFF4_File_Raw]" -S DORT-DB-1 -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GNACMFF4_File_Raw]" -S DORT-DB-1 -b >> %Log%

echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[DOREMAILA3_File_Raw]" -S DORT-DB-1 -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[DOREMAILA3_File_Raw]" -S DORT-DB-1 -b >> %Log%
REM **************************************************************
REM END - Truncate Raw Tables
REM **************************************************************

REM **************************************************************
REM START - Load Raw Tables
REM **************************************************************
echo bcp GMIDATA..GMIMNYF1_File_Raw in C:\React\Files\GMIMNYF1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S DORT-DB-1 -T -h"TABLOCK" -F 2 >> %Log%
bcp GMIDATA..GMIMNYF1_File_Raw in C:\React\Files\GMIMNYF1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S DORT-DB-1 -T -h"TABLOCK" -F 2 >> %Log%

echo bcp GMIDATA..GMIPOSF1_File_Raw in C:\React\Files\GMIPOSF1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S DORT-DB-1 -T -h"TABLOCK" -F 2 >> %Log%
bcp GMIDATA..GMIPOSF1_File_Raw in C:\React\Files\GMIPOSF1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S DORT-DB-1 -T -h"TABLOCK" -F 2 >> %Log%

echo bcp GMIDATA..GMIST4F1_File_Raw in C:\React\Files\GMIST4F1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S DORT-DB-1 -T -h"TABLOCK" -F 2 >> %Log%
bcp GMIDATA..GMIST4F1_File_Raw in C:\React\Files\GMIST4F1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S DORT-DB-1 -T -h"TABLOCK" -F 2 >> %Log%

echo bcp GMIDATA..GNACMFF1_File_Raw in C:\React\Files\GNACMFF1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GNACMFF1_File.xml -m50 -S DORT-DB-1 -T -h"TABLOCK" -F 2 >> %Log%
bcp GMIDATA..GNACMFF1_File_Raw in C:\React\Files\GNACMFF1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GNACMFF1_File.xml -m50 -S DORT-DB-1 -T -h"TABLOCK" -F 2 >> %Log%

echo bcp GMIDATA..GNACMFF4_File_Raw in C:\React\Files\GNACMFF4%YESTERDAY%.csv -f C:\React\Code\Format_Files\GNACMFF4_File.xml -m50 -S DORT-DB-1 -T -h"TABLOCK" -F 2 >> %Log%
bcp GMIDATA..GNACMFF4_File_Raw in C:\React\Files\GNACMFF4%YESTERDAY%.csv -f C:\React\Code\Format_Files\GNACMFF4_File.xml -m50 -S DORT-DB-1 -T -h"TABLOCK" -F 2 >> %Log%

echo bcp GMIDATA..DOREMAILA3_File_Raw in C:\React\Files\DOREMAILA3%YESTERDAY%.csv -f C:\React\Code\Format_Files\DOREMAILA3_File.xml -m50 -S DORT-DB-1 -T -h"TABLOCK" -F 2 >> %Log%
bcp GMIDATA..DOREMAILA3_File_Raw in C:\React\Files\DOREMAILA3%YESTERDAY%.csv -f C:\React\Code\Format_Files\DOREMAILA3_File.xml -m50 -S DORT-DB-1 -T -h"TABLOCK" -F 2 >> %Log%
REM **************************************************************
REM END - Load Raw Tables
REM **************************************************************

REM **************************************************************
REM START - Load Current Tables
REM **************************************************************
echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIMNYF1_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIMNYF1_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIPOSF1_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIPOSF1_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIST4F1_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIST4F1_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GNACMFF1_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GNACMFF1_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GNACMFF4_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GNACMFF4_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_DOREMAILA3_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_DOREMAILA3_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%
REM **************************************************************
REM END - Load Current Tables
REM **************************************************************

REM **************************************************************
REM START - Load [dbo].[Registered_Representatives_Current]
REM **************************************************************
echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Registered_Representatives_Current]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Registered_Representatives_Current]" -S DORT-DB-1 -b -h-1 >> %Log%
REM **************************************************************
REM END - Load [dbo].[Registered_Representatives_Current]
REM **************************************************************

REM **************************************************************
REM START - Load "SOD" Tables
REM **************************************************************
echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Customer_Master]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Customer_Master]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_SOD_Money]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_SOD_Money]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_SOD_Positions_Detailed]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_SOD_Positions_Detailed]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Contracts_SOD]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Contracts_SOD]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Products]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Products]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Snapshot_SOD]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Snapshot_SOD]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Groups]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Groups]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Group_Members]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Group_Members]" -S DORT-DB-1 -b -h-1 >> %Log%
REM **************************************************************
REM END - Load "SOD" Tables
REM **************************************************************

REM **************************************************************
REM START - Load History Tables
REM **************************************************************
echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_MNYF1_File_History_with_GMIMNYF1_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_MNYF1_File_History_with_GMIMNYF1_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_ST4F1_File_History_with_GMIST4F1_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_ST4F1_File_History_with_GMIST4F1_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Commission_Fees_Volume_History_with_GMIST4F1_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Commission_Fees_Volume_History_with_GMIST4F1_File_Current]" -S DORT-DB-1 -b -h-1 >> %Log%
REM **************************************************************
REM END - Load History Tables
REM **************************************************************

REM **************************************************************
REM START - Run 5_Dump_GMI_Files_Current.bat
REM **************************************************************
CALL C:\React\Code\Batches\5_Dump_GMI_Files_Current
REM **************************************************************
REM END - Run 5_Dump_GMI_Files_Current.bat
REM **************************************************************