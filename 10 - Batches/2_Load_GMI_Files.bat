CD \React\Files
PAUSE

DEL *.csv
PAUSE
DEL *.zip
PAUSE

COPY "\\192.168.89.212\e$\inetpub\ftproot\GMI\Dorman Reports\*20230721.zip"
PAUSE

"C:\Program Files\7-Zip\7z" e *20230721.zip
PAUSE

DIR C:\React\Files\*20230721*.csv
PAUSE

REM **************************************************************
REM START - Truncate Raw Tables
REM **************************************************************
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIMNYF1_File_Raw]" -S REACT -b

sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIPOSF1_File_Raw]" -S REACT -b

sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIST4F1_File_Raw]" -S REACT -b

sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GNACMFF1_File_Raw]" -S REACT -b
REM **************************************************************
REM END - Truncate Raw Tables
REM **************************************************************

REM **************************************************************
REM START - Load Raw Tables
REM **************************************************************
bcp GMIDATA..GMIMNYF1_File_Raw in C:\React\Files\GMIMNYF120230721.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2

bcp GMIDATA..GMIPOSF1_File_Raw in C:\React\Files\GMIPOSF120230721.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2

bcp GMIDATA..GMIST4F1_File_Raw in C:\React\Files\GMIST4F120230721.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2

bcp GMIDATA..GNACMFF1_File_Raw in C:\React\Files\GNACMFF120230721.csv -f C:\React\Code\Format_Files\GNACMFF1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2
REM **************************************************************
REM END - Load Raw Tables
REM **************************************************************

REM **************************************************************
REM START - Load Current Tables
REM **************************************************************
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIMNYF1_File_Current]" -S REACT -b -h-1

sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIPOSF1_File_Current]" -S REACT -b -h-1

sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIST4F1_File_Current]" -S REACT -b -h-1

sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GNACMFF1_File_Current]" -S REACT -b -h-1
REM **************************************************************
REM END - Load Current Tables
REM **************************************************************

REM **************************************************************
REM START - Load [dbo].[Current_Information]
REM **************************************************************
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Current_Information_with_GMIPOSF1]" -S REACT -b -h-1
REM **************************************************************
REM END - Load [dbo].[Current_Information]
REM **************************************************************

REM **************************************************************
REM START - Load "SOD" Tables
REM **************************************************************
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Customer_Master]" -S REACT -b -h-1

sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_SOD_Money]" -S REACT -b -h-1

sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_SOD_Positions_Detailed]" -S REACT -b -h-1

sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Contracts_SOD]" -S REACT -b -h-1

sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Products]" -S REACT -b -h-1

sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Snapshot_SOD]" -S REACT -b -h-1
REM **************************************************************
REM END - Load "SOD" Tables
REM **************************************************************

REM **************************************************************
REM START - Load History Tables
REM **************************************************************
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_MNYF1_File_History_with_GMIMNYF1_File_Current]" -S REACT -b -h-1

sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_ST4F1_File_History_with_GMIST4F1_File_Current]" -S REACT -b -h-1
REM **************************************************************
REM END - Load History Tables
REM **************************************************************
