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
REM START - Risk Report
REM **************************************************************************************************************

echo DEL Risk_Report.csv >> %Log%
DEL Risk_Report.csv >> %Log%

REM NOTE: -E (use trusted connection)
echo sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Generate_Risk_Report_CSV_File]" -S REACT -b -y 0 -o Risk_Report.csv >> %Log%
sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Generate_Risk_Report_CSV_File]" -S REACT -b -y 0 -o Risk_Report.csv >> %Log%

echo dir Risk_Report.csv >> %Log%
dir Risk_Report.csv >> %Log%

echo DEL "\\192.168.89.212\m$\Risk Management\Risk Reports\Risk_Report_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\m$\Risk Management\Risk Reports\Risk_Report_%YESTERDAY%.csv" >> %Log%

echo COPY Risk_Report.csv "\\192.168.89.212\m$\Risk Management\Risk Reports\Risk_Report_%YESTERDAY%.csv" >> %Log%
COPY Risk_Report.csv "\\192.168.89.212\m$\Risk Management\Risk Reports\Risk_Report_%YESTERDAY%.csv" >> %Log%

echo DIR "\\192.168.89.212\m$\Risk Management\Risk Reports\Risk_Report_%YESTERDAY%.csv" >> %Log%
DIR "\\192.168.89.212\m$\Risk Management\Risk Reports\Risk_Report_%YESTERDAY%.csv" >> %Log%

REM **************************************************************************************************************
REM END - Risk Report
REM **************************************************************************************************************

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

REM **************************************************************************************************************
REM START - Registered Rep PRIME
REM **************************************************************************************************************

echo DEL GMIPOSF1_File_Current_PRIME.csv >> %Log%
DEL GMIPOSF1_File_Current_PRIME.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'PRIME'" queryout GMIPOSF1_File_Current_PRIME.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'PRIME'" queryout GMIPOSF1_File_Current_PRIME.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Prime\Position File Updated\PRIME_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Prime\Position File Updated\PRIME_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_PRIME.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Prime\Position File Updated\PRIME_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_PRIME.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Prime\Position File Updated\PRIME_POSF1_File_%YESTERDAY%.csv" >> %Log%

REM **************************************************************************************************************
REM END - Registered Rep PRIME
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep RCM02
REM **************************************************************************************************************

echo DEL GMIMNYF1_File_Current_RCM02.csv >> %Log%
DEL GMIMNYF1_File_Current_RCM02.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIMNYF1_File_Current_RCM02.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIMNYF1_File_Current_RCM02.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_RCM02.csv >> %Log%
DEL GMIPOSF1_File_Current_RCM02.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIPOSF1_File_Current_RCM02.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIPOSF1_File_Current_RCM02.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_RCM02.csv >> %Log%
DEL GMIST4F1_File_Current_RCM02.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIST4F1_File_Current_RCM02.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIST4F1_File_Current_RCM02.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_RCM02.csv >> %Log%
DEL DTN_File_Current_RCM02.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'RCM02'" queryout DTN_File_Current_RCM02.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'RCM02'" queryout DTN_File_Current_RCM02.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Ultimus Fund Sol\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_RCM02.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Equity Armor\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%


REM **************************************************************************************************************
REM END - Registered Rep RCM02
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep Group Trade_Pro_Futures
REM **************************************************************************************************************

echo DEL GMIMNYF1_File_Current_Trade_Pro_Futures.csv >> %Log%
DEL GMIMNYF1_File_Current_Trade_Pro_Futures.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIMNYF1_File_Current_Trade_Pro_Futures.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIMNYF1_File_Current_Trade_Pro_Futures.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_Trade_Pro_Futures.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_Trade_Pro_Futures.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_Trade_Pro_Futures.csv >> %Log%
DEL GMIPOSF1_File_Current_Trade_Pro_Futures.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIPOSF1_File_Current_Trade_Pro_Futures.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIPOSF1_File_Current_Trade_Pro_Futures.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_Trade_Pro_Futures.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_Trade_Pro_Futures.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_Trade_Pro_Futures.csv >> %Log%
DEL GMIST4F1_File_Current_Trade_Pro_Futures.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIST4F1_File_Current_Trade_Pro_Futures.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIST4F1_File_Current_Trade_Pro_Futures.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_Trade_Pro_Futures.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_Trade_Pro_Futures.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_Trade_Pro_Futures.csv >> %Log%
DEL DTN_File_Current_Trade_Pro_Futures.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Generate_DTN_File_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout DTN_File_Current_Trade_Pro_Futures.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Generate_DTN_File_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout DTN_File_Current_Trade_Pro_Futures.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_Trade_Pro_Futures.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_Trade_Pro_Futures.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GNACMFF1_File_Current_Trade_Pro_Futures.csv >> %Log%
DEL GNACMFF1_File_Current_Trade_Pro_Futures.csv >> %Log%

echo sqlcmd -E -Q"[GMIDATA].[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" -S REACT -b -h-1 -o GNACMFF1_File_Current_Trade_Pro_Futures.csv >> %Log%
sqlcmd -E -Q"[GMIDATA].[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" -S REACT -b -h-1 -o GNACMFF1_File_Current_Trade_Pro_Futures.csv >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_CMFF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_CMFF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GNACMFF1_File_Current_Trade_Pro_Futures.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_CMFF1_File_%YESTERDAY%.csv" >> %Log%
COPY GNACMFF1_File_Current_Trade_Pro_Futures.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_CMFF1_File_%YESTERDAY%.csv" >> %Log%

REM **************************************************************************************************************
REM END - Registered Rep Group Trade_Pro_Futures
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep TB001
REM **************************************************************************************************************

echo DEL GMIMNYF1_File_Current_TB001.csv >> %Log%
DEL GMIMNYF1_File_Current_TB001.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'TB001'" queryout GMIMNYF1_File_Current_TB001.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'TB001'" queryout GMIMNYF1_File_Current_TB001.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_TB001.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_TB001.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_TB001.csv >> %Log%
DEL GMIPOSF1_File_Current_TB001.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'TB001'" queryout GMIPOSF1_File_Current_TB001.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'TB001'" queryout GMIPOSF1_File_Current_TB001.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_TB001.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_TB001.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_TB001.csv >> %Log%
DEL GMIST4F1_File_Current_TB001.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'TB001'" queryout GMIST4F1_File_Current_TB001.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'TB001'" queryout GMIST4F1_File_Current_TB001.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_TB001.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_TB001.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_TB001.csv >> %Log%
DEL DTN_File_Current_TB001.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'TB001'" queryout DTN_File_Current_TB001.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'TB001'" queryout DTN_File_Current_TB001.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_TB001.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_TB001.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GNACMFF1_File_Current_TB001.csv >> %Log%
DEL GNACMFF1_File_Current_TB001.csv >> %Log%

echo sqlcmd -E -Q"[GMIDATA].[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep] 'TB001'" -S REACT -b -h-1 -o GNACMFF1_File_Current_TB001.csv >> %Log%
sqlcmd -E -Q"[GMIDATA].[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep] 'TB001'" -S REACT -b -h-1 -o GNACMFF1_File_Current_TB001.csv >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_CMFF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_CMFF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GNACMFF1_File_Current_TB001.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_CMFF1_File_%YESTERDAY%.csv" >> %Log%
COPY GNACMFF1_File_Current_TB001.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Tradier Futures\Tradier\TB001_CMFF1_File_%YESTERDAY%.csv" >> %Log%

REM **************************************************************************************************************
REM END - Registered Rep TB001
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep STAN2
REM **************************************************************************************************************

echo DEL GMIMNYF1_File_Current_STAN2.csv >> %Log%
DEL GMIMNYF1_File_Current_STAN2.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIMNYF1_File_Current_STAN2.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIMNYF1_File_Current_STAN2.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_MNY_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_MNY_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_STAN2.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_MNY_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_STAN2.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_MNY_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_STAN2.csv >> %Log%
DEL GMIPOSF1_File_Current_STAN2.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIPOSF1_File_Current_STAN2.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIPOSF1_File_Current_STAN2.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_POS_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_POS_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_STAN2.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_POS_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_STAN2.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_POS_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_STAN2.csv >> %Log%
DEL GMIST4F1_File_Current_STAN2.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIST4F1_File_Current_STAN2.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIST4F1_File_Current_STAN2.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_ST4_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_ST4_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_STAN2.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_ST4_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_STAN2.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_ST4_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_STAN2.csv >> %Log%
DEL DTN_File_Current_STAN2.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'STAN2'" queryout DTN_File_Current_STAN2.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'STAN2'" queryout DTN_File_Current_STAN2.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_DTN_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_DTN_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_STAN2.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_DTN_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_STAN2.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Lighthouse Commodities\STAN2_DTN_File_%YESTERDAY%.csv" >> %Log%

REM **************************************************************************************************************
REM END - Registered Rep STAN2
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Related Account D / 153 / AA085
REM **************************************************************************************************************

echo DEL GMIMNYF1_File_Current_153_AA085.csv >> %Log%
DEL GMIMNYF1_File_Current_153_AA085.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIMNYF1_File_Current_153_AA085.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIMNYF1_File_Current_153_AA085.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_MNY_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_MNY_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_153_AA085.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_MNY_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_153_AA085.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_MNY_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_153_AA085.csv >> %Log%
DEL GMIPOSF1_File_Current_153_AA085.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIPOSF1_File_Current_153_AA085.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIPOSF1_File_Current_153_AA085.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_POS_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_POS_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_153_AA085.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_POS_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_153_AA085.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_POS_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_153_AA085.csv >> %Log%
DEL GMIST4F1_File_Current_153_AA085.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIST4F1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIST4F1_File_Current_153_AA085.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIST4F1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIST4F1_File_Current_153_AA085.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_ST4_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_ST4_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_153_AA085.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_ST4_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_153_AA085.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_ST4_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_153_AA085.csv >> %Log%
DEL DTN_File_Current_153_AA085.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Generate_DTN_File_by_Related_Account] 'D', '153','AA085'" queryout DTN_File_Current_153_AA085.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Generate_DTN_File_by_Related_Account] 'D', '153','AA085'" queryout DTN_File_Current_153_AA085.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_DTN_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_DTN_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_153_AA085.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_DTN_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_153_AA085.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Alpha Optimization\153_AA085_DTN_File_%YESTERDAY%.csv" >> %Log%

REM **************************************************************************************************************
REM END - Related Account D / 153 / AA085
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Related Account D / 153 / 47614
REM **************************************************************************************************************

echo DEL GMIMNYF1_File_Current_153_47614.csv >> %Log%
DEL GMIMNYF1_File_Current_153_47614.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIMNYF1_File_Current_153_47614.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIMNYF1_File_Current_153_47614.csv -f C:\React\Code\Format_Files\GMIMNYF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_MNY_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_MNY_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_153_47614.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_MNY_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_153_47614.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_MNY_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_153_47614.csv >> %Log%
DEL GMIPOSF1_File_Current_153_47614.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIPOSF1_File_Current_153_47614.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIPOSF1_File_Current_153_47614.csv -f C:\React\Code\Format_Files\GMIPOSF1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_POS_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_POS_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_153_47614.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_POS_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_153_47614.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_POS_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_153_47614.csv >> %Log%
DEL GMIST4F1_File_Current_153_47614.csv >> %Log%

echo bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIST4F1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIST4F1_File_Current_153_47614.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%
bcp "EXEC [GMIDATA].[dbo].[PROC_Dump_GMIST4F1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIST4F1_File_Current_153_47614.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%

echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_ST4_File_%YESTERDAY%.csv" >> %Log%
DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_ST4_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_153_47614.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_ST4_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_153_47614.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_ST4_File_%YESTERDAY%.csv" >> %Log%

REM echo DEL DTN_File_Current_153_47614.csv >> %Log%
REM DEL DTN_File_Current_153_47614.csv >> %Log%

REM echo bcp "EXEC [GMIDATA].[dbo].[PROC_Generate_DTN_File_by_Related_Account] 'D', '153','47614'" queryout DTN_File_Current_153_47614.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%
REM bcp "EXEC [GMIDATA].[dbo].[PROC_Generate_DTN_File_by_Related_Account] 'D', '153','47614'" queryout DTN_File_Current_153_47614.csv -f C:\React\Code\Format_Files\GMIST4F1_File.xml -m50 -S REACT -T >> %Log%

REM echo DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_DTN_File_%YESTERDAY%.csv" >> %Log%
REM DEL "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_DTN_File_%YESTERDAY%.csv" >> %Log%

REM echo COPY DTN_File_Current_153_47614.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_DTN_File_%YESTERDAY%.csv" >> %Log%
REM COPY DTN_File_Current_153_47614.csv "\\192.168.89.212\e$\inetpub\ftproot\GMI\Pineberry\GMI Files\153_47614_DTN_File_%YESTERDAY%.csv" >> %Log%

REM **************************************************************************************************************
REM END - Related Account D / 153 / 47614
REM **************************************************************************************************************