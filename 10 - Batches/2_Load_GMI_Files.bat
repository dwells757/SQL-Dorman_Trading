DEL C:\React\Files\2_Load_GMI_Files.log

SET Log=C:\React\Files\2_Load_GMI_Files.log

echo CD \React\Files >> %Log%
CD \React\Files >> %Log%

REM **************************************************************
REM START - Generate %YESTERDAY%
REM **************************************************************
FOR /F "usebackq tokens=*" %%t IN (`powershell -NoProfile -Command "(Get-Date).AddDays(-1).ToString('yyyyMMdd')"`) DO (SET "YESTERDAY=%%t")

echo Yesterday: >> %Log%
echo %YESTERDAY% >> %Log%
REM **************************************************************
REM END - Generate %YESTERDAY%
REM **************************************************************

REM **************************************************************
REM START - Get GMI Files
REM **************************************************************
echo DEL *.csv >> %Log%
DEL *.csv >> %Log%

echo DEL *.zip >> %Log%
DEL *.zip >> %Log%

echo COPY "\\192.168.89.212\e$\inetpub\ftproot\GMI\Dorman Reports\*%YESTERDAY%.zip" >> %Log%
COPY "\\192.168.89.212\e$\inetpub\ftproot\GMI\Dorman Reports\*%YESTERDAY%.zip" >> %Log%

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
echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIMNYF1_File_Raw]" -S REACT -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIMNYF1_File_Raw]" -S REACT -b >> %Log%

echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIPOSF1_File_Raw]" -S REACT -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIPOSF1_File_Raw]" -S REACT -b >> %Log%

echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIST4F1_File_Raw]" -S REACT -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIST4F1_File_Raw]" -S REACT -b >> %Log%

echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GNACMFF1_File_Raw]" -S REACT -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GNACMFF1_File_Raw]" -S REACT -b >> %Log%
REM **************************************************************
REM END - Truncate Raw Tables
REM **************************************************************

REM **************************************************************
REM START - Load Raw Tables
REM **************************************************************
echo bcp GMIDATA..GMIMNYF1_File_Raw in C:\React\Files\GMIMNYF1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2 >> %Log%
bcp GMIDATA..GMIMNYF1_File_Raw in C:\React\Files\GMIMNYF1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2 >> %Log%

echo bcp GMIDATA..GMIPOSF1_File_Raw in C:\React\Files\GMIPOSF1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2 >> %Log%
bcp GMIDATA..GMIPOSF1_File_Raw in C:\React\Files\GMIPOSF1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2 >> %Log%

echo bcp GMIDATA..GMIST4F1_File_Raw in C:\React\Files\GMIST4F1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2 >> %Log%
bcp GMIDATA..GMIST4F1_File_Raw in C:\React\Files\GMIST4F1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2 >> %Log%

echo bcp GMIDATA..GNACMFF1_File_Raw in C:\React\Files\GNACMFF1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GNACMFF1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2 >> %Log%
bcp GMIDATA..GNACMFF1_File_Raw in C:\React\Files\GNACMFF1%YESTERDAY%.csv -f C:\React\Code\Format_Files\GNACMFF1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2 >> %Log%
REM **************************************************************
REM END - Load Raw Tables
REM **************************************************************

REM **************************************************************
REM START - Load Current Tables
REM **************************************************************
echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIMNYF1_File_Current]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIMNYF1_File_Current]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIPOSF1_File_Current]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIPOSF1_File_Current]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIST4F1_File_Current]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIST4F1_File_Current]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GNACMFF1_File_Current]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GNACMFF1_File_Current]" -S REACT -b -h-1 >> %Log%
REM **************************************************************
REM END - Load Current Tables
REM **************************************************************

REM **************************************************************
REM START - Load [dbo].[Current_Information]
REM **************************************************************
echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Update_Current_Information_with_GMIPOSF1]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Update_Current_Information_with_GMIPOSF1]" -S REACT -b -h-1 >> %Log%
REM **************************************************************
REM END - Load [dbo].[Current_Information]
REM **************************************************************

REM **************************************************************
REM START - Load "SOD" Tables
REM **************************************************************
echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Customer_Master]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Customer_Master]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_SOD_Money]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_SOD_Money]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_SOD_Positions_Detailed]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_SOD_Positions_Detailed]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Contracts_SOD]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Contracts_SOD]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Products]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Products]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Snapshot_SOD]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMI_Snapshot_SOD]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Groups]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Groups]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Group_Members]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_Group_Members]" -S REACT -b -h-1 >> %Log%
REM **************************************************************
REM END - Load "SOD" Tables
REM **************************************************************

REM **************************************************************
REM START - Load History Tables
REM **************************************************************
echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_MNYF1_File_History_with_GMIMNYF1_File_Current]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_MNYF1_File_History_with_GMIMNYF1_File_Current]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_ST4F1_File_History_with_GMIST4F1_File_Current]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_ST4F1_File_History_with_GMIST4F1_File_Current]" -S REACT -b -h-1 >> %Log%
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