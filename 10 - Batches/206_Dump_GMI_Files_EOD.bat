DEL C:\HCC\Test_Files\6_Dump_GMI_Files_EOD.log

SET Log=C:\HCC\Test_Files\6_Dump_GMI_Files_EOD.log

echo CD \HCC\Test_Files >> %Log%
CD \HCC\Test_Files >> %Log%

REM **************************************************************
REM END - Generate %YESTERDAY%
REM **************************************************************

REM **************************************************************
REM START - Generate %TODAY%
REM **************************************************************
FOR /F "usebackq tokens=*" %%t IN (`powershell -NoProfile -Command "(Get-Date).ToString('yyyyMMdd')"`) DO (SET "TODAY=%%t")

echo TODAY: >> %Log%
echo %TODAY% >> %Log%

REM **************************************************************
REM END - Generate %TODAY%
REM **************************************************************

REM **************************************************************************************************************
REM START - SILVERCAPE_INVSMT
REM **************************************************************************************************************

echo DEL SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv >> %Log%
DEL SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv >> %Log%

echo sqlcmd -Q"EXEC [dbo].[PROC_Generate_End_of_Day_Position_File_by_Account_Group_2] 'SILVERCAPE_INVSMT'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -y 0 -o SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Generate_End_of_Day_Position_File_by_Account_Group_2] 'SILVERCAPE_INVSMT'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -y 0 -o SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv >> %Log%

echo DIR SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv >> %Log%
DIR SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account_%TODAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account_%TODAY%.csv" >> %Log%

echo COPY SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account_%TODAY%.csv" >> %Log%
COPY SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account_%TODAY%.csv" >> %Log%

echo DEL SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv >> %Log%
DEL SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv >> %Log%

echo sqlcmd -Q"EXEC [dbo].[PROC_Generate_End_of_Day_Position_File_by_Related_Account_2] 'D-153-10012'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -y 0 -o SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Generate_End_of_Day_Position_File_by_Related_Account_2] 'D-153-10012'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -y 0 -o SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv >> %Log%

echo DIR SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv >> %Log%
DIR SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account_%TODAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account_%TODAY%.csv" >> %Log%

echo COPY SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account_%TODAY%.csv" >> %Log%
COPY SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account_%TODAY%.csv" >> %Log%

REM **************************************************************************************************************
REM END - SILVERCAPE_INVSMT
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Backhouse
REM **************************************************************************************************************

echo DEL Backhouse_End_of_Day_Position_File_by_Account.csv >> %Log%
DEL Backhouse_End_of_Day_Position_File_by_Account.csv >> %Log%

echo sqlcmd -Q"EXEC [dbo].[PROC_Generate_End_of_Day_Position_File_by_Account_Group_2] 'Backhouse'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -y 0 -o Backhouse_End_of_Day_Position_File_by_Account.csv >> %Log%
sqlcmd -Q"EXEC [dbo].[PROC_Generate_End_of_Day_Position_File_by_Account_Group_2] 'Backhouse'" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -y 0 -o Backhouse_End_of_Day_Position_File_by_Account.csv >> %Log%

echo DIR Backhouse_End_of_Day_Position_File_by_Account.csv >> %Log%
DIR Backhouse_End_of_Day_Position_File_by_Account.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Backhouse\Backhouse_End_of_Day_Position_File_by_Account_%TODAY%.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Backhouse\Backhouse_End_of_Day_Position_File_by_Account_%TODAY%.csv" >> %Log%

echo COPY Backhouse_End_of_Day_Position_File_by_Account.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Backhouse\Backhouse_End_of_Day_Position_File_by_Account_%TODAY%.csv" >> %Log%
COPY Backhouse_End_of_Day_Position_File_by_Account.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Backhouse\Backhouse_End_of_Day_Position_File_by_Account_%TODAY%.csv" >> %Log%

REM **************************************************************************************************************
REM END - Backhouse
REM **************************************************************************************************************