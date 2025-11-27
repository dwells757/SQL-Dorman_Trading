REM (DWH 11/27/25)DEL C:\HCC\Test_Files\5_Dump_GMI_Files_Current.log

REM (DWH 11/27/25)SET Log=C:\HCC\Test_Files\5_Dump_GMI_Files_Current.log

CD \HCC\Test_Files
PAUSE
REM **************************************************************
REM START - Generate %YESTERDAY%
REM **************************************************************
REM (DWH 11/27/25)FOR /F "usebackq tokens=*" %%t IN (`powershell -NoProfile -Command "(Get-Date).AddDays(-1).ToString('yyyyMMdd')"`) DO (SET "YESTERDAY=%%t")
FOR /F "usebackq tokens=*" %%t IN (`powershell -NoProfile -Command "(Get-Date).AddDays(-2).ToString('yyyyMMdd')"`) DO (SET "YESTERDAY=%%t")

echo Yesterday:
echo %YESTERDAY%
PAUSE

REM **************************************************************
REM END - Generate %YESTERDAY%
REM **************************************************************

REM **************************************************************************************************************
REM START - Risk Report
REM **************************************************************************************************************

DEL Risk_Report.csv
PAUSE

DEL Risk_Report.csv
PAUSE

sqlcmd -Q"EXEC [dbo].[PROC_Generate_Risk_Report_CSV_File]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -y 0 -o Risk_Report.csv

dir Risk_Report.csv
PAUSE

REM (DWH 11/27/25)DEL "\\LASERVAULT\Risk Reports\Risk_Report_%YESTERDAY%.csv"
REM (DWH 11/27/25)PAUSE

REM (DWH 11/27/25)COPY Risk_Report.csv "\\LASERVAULT\Risk Reports\Risk_Report_%YESTERDAY%.csv"
REM (DWH 11/27/25)PAUSE

REM (DWH 11/27/25)DIR "\\LASERVAULT\Risk Reports\Risk_Report_%YESTERDAY%.csv"
REM (DWH 11/27/25)PAUSE

REM **************************************************************************************************************
REM END - Risk Report
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep OPC01
REM **************************************************************************************************************

DEL GMIMNYF1_File_Current_OPC01.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIMNYF1_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\OPC Test\OPC01_MNYF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIMNYF1_File_Current_OPC01.csv "N:\OPC Test\OPC01_MNYF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIPOSF1_File_Current_OPC01.csv
PAUSE
REM echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIPOSF1_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
REM bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIPOSF1_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIPOSF1_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\OPC Test\OPC01_POSF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_OPC01.csv "N:\OPC Test\OPC01_POSF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIST4F1_File_Current_OPC01.csv
PAUSE
REM echo bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIST4F1_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
REM bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIST4F1_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'OPC01'" queryout GMIST4F1_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\OPC Test\OPC01_ST4F1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIST4F1_File_Current_OPC01.csv "N:\OPC Test\OPC01_ST4F1_File_%YESTERDAY%.csv"
PAUSE
DEL DTN_File_Current_OPC01.csv
PAUSE
REM echo bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'OPC01'" queryout DTN_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
REM bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'OPC01'" queryout DTN_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'OPC01'" queryout DTN_File_Current_OPC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\OPC Test\OPC01_DTNF1_File_%YESTERDAY%.csv"
PAUSE
COPY DTN_File_Current_OPC01.csv "N:\OPC Test\OPC01_DTNF1_File_%YESTERDAY%.csv"
PAUSE
REM **************************************************************************************************************
REM END - Registered Rep OPC01
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep PRIME
REM **************************************************************************************************************

DEL GMIPOSF1_File_Current_PRIME.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'PRIME'" queryout GMIPOSF1_File_Current_PRIME.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Prime\Position File Updated\PRIME_POSF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_PRIME.csv "N:\Prime\Position File Updated\PRIME_POSF1_File_%YESTERDAY%.csv"
PAUSE
REM **************************************************************************************************************
REM END - Registered Rep PRIME
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep RCM02
REM **************************************************************************************************************

DEL GMIMNYF1_File_Current_RCM02.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIMNYF1_File_Current_RCM02.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Ultimus Fund Sol\RCM02_MNYF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIMNYF1_File_Current_RCM02.csv "N:\Ultimus Fund Sol\RCM02_MNYF1_File_%YESTERDAY%.csv"
PAUSE
DEL "N:\Equity Armor\RCM02_MNYF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIMNYF1_File_Current_RCM02.csv "N:\Equity Armor\RCM02_MNYF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIPOSF1_File_Current_RCM02.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIPOSF1_File_Current_RCM02.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Ultimus Fund Sol\RCM02_POSF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_RCM02.csv "N:\Ultimus Fund Sol\RCM02_POSF1_File_%YESTERDAY%.csv"
PAUSE
DEL "N:\Equity Armor\RCM02_POSF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_RCM02.csv "N:\Equity Armor\RCM02_POSF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIST4F1_File_Current_RCM02.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'RCM02'" queryout GMIST4F1_File_Current_RCM02.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Ultimus Fund Sol\RCM02_ST4F1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIST4F1_File_Current_RCM02.csv "N:\Ultimus Fund Sol\RCM02_ST4F1_File_%YESTERDAY%.csv"
PAUSE
DEL "N:\Equity Armor\RCM02_ST4F1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIST4F1_File_Current_RCM02.csv "N:\Equity Armor\RCM02_ST4F1_File_%YESTERDAY%.csv"
PAUSE
DEL DTN_File_Current_RCM02.csv
PAUSE
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'RCM02'" queryout DTN_File_Current_RCM02.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Ultimus Fund Sol\RCM02_DTNF1_File_%YESTERDAY%.csv"
PAUSE
COPY DTN_File_Current_RCM02.csv "N:\Ultimus Fund Sol\RCM02_DTNF1_File_%YESTERDAY%.csv"
PAUSE
DEL "N:\Equity Armor\RCM02_DTNF1_File_%YESTERDAY%.csv"
PAUSE
COPY DTN_File_Current_RCM02.csv "N:\Equity Armor\RCM02_DTNF1_File_%YESTERDAY%.csv"
PAUSE
REM **************************************************************************************************************
REM END - Registered Rep RCM02
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep Group Trade_Pro_Futures
REM **************************************************************************************************************
DEL GMIMNYF1_File_Current_Trade_Pro_Futures.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIMNYF1_File_Current_Trade_Pro_Futures.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_MNYF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIMNYF1_File_Current_Trade_Pro_Futures.csv "N:\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_MNYF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIPOSF1_File_Current_Trade_Pro_Futures.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIPOSF1_File_Current_Trade_Pro_Futures.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_POSF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_Trade_Pro_Futures.csv "N:\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_POSF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIST4F1_File_Current_Trade_Pro_Futures.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout GMIST4F1_File_Current_Trade_Pro_Futures.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_ST4F1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIST4F1_File_Current_Trade_Pro_Futures.csv "N:\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_ST4F1_File_%YESTERDAY%.csv"
PAUSE
DEL DTN_File_Current_Trade_Pro_Futures.csv
PAUSE
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep_Group] 'Trade_Pro_Futures'" queryout DTN_File_Current_Trade_Pro_Futures.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_DTNF1_File_%YESTERDAY%.csv"
PAUSE
COPY DTN_File_Current_Trade_Pro_Futures.csv "N:\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_DTNF1_File_%YESTERDAY%.csv"
PAUSE
DEL GNACMFF1_File_Current_Trade_Pro_Futures.csv
PAUSE
sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_Group_2] 'Trade_Pro_Futures'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o GNACMFF1_File_Current_Trade_Pro_Futures.csv
PAUSE
DEL "N:\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_CMFF1_File_%YESTERDAY%.csv"
PAUSE
COPY GNACMFF1_File_Current_Trade_Pro_Futures.csv "N:\Tradier Futures\Trade Pro Futures\Trade_Pro_Futures_CMFF1_File_%YESTERDAY%.csv"
PAUSE
REM **************************************************************************************************************
REM END - Registered Rep Group Trade_Pro_Futures
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep Group Tradier
REM **************************************************************************************************************

DEL GMIMNYF1_File_Current_Tradier.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep_Group] 'Tradier'" queryout GMIMNYF1_File_Current_Tradier.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Tradier Futures\Tradier\Tradier_MNYF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIMNYF1_File_Current_Tradier.csv "N:\Tradier Futures\Tradier\Tradier_MNYF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIPOSF1_File_Current_Tradier.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep_Group] 'Tradier'" queryout GMIPOSF1_File_Current_Tradier.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Tradier Futures\Tradier\Tradier_POSF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_Tradier.csv "N:\Tradier Futures\Tradier\Tradier_POSF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIST4F1_File_Current_Tradier.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep_Group] 'Tradier'" queryout GMIST4F1_File_Current_Tradier.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Tradier Futures\Tradier\Tradier_ST4F1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIST4F1_File_Current_Tradier.csv "N:\Tradier Futures\Tradier\Tradier_ST4F1_File_%YESTERDAY%.csv"
PAUSE
DEL DTN_File_Current_Tradier.csv
PAUSE
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep_Group] 'Tradier'" queryout DTN_File_Current_Tradier.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Tradier Futures\Tradier\Tradier_DTNF1_File_%YESTERDAY%.csv"
PAUSE
COPY DTN_File_Current_Tradier.csv "N:\Tradier Futures\Tradier\Tradier_DTNF1_File_%YESTERDAY%.csv"
PAUSE
DEL GNACMFF1_File_Current_Tradier.csv
PAUSE
sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_Group_2] 'Tradier'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o GNACMFF1_File_Current_Tradier.csv
PAUSE
DEL "N:\Tradier Futures\Tradier\Tradier_CMFF1_File_%YESTERDAY%.csv"
PAUSE
COPY GNACMFF1_File_Current_Tradier.csv "N:\Tradier Futures\Tradier\Tradier_CMFF1_File_%YESTERDAY%.csv"
PAUSE
REM **************************************************************************************************************
REM END - Registered Rep Group Tradier
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep STAN2
REM **************************************************************************************************************
DEL GMIMNYF1_File_Current_STAN2.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIMNYF1_File_Current_STAN2.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Lighthouse Commodities\STAN2_MNY_File_%YESTERDAY%.csv"
PAUSE
COPY GMIMNYF1_File_Current_STAN2.csv "N:\Lighthouse Commodities\STAN2_MNY_File_%YESTERDAY%.csv"
PAUSE
DEL GMIPOSF1_File_Current_STAN2.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIPOSF1_File_Current_STAN2.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Lighthouse Commodities\STAN2_POS_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_STAN2.csv "N:\Lighthouse Commodities\STAN2_POS_File_%YESTERDAY%.csv"
PAUSE
DEL GMIST4F1_File_Current_STAN2.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'STAN2'" queryout GMIST4F1_File_Current_STAN2.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Lighthouse Commodities\STAN2_ST4_File_%YESTERDAY%.csv"
PAUSE
COPY GMIST4F1_File_Current_STAN2.csv "N:\Lighthouse Commodities\STAN2_ST4_File_%YESTERDAY%.csv"
PAUSE
DEL DTN_File_Current_STAN2.csv
PAUSE
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'STAN2'" queryout DTN_File_Current_STAN2.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Lighthouse Commodities\STAN2_DTN_File_%YESTERDAY%.csv"
PAUSE
COPY DTN_File_Current_STAN2.csv "N:\Lighthouse Commodities\STAN2_DTN_File_%YESTERDAY%.csv"
PAUSE
REM **************************************************************************************************************
REM END - Registered Rep STAN2
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Related Account D / 153 / AA085
REM **************************************************************************************************************
DEL GMIMNYF1_File_Current_153_AA085.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIMNYF1_File_Current_153_AA085.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Alpha Optimization\153_AA085_MNY_File_%YESTERDAY%.csv"
PAUSE
COPY GMIMNYF1_File_Current_153_AA085.csv "N:\Alpha Optimization\153_AA085_MNY_File_%YESTERDAY%.csv"
PAUSE
DEL GMIPOSF1_File_Current_153_AA085.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIPOSF1_File_Current_153_AA085.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Alpha Optimization\153_AA085_POS_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_153_AA085.csv "N:\Alpha Optimization\153_AA085_POS_File_%YESTERDAY%.csv"
PAUSE
DEL GMIST4F1_File_Current_153_AA085.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Related_Account] 'D', '153','AA085'" queryout GMIST4F1_File_Current_153_AA085.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Alpha Optimization\153_AA085_ST4_File_%YESTERDAY%.csv"
PAUSE
COPY GMIST4F1_File_Current_153_AA085.csv "N:\Alpha Optimization\153_AA085_ST4_File_%YESTERDAY%.csv"
PAUSE
DEL DTN_File_Current_153_AA085.csv
PAUSE
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Related_Account] 'D', '153','AA085'" queryout DTN_File_Current_153_AA085.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Alpha Optimization\153_AA085_DTN_File_%YESTERDAY%.csv"
PAUSE
COPY DTN_File_Current_153_AA085.csv "N:\Alpha Optimization\153_AA085_DTN_File_%YESTERDAY%.csv"
PAUSE
REM **************************************************************************************************************
REM END - Related Account D / 153 / AA085
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Related Account D / 153 / 47614
REM **************************************************************************************************************
DEL GMIMNYF1_File_Current_153_47614.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIMNYF1_File_Current_153_47614.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Pineberry\GMI Files\153_47614_MNY_File_%YESTERDAY%.csv"
PAUSE
COPY GMIMNYF1_File_Current_153_47614.csv "N:\Pineberry\GMI Files\153_47614_MNY_File_%YESTERDAY%.csv"
PAUSE
DEL GMIPOSF1_File_Current_153_47614.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIPOSF1_File_Current_153_47614.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Pineberry\GMI Files\153_47614_POS_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_153_47614.csv "N:\Pineberry\GMI Files\153_47614_POS_File_%YESTERDAY%.csv"
PAUSE
DEL GMIST4F1_File_Current_153_47614.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Related_Account] 'D', '153','47614'" queryout GMIST4F1_File_Current_153_47614.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Pineberry\GMI Files\153_47614_ST4_File_%YESTERDAY%.csv"
PAUSE
COPY GMIST4F1_File_Current_153_47614.csv "N:\Pineberry\GMI Files\153_47614_ST4_File_%YESTERDAY%.csv"
PAUSE
REM **************************************************************************************************************
REM END - Related Account D / 153 / 47614
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep ARC01
REM **************************************************************************************************************
DEL GMIMNYF1_File_Current_ARC01.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'ARC01'" queryout GMIMNYF1_File_Current_ARC01.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Architect\Outbox\GMI Files\ARC01_MNY_File_%YESTERDAY%.csv"
PAUSE
COPY GMIMNYF1_File_Current_ARC01.csv "N:\Architect\Outbox\GMI Files\ARC01_MNY_File_%YESTERDAY%.csv"
PAUSE
DEL GMIPOSF1_File_Current_ARC01.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'ARC01'" queryout GMIPOSF1_File_Current_ARC01.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Architect\Outbox\GMI Files\ARC01_POS_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_ARC01.csv "N:\Architect\Outbox\GMI Files\ARC01_POS_File_%YESTERDAY%.csv"
PAUSE
DEL GMIST4F1_File_Current_ARC01.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'ARC01'" queryout GMIST4F1_File_Current_ARC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Architect\Outbox\GMI Files\ARC01_ST4_File_%YESTERDAY%.csv"
PAUSE
COPY GMIST4F1_File_Current_ARC01.csv "N:\Architect\Outbox\GMI Files\ARC01_ST4_File_%YESTERDAY%.csv"
PAUSE
DEL DTN_File_Current_ARC01.csv
PAUSE
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'ARC01'" queryout DTN_File_Current_ARC01.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Architect\Outbox\GMI Files\ARC01_DTN_File_%YESTERDAY%.csv"
PAUSE
COPY DTN_File_Current_ARC01.csv "N:\Architect\Outbox\GMI Files\ARC01_DTN_File_%YESTERDAY%.csv"
PAUSE
DEL CMF_File_Current_ARC01.csv
PAUSE
sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_2] 'ARC01'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o CMF_File_Current_ARC01.csv
PAUSE
DEL "N:\Architect\Outbox\GMI Files\ARC01_CMF_File_%YESTERDAY%.csv"
PAUSE
COPY CMF_File_Current_ARC01.csv "N:\Architect\Outbox\GMI Files\ARC01_CMF_File_%YESTERDAY%.csv"
PAUSE
REM **************************************************************************************************************
REM END - Registered Rep ARC01
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Account Number Group HarvestIQ
REM **************************************************************************************************************
DEL GMIMNYF1_File_Current_HarvestIQ.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Account_Number_Group] 'HarvestIQ'" queryout GMIMNYF1_File_Current_HarvestIQ.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\HarvestIQ\HarvestIQ_MNYF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIMNYF1_File_Current_HarvestIQ.csv "N:\HarvestIQ\HarvestIQ_MNYF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIPOSF1_File_Current_HarvestIQ.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Account_Number_Group] 'HarvestIQ'" queryout GMIPOSF1_File_Current_HarvestIQ.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\HarvestIQ\HarvestIQ_POSF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_HarvestIQ.csv "N:\HarvestIQ\HarvestIQ_POSF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIST4F1_File_Current_HarvestIQ.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Account_Number_Group] 'HarvestIQ'" queryout GMIST4F1_File_Current_HarvestIQ.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\HarvestIQ\HarvestIQ_ST4F1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIST4F1_File_Current_HarvestIQ.csv "N:\HarvestIQ\HarvestIQ_ST4F1_File_%YESTERDAY%.csv"
PAUSE
DEL DTN_File_Current_HarvestIQ.csv
PAUSE
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Account_Number_Group] 'HarvestIQ'" queryout DTN_File_Current_HarvestIQ.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\HarvestIQ\HarvestIQ_DTNF1_File_%YESTERDAY%.csv"
PAUSE
COPY DTN_File_Current_HarvestIQ.csv "N:\HarvestIQ\HarvestIQ_DTNF1_File_%YESTERDAY%.csv"
PAUSE
REM **************************************************************************************************************
REM END - Account Number Group HarvestIQ
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep SWEET_FUTURES
REM **************************************************************************************************************
DEL GNACMF_File_Current_SWEET_FUTURES.csv
PAUSE
sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_Group_3] 'SWEET_FUTURES'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o GNACMF_File_Current_SWEET_FUTURES.csv
PAUSE
DEL "N:\Sweet Futures\SWEET_FUTURES_CMF_File_%YESTERDAY%.csv"
PAUSE
COPY GNACMF_File_Current_SWEET_FUTURES.csv "N:\Sweet Futures\SWEET_FUTURES_CMF_File_%YESTERDAY%.csv"
PAUSE
DEL DOREMAILA3_File_Current_SWEET_FUTURES.csv
PAUSE
sqlcmd -Q"[dbo].[PROC_Dump_DOREMAILA3_File_Current_by_Registered_Rep_Group] 'SWEET_FUTURES'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o DOREMAILA3_File_Current_SWEET_FUTURES.csv
PAUSE
DEL "N:\Sweet Futures\SWEET_FUTURES_DOREMAILA3_File_%YESTERDAY%.csv"
PAUSE
COPY DOREMAILA3_File_Current_SWEET_FUTURES.csv "N:\Sweet Futures\SWEET_FUTURES_DOREMAILA3_File_%YESTERDAY%.csv"
PAUSE
DEL GMIMNYF1_File_Current_SWEET_FUTURES.csv
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep_Group] 'SWEET_FUTURES'" queryout GMIMNYF1_File_Current_SWEET_FUTURES.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DIR GMIMNYF1_File_Current_SWEET_FUTURES.csv
PAUSE
DEL "N:\Sweet Futures\SWEET_FUTURES_MNYF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIMNYF1_File_Current_SWEET_FUTURES.csv "N:\Sweet Futures\SWEET_FUTURES_MNYF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIPOSF1_File_Current_SWEET_FUTURES.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep_Group] 'SWEET_FUTURES'" queryout GMIPOSF1_File_Current_SWEET_FUTURES.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DIR GMIPOSF1_File_Current_SWEET_FUTURES.csv
PAUSE
DEL "N:\Sweet Futures\SWEET_FUTURES_POSF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_SWEET_FUTURES.csv "N:\Sweet Futures\SWEET_FUTURES_POSF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIST4F1_File_Current_SWEET_FUTURES.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep_Group] 'SWEET_FUTURES'" queryout GMIST4F1_File_Current_SWEET_FUTURES.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DIR GMIST4F1_File_Current_SWEET_FUTURES.csv
PAUSE
DEL "N:\Sweet Futures\SWEET_FUTURES_ST4F1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIST4F1_File_Current_SWEET_FUTURES.csv "N:\Sweet Futures\SWEET_FUTURES_ST4F1_File_%YESTERDAY%.csv"
PAUSE
DEL DTN_File_Current_SWEET_FUTURES.csv
PAUSE
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep_Group] 'SWEET_FUTURES'" queryout DTN_File_Current_SWEET_FUTURES.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DIR DTN_File_Current_SWEET_FUTURES.csv
PAUSE
DEL "N:\Sweet Futures\SWEET_FUTURES_DTNF1_File_%YESTERDAY%.csv"
PAUSE
COPY DTN_File_Current_SWEET_FUTURES.csv "N:\Sweet Futures\SWEET_FUTURES_DTNF1_File_%YESTERDAY%.csv"
PAUSE
REM **************************************************************************************************************
REM END - Registered Rep SWEET_FUTURES
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Account Number Group Gradable
REM **************************************************************************************************************
DEL GMIMNYF1_File_Current_Gradable.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Account_Number_Group] 'Gradable'" queryout GMIMNYF1_File_Current_Gradable.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Gradable\Gradable_MNYF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIMNYF1_File_Current_Gradable.csv "N:\Gradable\Gradable_MNYF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIPOSF1_File_Current_Gradable.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Account_Number_Group] 'Gradable'" queryout GMIPOSF1_File_Current_Gradable.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Gradable\Gradable_POSF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_Gradable.csv "N:\Gradable\Gradable_POSF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIST4F1_File_Current_Gradable.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Account_Number_Group] 'Gradable'" queryout GMIST4F1_File_Current_Gradable.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Gradable\Gradable_ST4F1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIST4F1_File_Current_Gradable.csv "N:\Gradable\Gradable_ST4F1_File_%YESTERDAY%.csv"
PAUSE
DEL DTN_File_Current_Gradable.csv
PAUSE
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Account_Number_Group] 'Gradable'" queryout DTN_File_Current_Gradable.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Gradable\Gradable_DTNF1_File_%YESTERDAY%.csv"
PAUSE
COPY DTN_File_Current_Gradable.csv "N:\Gradable\Gradable_DTNF1_File_%YESTERDAY%.csv"
PAUSE
REM **************************************************************************************************************
REM END - Account Number Group Gradable
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Registered Rep OPC05
REM **************************************************************************************************************
DEL GMIMNYF1_File_Current_OPC05.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep] 'OPC05'" queryout GMIMNYF1_File_Current_OPC05.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Greenfield Commodities\OPC05_MNYF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIMNYF1_File_Current_OPC05.csv "N:\Greenfield Commodities\OPC05_MNYF1_File_%YESTERDAY%.csv"
PAUSE
DEL "N:\Hedgefacts\OPC05_MNYF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIMNYF1_File_Current_OPC05.csv "N:\Hedgefacts\OPC05_MNYF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIPOSF1_File_Current_OPC05.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep] 'OPC05'" queryout GMIPOSF1_File_Current_OPC05.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Greenfield Commodities\OPC05_POSF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_OPC05.csv "N:\Greenfield Commodities\OPC05_POSF1_File_%YESTERDAY%.csv"
PAUSE
DEL "N:\Hedgefacts\OPC05_POSF1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIPOSF1_File_Current_OPC05.csv "N:\Hedgefacts\OPC05_POSF1_File_%YESTERDAY%.csv"
PAUSE
DEL GMIST4F1_File_Current_OPC05.csv
PAUSE
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep] 'OPC05'" queryout GMIST4F1_File_Current_OPC05.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Greenfield Commodities\OPC05_ST4F1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIST4F1_File_Current_OPC05.csv "N:\Greenfield Commodities\OPC05_ST4F1_File_%YESTERDAY%.csv"
PAUSE
DEL "N:\Hedgefacts\OPC05_ST4F1_File_%YESTERDAY%.csv"
PAUSE
COPY GMIST4F1_File_Current_OPC05.csv "N:\Hedgefacts\OPC05_ST4F1_File_%YESTERDAY%.csv"
PAUSE
DEL DTN_File_Current_OPC05.csv
PAUSE
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep] 'OPC05'" queryout DTN_File_Current_OPC05.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE
DEL "N:\Greenfield Commodities\OPC05_DTNF1_File_%YESTERDAY%.csv"
PAUSE
COPY DTN_File_Current_OPC05.csv "N:\Greenfield Commodities\OPC05_DTNF1_File_%YESTERDAY%.csv"
PAUSE
DEL "N:\Hedgefacts\OPC05_DTNF1_File_%YESTERDAY%.csv"
PAUSE
COPY DTN_File_Current_OPC05.csv "N:\Hedgefacts\OPC05_DTNF1_File_%YESTERDAY%.csv"
PAUSE
REM **************************************************************************************************************
REM END - Registered Rep OPC05
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Office 442
REM **************************************************************************************************************
DEL GNACMF_File_Current_GigaTrade.csv
PAUSE
sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Office] '442'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o GNACMF_File_Current_GigaTrade.csv
PAUSE
DEL "N:\Gigatrade\Customer Master File\GigaTrade_CMF_File_%YESTERDAY%.csv"
PAUSE
COPY GNACMF_File_Current_GigaTrade.csv "N:\Gigatrade\Customer Master File\GigaTrade_CMF_File_%YESTERDAY%.csv"
PAUSE
DEL DOREMAILA3_File_Current_GigaTrade.csv
PAUSE
sqlcmd -Q"[dbo].[PROC_Dump_DOREMAILA3_File_Current_by_Office] '442'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o DOREMAILA3_File_Current_GigaTrade.csv
PAUSE
DEL "N:\Gigatrade\Customer Master File\GigaTrade_DOREMAILA3_File_%YESTERDAY%.csv"
PAUSE
COPY DOREMAILA3_File_Current_GigaTrade.csv "N:\Gigatrade\Customer Master File\GigaTrade_DOREMAILA3_File_%YESTERDAY%.csv"
PAUSE
PAUSE
PAUSE
REM **************************************************************************************************************
REM END - Office 442
REM **************************************************************************************************************