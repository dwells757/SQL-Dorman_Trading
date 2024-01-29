DEL C:\React\MNYF1_File_History\Load_MNYF1_File_History_%1.log

SET Log=C:\React\MNYF1_File_History\Load_MNYF1_File_History_%1.log

echo %1 >> %Log%
%1 >> %Log%

REM **************************************************************
REM START - Get GMI Files
REM **************************************************************
echo DEL *.csv >> %Log%
DEL *.csv >> %Log%

echo DEL *.zip >> %Log%
DEL *.zip >> %Log%

echo COPY "\\192.168.89.212\e$\inetpub\ftproot\GMI\Dorman Reports\GMIPOSF1%1.zip" >> %Log%
COPY "\\192.168.89.212\e$\inetpub\ftproot\GMI\Dorman Reports\GMIPOSF1%1.zip" >> %Log%

echo COPY "\\192.168.89.212\e$\inetpub\ftproot\GMI\Dorman Reports\GMIMNYF1%1.zip" >> %Log%
COPY "\\192.168.89.212\e$\inetpub\ftproot\GMI\Dorman Reports\GMIMNYF1%1.zip" >> %Log%

echo "C:\Program Files\7-Zip\7z" e *%1.zip >> %Log%
"C:\Program Files\7-Zip\7z" e *%1.zip >> %Log%

echo DIR C:\React\MNYF1_File_History\*%1*.csv >> %Log%
DIR C:\React\MNYF1_File_History\*%1*.csv >> %Log%
REM **************************************************************
REM END - Get GMI Files
REM **************************************************************

REM **************************************************************
REM START - Truncate Raw Tables
REM **************************************************************
echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIPOSF1_File_Raw]" -S REACT -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIPOSF1_File_Raw]" -S REACT -b >> %Log%

echo sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIMNYF1_File_Raw]" -S REACT -b >> %Log%
sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMIMNYF1_File_Raw]" -S REACT -b >> %Log%
REM **************************************************************
REM END - Truncate Raw Tables
REM **************************************************************

REM **************************************************************
REM START - Load Raw Tables
REM **************************************************************
echo bcp GMIDATA..GMIPOSF1_File_Raw in C:\React\MNYF1_File_History\GMIPOSF1%1.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2 >> %Log%
bcp GMIDATA..GMIPOSF1_File_Raw in C:\React\MNYF1_File_History\GMIPOSF1%1.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2 >> %Log%

echo bcp GMIDATA..GMIMNYF1_File_Raw in C:\React\MNYF1_File_History\GMIMNYF1%1.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2 >> %Log%
bcp GMIDATA..GMIMNYF1_File_Raw in C:\React\MNYF1_File_History\GMIMNYF1%1.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T -h"TABLOCK" -F 2 >> %Log%
REM **************************************************************
REM END - Load Raw Tables
REM **************************************************************

REM **************************************************************
REM START - Load Current Tables
REM **************************************************************
echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIPOSF1_File_Current]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIPOSF1_File_Current]" -S REACT -b -h-1 >> %Log%

echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIMNYF1_File_Current]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_GMIMNYF1_File_Current]" -S REACT -b -h-1 >> %Log%
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
REM START - Load History Tables
REM **************************************************************
echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_MNYF1_File_History_with_GMIMNYF1_File_Current]" -S REACT -b -h-1 >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Load_MNYF1_File_History_with_GMIMNYF1_File_Current]" -S REACT -b -h-1 >> %Log%
REM **************************************************************
REM END - Load History Tables
REM **************************************************************