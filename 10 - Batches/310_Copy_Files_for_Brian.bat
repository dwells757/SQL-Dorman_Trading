DEL C:\HCC\Monthly_Files\202606\310_Copy_Files_for_Brian.log

SET Log=C:\HCC\Monthly_Files\202606\310_Copy_Files_for_Brian.log

echo CD \HCC\Monthly_Files\202606\Brian >> %Log%
CD \HCC\Monthly_Files\202606\Brian >> %Log%

echo DIR Balance_Report_Details_202606_00150.csv >> %Log%
DIR Balance_Report_Details_202606_00150.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_00150.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_00150.csv" >> %Log%

echo COPY Balance_Report_Details_202606_00150.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_00150.csv" >> %Log%
COPY Balance_Report_Details_202606_00150.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_00150.csv" >> %Log%

echo DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_00150.csv" >> %Log%
DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_00150.csv" >> %Log%

echo DIR Balance_Report_Details_202606_OPC01.csv >> %Log%
DIR Balance_Report_Details_202606_OPC01.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_OPC01.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_OPC01.csv" >> %Log%

echo COPY Balance_Report_Details_202606_OPC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_OPC01.csv" >> %Log%
COPY Balance_Report_Details_202606_OPC01.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_OPC01.csv" >> %Log%

echo DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_OPC01.csv" >> %Log%
DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_OPC01.csv" >> %Log%

echo DIR Balance_Report_Details_202606_STAN2.csv >> %Log%
DIR Balance_Report_Details_202606_STAN2.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_STAN2.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_STAN2.csv" >> %Log%

echo COPY Balance_Report_Details_202606_STAN2.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_STAN2.csv" >> %Log%
COPY Balance_Report_Details_202606_STAN2.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_STAN2.csv" >> %Log%

echo DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_STAN2.csv" >> %Log%
DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\Balance_Report_Details_202606_STAN2.csv" >> %Log%