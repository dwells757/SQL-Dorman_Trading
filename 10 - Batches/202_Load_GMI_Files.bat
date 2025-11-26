REM (DWH 11/26/25)DEL C:\HCC\Files\2_Load_GMI_Files.log

REM (DWH 11/26/25)SET Log=C:\HCC\Files\2_Load_GMI_Files.log

CD \HCC\Files
PAUSE

REM **************************************************************
REM START - Generate %YESTERDAY%
REM **************************************************************
REM (DWH 11/26/25)FOR /F "usebackq tokens=*" %%t IN (`powershell -NoProfile -Command "(Get-Date).AddDays(-1).ToString('yyyyMMdd')"`) DO (SET "YESTERDAY=%%t")
FOR /F "usebackq tokens=*" %%t IN (`powershell -NoProfile -Command "(Get-Date).AddDays(-2).ToString('yyyyMMdd')"`) DO (SET "YESTERDAY=%%t")
REM FOR /F "usebackq tokens=*" %%t IN (`powershell -NoProfile -Command "(Get-Date).AddDays(-10).ToString('yyyyMMdd')"`) DO (SET "YESTERDAY=%%t")

echo Yesterday:
echo %YESTERDAY%
PAUSE
REM **************************************************************
REM END - Generate %YESTERDAY%
REM **************************************************************

REM **************************************************************
REM START - Generate Current_Processing_Date.txt
REM **************************************************************

DEL Current_Processing_Date.txt
PAUSE

echo %YESTERDAY% > Current_Processing_Date.txt
PAUSE

DIR Current_Processing_Date.txt
PAUSE

REM **************************************************************
REM END - Generate Current_Processing_Date.txt
REM **************************************************************

REM **************************************************************
REM START - Load [dbo].[Current_Processing_Date]
REM **************************************************************

sqlcmd -Q"TRUNCATE TABLE [dbo].[Current_Processing_Date]" -d gmidata -S ncusprdsql01.database.windows.net -b -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
bcp [dbo].[Current_Processing_Date] in C:\HCC\Files\Current_Processing_Date.txt -f C:\HCC\Code\Format_Files\Current_Processing_Date.FMT -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -h"TABLOCK"
PAUSE
REM **************************************************************
REM END - Load [dbo].[Current_Processing_Date]
REM **************************************************************

REM **************************************************************
REM START - Load [dbo].[Current_Information]
REM **************************************************************
sqlcmd -Q"EXEC [dbo].[PROC_Update_Current_Information_with_Current_Processing_Date]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
REM **************************************************************
REM END - Load [dbo].[Current_Information]
REM **************************************************************

REM **************************************************************
REM START - Get GMI Files
REM **************************************************************
DEL *.csv
PAUSE

DEL *.zip
PAUSE

COPY "N:\Dorman Reports\*%YESTERDAY%.zip"
PAUSE

DIR *.zip
PAUSE

"C:\Program Files\7-Zip\7z" e *%YESTERDAY%.zip
PAUSE

DIR *%YESTERDAY%*.csv
PAUSE
REM **************************************************************
REM END - Get GMI Files
REM **************************************************************

REM **************************************************************
REM START - Truncate Raw Tables
REM **************************************************************
sqlcmd -Q"TRUNCATE TABLE [dbo].[GMIMNYF1_File_Raw]" -d gmidata -S ncusprdsql01.database.windows.net -b -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
sqlcmd -Q"TRUNCATE TABLE [dbo].[GMIPOSF1_File_Raw]" -d gmidata -S ncusprdsql01.database.windows.net -b -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
sqlcmd -Q"TRUNCATE TABLE [dbo].[GMIST4F1_File_Raw]" -d gmidata -S ncusprdsql01.database.windows.net -b -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
sqlcmd -Q"TRUNCATE TABLE [dbo].[GNACMFF1_File_Raw]" -d gmidata -S ncusprdsql01.database.windows.net -b -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
sqlcmd -Q"TRUNCATE TABLE [dbo].[GNACMFF4_File_Raw]" -d gmidata -S ncusprdsql01.database.windows.net -b -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
sqlcmd -Q"TRUNCATE TABLE [dbo].[DOREMAILA3_File_Raw]" -d gmidata -S ncusprdsql01.database.windows.net -b -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
REM **************************************************************
REM END - Truncate Raw Tables
REM **************************************************************

REM **************************************************************
REM START - Load Raw Tables
REM **************************************************************
bcp [dbo].[GMIMNYF1_File_Raw] in C:\HCC\Files\GMIMNYF1%YESTERDAY%.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -h"TABLOCK" -F 2
PAUSE
bcp [dbo].[GMIPOSF1_File_Raw] in C:\HCC\Files\GMIPOSF1%YESTERDAY%.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -h"TABLOCK" -F 2
PAUSE
bcp [dbo].[GMIST4F1_File_Raw] in C:\HCC\Files\GMIST4F1%YESTERDAY%.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -h"TABLOCK" -F 2
PAUSE
bcp [dbo].[GNACMFF1_File_Raw] in C:\HCC\Files\GNACMFF1%YESTERDAY%.csv -f C:\HCC\Code\Format_Files\GNACMFF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -h"TABLOCK" -F 2
PAUSE
bcp [dbo].[GNACMFF4_File_Raw] in C:\HCC\Files\GNACMFF4%YESTERDAY%.csv -f C:\HCC\Code\Format_Files\GNACMFF4_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -h"TABLOCK" -F 2
PAUSE
bcp [dbo].[DOREMAILA3_File_Raw] in C:\HCC\Files\DOREMAILA3%YESTERDAY%.csv -f C:\HCC\Code\Format_Files\DOREMAILA3_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -h"TABLOCK" -F 2
PAUSE
REM **************************************************************
REM END - Load Raw Tables
REM **************************************************************

REM **************************************************************
REM START - Load Current Tables
REM **************************************************************
sqlcmd -Q"EXEC [dbo].[PROC_Load_GMIMNYF1_File_Current]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_GMIPOSF1_File_Current]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_GMIST4F1_File_Current]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_GNACMFF1_File_Current]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_GNACMFF4_File_Current]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_DOREMAILA3_File_Current]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
REM **************************************************************
REM END - Load Current Tables
REM **************************************************************

REM **************************************************************
REM START - Load [dbo].[Registered_Representatives_Current]
REM **************************************************************
sqlcmd -Q"EXEC [dbo].[PROC_Load_Registered_Representatives_Current]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
REM **************************************************************
REM END - Load [dbo].[Registered_Representatives_Current]
REM **************************************************************

REM **************************************************************
REM START - Load "SOD" Tables
REM **************************************************************
sqlcmd -Q"EXEC [dbo].[PROC_Load_GMI_Customer_Master]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_GMI_SOD_Money]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_GMI_SOD_Positions_Detailed]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_GMI_Contracts_SOD]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_GMI_Products]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_GMI_Snapshot_SOD]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_Groups]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_Group_Members]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
REM **************************************************************
REM END - Load "SOD" Tables
REM **************************************************************

REM **************************************************************
REM START - Load History Tables
REM **************************************************************
sqlcmd -Q"EXEC [dbo].[PROC_Load_MNYF1_File_History_with_GMIMNYF1_File_Current]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_ST4F1_File_History_with_GMIST4F1_File_Current]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_Commission_Fees_Volume_History_with_GMIST4F1_File_Current]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
sqlcmd -Q"EXEC [dbo].[PROC_Load_Commission_Fees_Volume_History_2]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE
REM **************************************************************
REM END - Load History Tables
REM **************************************************************

REM **************************************************************
REM START - Run 5_Dump_GMI_Files_Current.bat
REM **************************************************************
REM CALL C:\React\Code\Batches\5_Dump_GMI_Files_Current
REM **************************************************************
REM END - Run 5_Dump_GMI_Files_Current.bat
REM **************************************************************