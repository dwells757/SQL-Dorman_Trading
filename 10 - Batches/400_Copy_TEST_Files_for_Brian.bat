DEL C:\HCC\Test_Files\Brian\400_Copy_TEST_Files_for_Brian.log

SET Log=C:\HCC\Test_Files\Brian\400_Copy_TEST_Files_for_Brian.log

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
REM START - Registered Rep Group GFF_Brokers
REM **************************************************************************************************************
echo DEL GMIMNYF1_File_Current_GFF_Brokers.csv >> %Log%
DEL GMIMNYF1_File_Current_GFF_Brokers.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep_Group] 'GFF_Brokers'" queryout GMIMNYF1_File_Current_GFF_Brokers.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIMNYF1_File_Current_by_Registered_Rep_Group] 'GFF_Brokers'" queryout GMIMNYF1_File_Current_GFF_Brokers.csv -f C:\HCC\Code\Format_Files\GMIMNYF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_MNYF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIMNYF1_File_Current_GFF_Brokers.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_MNYF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIMNYF1_File_Current_GFF_Brokers.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_MNYF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIPOSF1_File_Current_GFF_Brokers.csv >> %Log%
DEL GMIPOSF1_File_Current_GFF_Brokers.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep_Group] 'GFF_Brokers'" queryout GMIPOSF1_File_Current_GFF_Brokers.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIPOSF1_File_Current_by_Registered_Rep_Group] 'GFF_Brokers'" queryout GMIPOSF1_File_Current_GFF_Brokers.csv -f C:\HCC\Code\Format_Files\GMIPOSF1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_POSF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIPOSF1_File_Current_GFF_Brokers.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_POSF1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIPOSF1_File_Current_GFF_Brokers.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_POSF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GMIST4F1_File_Current_GFF_Brokers.csv >> %Log%
DEL GMIST4F1_File_Current_GFF_Brokers.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep_Group] 'GFF_Brokers'" queryout GMIST4F1_File_Current_GFF_Brokers.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Dump_GMIST4F1_File_Current_by_Registered_Rep_Group] 'GFF_Brokers'" queryout GMIST4F1_File_Current_GFF_Brokers.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_ST4F1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GMIST4F1_File_Current_GFF_Brokers.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_ST4F1_File_%YESTERDAY%.csv" >> %Log%
COPY GMIST4F1_File_Current_GFF_Brokers.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_ST4F1_File_%YESTERDAY%.csv" >> %Log%

echo DEL DTN_File_Current_GFF_Brokers.csv >> %Log%
DEL DTN_File_Current_GFF_Brokers.csv >> %Log%

echo bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep_Group] 'GFF_Brokers'" queryout DTN_File_Current_GFF_Brokers.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%
bcp "EXEC [dbo].[PROC_Generate_DTN_File_by_Registered_Rep_Group] 'GFF_Brokers'" queryout DTN_File_Current_GFF_Brokers.csv -f C:\HCC\Code\Format_Files\GMIST4F1_File.xml -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_DTNF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY DTN_File_Current_GFF_Brokers.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_DTNF1_File_%YESTERDAY%.csv" >> %Log%
COPY DTN_File_Current_GFF_Brokers.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_DTNF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL GNACMFF1_File_Current_GFF_Brokers.csv >> %Log%
DEL GNACMFF1_File_Current_GFF_Brokers.csv >> %Log%

echo sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_Group_2] 'GFF_Brokers'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o GNACMFF1_File_Current_GFF_Brokers.csv >> %Log%
sqlcmd -Q"[dbo].[PROC_Dump_GNACMFF1_File_Current_by_Registered_Rep_Group_2] 'GFF_Brokers'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o GNACMFF1_File_Current_GFF_Brokers.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_CMFF1_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_CMFF1_File_%YESTERDAY%.csv" >> %Log%

echo COPY GNACMFF1_File_Current_GFF_Brokers.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_CMFF1_File_%YESTERDAY%.csv" >> %Log%
COPY GNACMFF1_File_Current_GFF_Brokers.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_CMFF1_File_%YESTERDAY%.csv" >> %Log%

echo DEL DOREMAILA3_File_Current_GFF_Brokers.csv >> %Log%
DEL DOREMAILA3_File_Current_GFF_Brokers.csv >> %Log%

echo sqlcmd -Q"[dbo].[PROC_Dump_DOREMAILA3_File_Current_by_Registered_Rep_Group] 'GFF_Brokers'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o DOREMAILA3_File_Current_GFF_Brokers.csv >> %Log%
sqlcmd -Q"[dbo].[PROC_Dump_DOREMAILA3_File_Current_by_Registered_Rep_Group] 'GFF_Brokers'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1 -W -o DOREMAILA3_File_Current_GFF_Brokers.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_DOREMAILA3_File_%YESTERDAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_DOREMAILA3_File_%YESTERDAY%.csv" >> %Log%

echo COPY DOREMAILA3_File_Current_GFF_Brokers.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_DOREMAILA3_File_%YESTERDAY%.csv" >> %Log%
COPY DOREMAILA3_File_Current_GFF_Brokers.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\GFF\GFF_Brokers_DOREMAILA3_File_%YESTERDAY%.csv" >> %Log%
REM **************************************************************************************************************
REM END - Registered Rep Group GFF_Brokers
REM **************************************************************************************************************