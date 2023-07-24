DIR C:\React\Files\20230221_*.txt
PAUSE

REM **************************************************************
REM START - Truncate Raw Tables
REM **************************************************************
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[CQGMNYF1_File_Raw]" -S REACT -b


sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[CQGST4F1_File_Raw]" -S REACT -b

REM **************************************************************
REM END - Truncate Raw Tables
REM **************************************************************

REM **************************************************************
REM START - Load Raw Tables
REM **************************************************************
bcp GMIDATA..CQGMNYF1_File_Raw in C:\React\Files\20230221_CQGMNYF1.txt -f C:\React\Code\Format_Files\CQG_File.FMT -m50 -S REACT -T -h"TABLOCK" -F 2


bcp GMIDATA..CQGST4F1_File_Raw in C:\React\Files\20230221_CQGST4F1.txt -f C:\React\Code\Format_Files\CQG_File.FMT -m50 -S REACT -T -h"TABLOCK" -F 2

REM **************************************************************
REM END - Load Raw Tables
REM **************************************************************

REM **************************************************************
REM START - Load Current Tables
REM **************************************************************
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_CQGMNYF1_File_Current]" -S REACT -b -h-1

sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_CQGST4F1_File_Current]" -S REACT -b -h-1

REM **************************************************************
REM END - Load Current Tables
REM **************************************************************

REM **************************************************************
REM START - Load [dbo].[Current_Information]
REM **************************************************************
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Current_Information_with_CQG_Files]" -S REACT -b -h-1

REM **************************************************************
REM END - Load [dbo].[Current_Information]
REM **************************************************************

REM **************************************************************
REM START - Load History Tables
REM **************************************************************
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_MNYF1_File_History_with_CQGMNYF1_File_Current]" -S REACT -b -h-1

sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_ST4F1_File_History_with_CQGST4F1_File_Current]" -S REACT -b -h-1

REM **************************************************************
REM END - Load History Tables
REM **************************************************************
