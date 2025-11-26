DEL C:\React\Test_Files\6_Dump_GMI_Files_EOD.log

SET Log=C:\React\Test_Files\6_Dump_GMI_Files_EOD.log

echo CD \React\Test_Files >> %Log%
CD \React\Test_Files >> %Log%

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
REM START - Silvercape
REM **************************************************************************************************************

echo DEL SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv >> %Log%
DEL SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv >> %Log%

echo sqlcmd -E -Q"[GMIDATA].[dbo].[PROC_Generate_End_of_Day_Position_File_by_Account_Group_2] 'SILVERCAPE_INVSMT'" -S DORT-DB-1 -b -h-1 -W -o SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv >> %Log%
sqlcmd -E -Q"[GMIDATA].[dbo].[PROC_Generate_End_of_Day_Position_File_by_Account_Group_2] 'SILVERCAPE_INVSMT'" -S DORT-DB-1 -b -h-1 -W -o SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv >> %Log%

echo DIR SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv >> %Log%
DIR SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv >> %Log%

echo DEL "\\Laservault\gmi\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account_%TODAY%.csv" >> %Log%
DEL "\\Laservault\gmi\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account_%TODAY%.csv" >> %Log%

echo COPY SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv "\\Laservault\gmi\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account_%TODAY%.csv" >> %Log%
COPY SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account.csv "\\Laservault\gmi\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Account_%TODAY%.csv" >> %Log%

echo DEL SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv >> %Log%
DEL SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv >> %Log%

echo sqlcmd -E -Q"[GMIDATA].[dbo].[PROC_Generate_End_of_Day_Position_File_by_Related_Account_2] 'D-153-10012'" -S DORT-DB-1 -b -h-1 -W -o SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv >> %Log%
sqlcmd -E -Q"[GMIDATA].[dbo].[PROC_Generate_End_of_Day_Position_File_by_Related_Account_2] 'D-153-10012'" -S DORT-DB-1 -b -h-1 -W -o SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv >> %Log%

echo DIR SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv >> %Log%
DIR SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv >> %Log%

echo DEL "\\Laservault\gmi\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account_%TODAY%.csv" >> %Log%
DEL "\\Laservault\gmi\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account_%TODAY%.csv" >> %Log%

echo COPY SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv "\\Laservault\gmi\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account_%TODAY%.csv" >> %Log%
COPY SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account.csv "\\Laservault\gmi\Silvercape\SILVERCAPE_INVSMT_End_of_Day_Position_File_by_Related_Account_%TODAY%.csv" >> %Log%

REM **************************************************************************************************************
REM END - Silvercape
REM **************************************************************************************************************