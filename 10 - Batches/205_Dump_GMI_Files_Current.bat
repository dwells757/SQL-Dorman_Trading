DEL C:\HCC\Test_Files\205_Dump_GMI_Files_Current.log

SET Log=C:\HCC\Test_Files\205_Dump_GMI_Files_Current.log

echo CD \HCC\Test_Files >> %Log%
CD \HCC\Test_Files >> %Log%

REM **************************************************************
REM START - Generate %YESTERDAY%
REM **************************************************************
FOR /F "usebackq tokens=*" %%t IN (`powershell -NoProfile -Command "(Get-Date).AddDays(-1).ToString('yyyyMMdd')"`) DO (SET "YESTERDAY=%%t")
REM FOR /F "usebackq tokens=*" %%t IN (`powershell -NoProfile -Command "(Get-Date).AddDays(-2).ToString('yyyyMMdd')"`) DO (SET "YESTERDAY=%%t")

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

echo sqlcmd -Q"EXEC [dbo].[PROC_Generate_Risk_Report_CSV_File]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -y 0 -o Risk_Report.csv >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Generate_Risk_Report_CSV_File]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -y 0 -o Risk_Report.csv >> %Log%

echo dir Risk_Report.csv >> %Log%
dir Risk_Report.csv >> %Log%

echo DEL "\\dormanfile.file.core.windows.net\dorman-operations\Risk Management\Risk Reports\Risk_Report_%YESTERDAY%.csv" >> %Log%
DEL "\\dormanfile.file.core.windows.net\dorman-operations\Risk Management\Risk Reports\Risk_Report_%YESTERDAY%.csv" >> %Log%

echo COPY Risk_Report.csv "\\dormanfile.file.core.windows.net\dorman-operations\Risk Management\Risk Reports\Risk_Report_%YESTERDAY%.csv" >> %Log%
COPY Risk_Report.csv "\\dormanfile.file.core.windows.net\dorman-operations\Risk Management\Risk Reports\Risk_Report_%YESTERDAY%.csv" >> %Log%

echo DIR "\\dormanfile.file.core.windows.net\dorman-operations\Risk Management\Risk Reports\Risk_Report_%YESTERDAY%.csv" >> %Log%
DIR "\\dormanfile.file.core.windows.net\dorman-operations\Risk Management\Risk Reports\Risk_Report_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Risk Report
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep OPC01
REM **************************************************************************************************************

echo DEL GMIMNYF1_File_Current_OPC01.csv >> %Log%
DEL GMIMNYF1_File_Current_OPC01.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIMNYF1_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIMNYF1_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_OPC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_OPC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_OPC01.csv >> %Log%
DEL GMIPOSF1_File_Current_OPC01.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIPOSF1_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIPOSF1_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_OPC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_OPC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_OPC01.csv >> %Log%
DEL GMIST4F1_File_Current_OPC01.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIST4F1_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIST4F1_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_OPC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_OPC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_OPC01.csv >> %Log%
DEL DTN_File_Current_OPC01.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'OPC01'" queryout DTN_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'OPC01'" queryout DTN_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_OPC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_OPC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\OPC Test\OPC01_DTNF1_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Registered Rep OPC01
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep PRIME
REM **************************************************************************************************************
echo DEL GMIPOSF1_File_Current_PRIME.csv >> %Log%
DEL GMIPOSF1_File_Current_PRIME.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'PRIME'" queryout GMIPOSF1_File_Current_PRIME.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'PRIME'" queryout GMIPOSF1_File_Current_PRIME.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Prime\Position File Updated\PRIME_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Prime\Position File Updated\PRIME_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_PRIME.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Prime\Position File Updated\PRIME_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_PRIME.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Prime\Position File Updated\PRIME_POSF1_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Registered Rep PRIME
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep RCM02
REM **************************************************************************************************************
echo DEL GMIMNYF1_File_Current_RCM02.csv >> %Log%
DEL GMIMNYF1_File_Current_RCM02.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIMNYF1_File_Current_RCM02.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIMNYF1_File_Current_RCM02.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_RCM02.csv >> %Log%
DEL GMIPOSF1_File_Current_RCM02.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIPOSF1_File_Current_RCM02.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIPOSF1_File_Current_RCM02.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_RCM02.csv >> %Log%
DEL GMIST4F1_File_Current_RCM02.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIST4F1_File_Current_RCM02.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIST4F1_File_Current_RCM02.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_RCM02.csv >> %Log%
DEL DTN_File_Current_RCM02.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'RCM02'" queryout DTN_File_Current_RCM02.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'RCM02'" queryout DTN_File_Current_RCM02.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Ultimus Fund Sol\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_RCM02.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Equity Armor\RCM02_DTNF1_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Registered Rep RCM02
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep Group Trade_Pro_Futures
REM **************************************************************************************************************
echo DEL GMIMNYF1_File_Current_Trade_Pro_Futures.csv >> %Log%
DEL GMIMNYF1_File_Current_Trade_Pro_Futures.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIMNYF1_File_Current_Trade_Pro_Futures.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIMNYF1_File_Current_Trade_Pro_Futures.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_Trade_Pro_Futures.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_Trade_Pro_Futures.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_Trade_Pro_Futures.csv >> %Log%
DEL GMIPOSF1_File_Current_Trade_Pro_Futures.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIPOSF1_File_Current_Trade_Pro_Futures.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIPOSF1_File_Current_Trade_Pro_Futures.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_Trade_Pro_Futures.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_Trade_Pro_Futures.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_Trade_Pro_Futures.csv >> %Log%
DEL GMIST4F1_File_Current_Trade_Pro_Futures.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIST4F1_File_Current_Trade_Pro_Futures.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIST4F1_File_Current_Trade_Pro_Futures.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_Trade_Pro_Futures.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_Trade_Pro_Futures.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_Trade_Pro_Futures.csv >> %Log%
DEL DTN_File_Current_Trade_Pro_Futures.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout DTN_File_Current_Trade_Pro_Futures.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout DTN_File_Current_Trade_Pro_Futures.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_Trade_Pro_Futures.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_Trade_Pro_Futures.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GNACMFF1_File_Current_Trade_Pro_Futures.csv >> %Log%
DEL GNACMFF1_File_Current_Trade_Pro_Futures.csv >> %Log%

echo sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_Group_2] 'Trade_Pro_Futures'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o GNACMFF1_File_Current_Trade_Pro_Futures.csv >> %Log%
sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_Group_2] 'Trade_Pro_Futures'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o GNACMFF1_File_Current_Trade_Pro_Futures.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_CMFF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_CMFF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GNACMFF1_File_Current_Trade_Pro_Futures.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_CMFF1_File_%YESTERDAY%.csv" >> %Log%
COPY GNACMFF1_File_Current_Trade_Pro_Futures.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_CMFF1_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Registered Rep Group Trade_Pro_Futures
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep Group Tradier
REM **************************************************************************************************************
echo DEL GMIMNYF1_File_Current_Tradier.csv >> %Log%
DEL GMIMNYF1_File_Current_Tradier.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep_Group] 'Tradier'" queryout GMIMNYF1_File_Current_Tradier.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep_Group] 'Tradier'" queryout GMIMNYF1_File_Current_Tradier.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_Tradier.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_Tradier.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_Tradier.csv >> %Log%
DEL GMIPOSF1_File_Current_Tradier.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep_Group] 'Tradier'" queryout GMIPOSF1_File_Current_Tradier.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep_Group] 'Tradier'" queryout GMIPOSF1_File_Current_Tradier.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_Tradier.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_Tradier.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_Tradier.csv >> %Log%
DEL GMIST4F1_File_Current_Tradier.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep_Group] 'Tradier'" queryout GMIST4F1_File_Current_Tradier.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep_Group] 'Tradier'" queryout GMIST4F1_File_Current_Tradier.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_Tradier.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_Tradier.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_Tradier.csv >> %Log%
DEL DTN_File_Current_Tradier.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep_Group] 'Tradier'" queryout DTN_File_Current_Tradier.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep_Group] 'Tradier'" queryout DTN_File_Current_Tradier.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_Tradier.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_Tradier.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GNACMFF1_File_Current_Tradier.csv >> %Log%
DEL GNACMFF1_File_Current_Tradier.csv >> %Log%

echo sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_Group_2] 'Tradier'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o GNACMFF1_File_Current_Tradier.csv >> %Log%
sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_Group_2] 'Tradier'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o GNACMFF1_File_Current_Tradier.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_CMFF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_CMFF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GNACMFF1_File_Current_Tradier.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_CMFF1_File_%YESTERDAY%.csv" >> %Log%
COPY GNACMFF1_File_Current_Tradier.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Tradier Futures\Tradier\Tradier_CMFF1_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Registered Rep Group Tradier
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep STAN2
REM **************************************************************************************************************
echo DEL GMIMNYF1_File_Current_STAN2.csv >> %Log%
DEL GMIMNYF1_File_Current_STAN2.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIMNYF1_File_Current_STAN2.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIMNYF1_File_Current_STAN2.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_MNY_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_MNY_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_STAN2.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_MNY_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_STAN2.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_MNY_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_STAN2.csv >> %Log%
DEL GMIPOSF1_File_Current_STAN2.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIPOSF1_File_Current_STAN2.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIPOSF1_File_Current_STAN2.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_POS_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_POS_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_STAN2.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_POS_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_STAN2.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_POS_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_STAN2.csv >> %Log%
DEL GMIST4F1_File_Current_STAN2.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIST4F1_File_Current_STAN2.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIST4F1_File_Current_STAN2.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_ST4_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_ST4_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_STAN2.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_ST4_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_STAN2.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_ST4_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_STAN2.csv >> %Log%
DEL DTN_File_Current_STAN2.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'STAN2'" queryout DTN_File_Current_STAN2.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'STAN2'" queryout DTN_File_Current_STAN2.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_DTN_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_DTN_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_STAN2.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_DTN_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_STAN2.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Lighthouse Commodities\STAN2_DTN_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Registered Rep STAN2
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Related Account D / 153 / AA085
REM **************************************************************************************************************
echo DEL GMIMNYF1_File_Current_153_AA085.csv >> %Log%
DEL GMIMNYF1_File_Current_153_AA085.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIMNYF1_File_Current_153_AA085.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIMNYF1_File_Current_153_AA085.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_MNY_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_MNY_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_153_AA085.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_MNY_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_153_AA085.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_MNY_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_153_AA085.csv >> %Log%
DEL GMIPOSF1_File_Current_153_AA085.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIPOSF1_File_Current_153_AA085.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIPOSF1_File_Current_153_AA085.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_POS_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_POS_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_153_AA085.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_POS_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_153_AA085.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_POS_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_153_AA085.csv >> %Log%
DEL GMIST4F1_File_Current_153_AA085.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIST4F1_File_Current_153_AA085.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIST4F1_File_Current_153_AA085.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_ST4_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_ST4_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_153_AA085.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_ST4_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_153_AA085.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_ST4_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_153_AA085.csv >> %Log%
DEL DTN_File_Current_153_AA085.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Related_Account] 'D', '153','AA085'" queryout DTN_File_Current_153_AA085.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Related_Account] 'D', '153','AA085'" queryout DTN_File_Current_153_AA085.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_DTN_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_DTN_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_153_AA085.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_DTN_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_153_AA085.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Alpha Optimization\153_AA085_DTN_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Related Account D / 153 / AA085
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Related Account D / 153 / 47614
REM **************************************************************************************************************
echo DEL GMIMNYF1_File_Current_153_47614.csv >> %Log%
DEL GMIMNYF1_File_Current_153_47614.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIMNYF1_File_Current_153_47614.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIMNYF1_File_Current_153_47614.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Pineberry\GMI Files\153_47614_MNY_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Pineberry\GMI Files\153_47614_MNY_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_153_47614.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Pineberry\GMI Files\153_47614_MNY_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_153_47614.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Pineberry\GMI Files\153_47614_MNY_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_153_47614.csv >> %Log%
DEL GMIPOSF1_File_Current_153_47614.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIPOSF1_File_Current_153_47614.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIPOSF1_File_Current_153_47614.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Pineberry\GMI Files\153_47614_POS_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Pineberry\GMI Files\153_47614_POS_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_153_47614.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Pineberry\GMI Files\153_47614_POS_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_153_47614.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Pineberry\GMI Files\153_47614_POS_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_153_47614.csv >> %Log%
DEL GMIST4F1_File_Current_153_47614.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIST4F1_File_Current_153_47614.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIST4F1_File_Current_153_47614.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Pineberry\GMI Files\153_47614_ST4_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Pineberry\GMI Files\153_47614_ST4_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_153_47614.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Pineberry\GMI Files\153_47614_ST4_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_153_47614.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Pineberry\GMI Files\153_47614_ST4_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Related Account D / 153 / 47614
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep ARC01
REM **************************************************************************************************************
echo DEL GMIMNYF1_File_Current_ARC01.csv >> %Log%
DEL GMIMNYF1_File_Current_ARC01.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'ARC01'" queryout GMIMNYF1_File_Current_ARC01.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'ARC01'" queryout GMIMNYF1_File_Current_ARC01.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_MNY_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_MNY_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_ARC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_MNY_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_ARC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_MNY_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_ARC01.csv >> %Log%
DEL GMIPOSF1_File_Current_ARC01.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'ARC01'" queryout GMIPOSF1_File_Current_ARC01.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'ARC01'" queryout GMIPOSF1_File_Current_ARC01.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_POS_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_POS_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_ARC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_POS_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_ARC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_POS_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_ARC01.csv >> %Log%
DEL GMIST4F1_File_Current_ARC01.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'ARC01'" queryout GMIST4F1_File_Current_ARC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'ARC01'" queryout GMIST4F1_File_Current_ARC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_ST4_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_ST4_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_ARC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_ST4_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_ARC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_ST4_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_ARC01.csv >> %Log%
DEL DTN_File_Current_ARC01.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'ARC01'" queryout DTN_File_Current_ARC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'ARC01'" queryout DTN_File_Current_ARC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_DTN_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_DTN_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_ARC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_DTN_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_ARC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_DTN_File_%YESTERDAY%.csv" >> %Log%

echo DEL CMF_File_Current_ARC01.csv >> %Log%
DEL CMF_File_Current_ARC01.csv >> %Log%

echo sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_2] 'ARC01'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o CMF_File_Current_ARC01.csv >> %Log%
sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_2] 'ARC01'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o CMF_File_Current_ARC01.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_CMF_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_CMF_File_%YESTERDAY%.csv" >> %Log%

echo COPY CMF_File_Current_ARC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_CMF_File_%YESTERDAY%.csv" >> %Log%
COPY CMF_File_Current_ARC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Architect\Outbox\GMI Files\ARC01_CMF_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Registered Rep ARC01
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Account Number Group HarvestIQ
REM **************************************************************************************************************
echo DEL GMIMNYF1_File_Current_HarvestIQ.csv >> %Log%
DEL GMIMNYF1_File_Current_HarvestIQ.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Account_Number_Group] 'HarvestIQ'" queryout GMIMNYF1_File_Current_HarvestIQ.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Account_Number_Group] 'HarvestIQ'" queryout GMIMNYF1_File_Current_HarvestIQ.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_HarvestIQ.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_HarvestIQ.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_HarvestIQ.csv >> %Log%
DEL GMIPOSF1_File_Current_HarvestIQ.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Account_Number_Group] 'HarvestIQ'" queryout GMIPOSF1_File_Current_HarvestIQ.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Account_Number_Group] 'HarvestIQ'" queryout GMIPOSF1_File_Current_HarvestIQ.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_HarvestIQ.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_HarvestIQ.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_HarvestIQ.csv >> %Log%
DEL GMIST4F1_File_Current_HarvestIQ.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Account_Number_Group] 'HarvestIQ'" queryout GMIST4F1_File_Current_HarvestIQ.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Account_Number_Group] 'HarvestIQ'" queryout GMIST4F1_File_Current_HarvestIQ.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_HarvestIQ.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_HarvestIQ.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_HarvestIQ.csv >> %Log%
DEL DTN_File_Current_HarvestIQ.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Account_Number_Group] 'HarvestIQ'" queryout DTN_File_Current_HarvestIQ.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Account_Number_Group] 'HarvestIQ'" queryout DTN_File_Current_HarvestIQ.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_HarvestIQ.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_HarvestIQ.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\HarvestIQ\HarvestIQ_DTNF1_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Account Number Group HarvestIQ
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep SWEET_FUTURES
REM **************************************************************************************************************
echo DEL GNACMF_File_Current_SWEET_FUTURES.csv >> %Log%
DEL GNACMF_File_Current_SWEET_FUTURES.csv >> %Log%

echo sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_Group_3] 'SWEET_FUTURES'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o GNACMF_File_Current_SWEET_FUTURES.csv >> %Log%
sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_Group_3] 'SWEET_FUTURES'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o GNACMF_File_Current_SWEET_FUTURES.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_CMF_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_CMF_File_%YESTERDAY%.csv" >> %Log%

echo COPY GNACMF_File_Current_SWEET_FUTURES.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_CMF_File_%YESTERDAY%.csv" >> %Log%
COPY GNACMF_File_Current_SWEET_FUTURES.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_CMF_File_%YESTERDAY%.csv" >> %Log%

echo DEL DOREMAILA3_File_Current_SWEET_FUTURES.csv >> %Log%
DEL DOREMAILA3_File_Current_SWEET_FUTURES.csv >> %Log%

echo sqlcmd -Q"[dbo].[PROC_Dump_DOREMAILA3_File_Current_by_Registered_Rep_Group] 'SWEET_FUTURES'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o DOREMAILA3_File_Current_SWEET_FUTURES.csv >> %Log%
sqlcmd -Q"[dbo].[PROC_Dump_DOREMAILA3_File_Current_by_Registered_Rep_Group] 'SWEET_FUTURES'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o DOREMAILA3_File_Current_SWEET_FUTURES.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_DOREMAILA3_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_DOREMAILA3_File_%YESTERDAY%.csv" >> %Log%

echo COPY DOREMAILA3_File_Current_SWEET_FUTURES.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_DOREMAILA3_File_%YESTERDAY%.csv" >> %Log%
COPY DOREMAILA3_File_Current_SWEET_FUTURES.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_DOREMAILA3_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIMNYF1_File_Current_SWEET_FUTURES.csv >> %Log%
DEL GMIMNYF1_File_Current_SWEET_FUTURES.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep_Group] 'SWEET_FUTURES'" queryout GMIMNYF1_File_Current_SWEET_FUTURES.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep_Group] 'SWEET_FUTURES'" queryout GMIMNYF1_File_Current_SWEET_FUTURES.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DIR GMIMNYF1_File_Current_SWEET_FUTURES.csv >> %Log%
DIR GMIMNYF1_File_Current_SWEET_FUTURES.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_SWEET_FUTURES.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_SWEET_FUTURES.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_SWEET_FUTURES.csv >> %Log%
DEL GMIPOSF1_File_Current_SWEET_FUTURES.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep_Group] 'SWEET_FUTURES'" queryout GMIPOSF1_File_Current_SWEET_FUTURES.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep_Group] 'SWEET_FUTURES'" queryout GMIPOSF1_File_Current_SWEET_FUTURES.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DIR GMIPOSF1_File_Current_SWEET_FUTURES.csv >> %Log%
DIR GMIPOSF1_File_Current_SWEET_FUTURES.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_SWEET_FUTURES.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_SWEET_FUTURES.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_SWEET_FUTURES.csv >> %Log%
DEL GMIST4F1_File_Current_SWEET_FUTURES.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep_Group] 'SWEET_FUTURES'" queryout GMIST4F1_File_Current_SWEET_FUTURES.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep_Group] 'SWEET_FUTURES'" queryout GMIST4F1_File_Current_SWEET_FUTURES.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DIR GMIST4F1_File_Current_SWEET_FUTURES.csv >> %Log%
DIR GMIST4F1_File_Current_SWEET_FUTURES.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_SWEET_FUTURES.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_SWEET_FUTURES.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_SWEET_FUTURES.csv >> %Log%
DEL DTN_File_Current_SWEET_FUTURES.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep_Group] 'SWEET_FUTURES'" queryout DTN_File_Current_SWEET_FUTURES.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep_Group] 'SWEET_FUTURES'" queryout DTN_File_Current_SWEET_FUTURES.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DIR DTN_File_Current_SWEET_FUTURES.csv >> %Log%
DIR DTN_File_Current_SWEET_FUTURES.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_SWEET_FUTURES.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_SWEET_FUTURES.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Sweet Futures\SWEET_FUTURES_DTNF1_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Registered Rep SWEET_FUTURES
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Account Number Group Gradable
REM **************************************************************************************************************
echo DEL GMIMNYF1_File_Current_Gradable.csv >> %Log%
DEL GMIMNYF1_File_Current_Gradable.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Account_Number_Group] 'Gradable'" queryout GMIMNYF1_File_Current_Gradable.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Account_Number_Group] 'Gradable'" queryout GMIMNYF1_File_Current_Gradable.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_Gradable.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_Gradable.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_Gradable.csv >> %Log%
DEL GMIPOSF1_File_Current_Gradable.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Account_Number_Group] 'Gradable'" queryout GMIPOSF1_File_Current_Gradable.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Account_Number_Group] 'Gradable'" queryout GMIPOSF1_File_Current_Gradable.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_Gradable.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_Gradable.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_Gradable.csv >> %Log%
DEL GMIST4F1_File_Current_Gradable.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Account_Number_Group] 'Gradable'" queryout GMIST4F1_File_Current_Gradable.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Account_Number_Group] 'Gradable'" queryout GMIST4F1_File_Current_Gradable.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_Gradable.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_Gradable.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_Gradable.csv >> %Log%
DEL DTN_File_Current_Gradable.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Account_Number_Group] 'Gradable'" queryout DTN_File_Current_Gradable.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Account_Number_Group] 'Gradable'" queryout DTN_File_Current_Gradable.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_Gradable.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_Gradable.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Gradable\Gradable_DTNF1_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Account Number Group Gradable
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep OPC05
REM **************************************************************************************************************
echo DEL GMIMNYF1_File_Current_OPC05.csv >> %Log%
DEL GMIMNYF1_File_Current_OPC05.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'OPC05'" queryout GMIMNYF1_File_Current_OPC05.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'OPC05'" queryout GMIMNYF1_File_Current_OPC05.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_OPC05.csv >> %Log%
DEL GMIPOSF1_File_Current_OPC05.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'OPC05'" queryout GMIPOSF1_File_Current_OPC05.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'OPC05'" queryout GMIPOSF1_File_Current_OPC05.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_OPC05.csv >> %Log%
DEL GMIST4F1_File_Current_OPC05.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'OPC05'" queryout GMIST4F1_File_Current_OPC05.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'OPC05'" queryout GMIST4F1_File_Current_OPC05.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_OPC05.csv >> %Log%
DEL DTN_File_Current_OPC05.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'OPC05'" queryout DTN_File_Current_OPC05.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'OPC05'" queryout DTN_File_Current_OPC05.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Greenfield Commodities\OPC05_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_OPC05.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Hedgefacts\OPC05_DTNF1_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Registered Rep OPC05
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Office 442
REM **************************************************************************************************************
echo DEL GNACMF_File_Current_GigaTrade.csv >> %Log%
DEL GNACMF_File_Current_GigaTrade.csv >> %Log%

echo sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Office] '442'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o GNACMF_File_Current_GigaTrade.csv >> %Log%
sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Office] '442'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o GNACMF_File_Current_GigaTrade.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Gigatrade\Customer Master File\GigaTrade_CMF_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Gigatrade\Customer Master File\GigaTrade_CMF_File_%YESTERDAY%.csv" >> %Log%

echo COPY GNACMF_File_Current_GigaTrade.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Gigatrade\Customer Master File\GigaTrade_CMF_File_%YESTERDAY%.csv" >> %Log%
COPY GNACMF_File_Current_GigaTrade.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Gigatrade\Customer Master File\GigaTrade_CMF_File_%YESTERDAY%.csv" >> %Log%

echo DEL DOREMAILA3_File_Current_GigaTrade.csv >> %Log%
DEL DOREMAILA3_File_Current_GigaTrade.csv >> %Log%

echo sqlcmd -Q"[dbo].[PROC_Dump_DOREMAILA3_File_Current_by_Office] '442'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o DOREMAILA3_File_Current_GigaTrade.csv >> %Log%
sqlcmd -Q"[dbo].[PROC_Dump_DOREMAILA3_File_Current_by_Office] '442'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o DOREMAILA3_File_Current_GigaTrade.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Gigatrade\Customer Master File\GigaTrade_DOREMAILA3_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Gigatrade\Customer Master File\GigaTrade_DOREMAILA3_File_%YESTERDAY%.csv" >> %Log%

echo COPY DOREMAILA3_File_Current_GigaTrade.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Gigatrade\Customer Master File\GigaTrade_DOREMAILA3_File_%YESTERDAY%.csv" >> %Log%
COPY DOREMAILA3_File_Current_GigaTrade.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Gigatrade\Customer Master File\GigaTrade_DOREMAILA3_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Office 442
REM **************************************************************************************************************