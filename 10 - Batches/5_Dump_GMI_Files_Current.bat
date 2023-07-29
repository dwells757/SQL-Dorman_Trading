DEL C:\React\Test_Files\5_Dump_GMI_Files_Current.log

SET Log=C:\React\Test_Files\5_Dump_GMI_Files_Current.log

echo CD \React\Test_Files >> %Log%
CD \React\Test_Files >> %Log%

REM **************************************************************
REM START - Generate %YESTERDAY%
REM **************************************************************
FOR /F "usebackq tokens=*" %%t IN (`powershell -NoProfile -Command "(Get-Date).AddDays(-1).ToString('yyyyMMdd')"`) DO (SET "YESTERDAY=%%t")

echo Yesterday: >> %Log%
echo %YESTERDAY% >> %Log%

REM **************************************************************
REM END - Generate %YESTERDAY%
REM **************************************************************

REM **************************************************************************************************************
REM START - Registered Rep OPC01
REM **************************************************************************************************************

echo DEL GMIMNYF1_File_Current_OPC01.csv >> %Log%
DEL GMIMNYF1_File_Current_OPC01.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIMNYF1_File_Current_OPC01.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIMNYF1_File_Current_OPC01.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_OPC01.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_OPC01.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_OPC01.csv >> %Log%
DEL GMIPOSF1_File_Current_OPC01.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIPOSF1_File_Current_OPC01.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIPOSF1_File_Current_OPC01.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_OPC01.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_OPC01.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_OPC01.csv >> %Log%
DEL GMIST4F1_File_Current_OPC01.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIST4F1_File_Current_OPC01.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIST4F1_File_Current_OPC01.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_OPC01.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_OPC01.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_OPC01.csv >> %Log%
DEL DTN_File_Current_OPC01.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'OPC01'" queryout DTN_File_Current_OPC01.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'OPC01'" queryout DTN_File_Current_OPC01.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_OPC01.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_OPC01.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\OPC Test\OPC01_DTNF1_File_%YESTERDAY%.csv" >> %Log%

REM **************************************************************************************************************
REM END - Registered Rep OPC01
REM **************************************************************************************************************