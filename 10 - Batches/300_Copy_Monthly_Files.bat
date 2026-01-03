DEL C:\HCC\Monthly_Files\202512\300_Copy_Monthly_Files.log

SET Log=C:\HCC\Monthly_Files\202512\300_Copy_Monthly_Files.log

echo CD \HCC\Monthly_Files\202512 >> %Log%
CD \HCC\Monthly_Files\202512 >> %Log%

REM **************************************************************************************************************
REM START - Monthly Reports
REM **************************************************************************************************************

echo DIR Balance_Report_Summary_December_2025.xlsx >> %Log%
DIR Balance_Report_Summary_December_2025.xlsx >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Balance_Report_Summary_December_2025.xlsx" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Balance_Report_Summary_December_2025.xlsx" >> %Log%

echo COPY Balance_Report_Summary_December_2025.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Balance_Report_Summary_December_2025.xlsx" >> %Log%
COPY Balance_Report_Summary_December_2025.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Balance_Report_Summary_December_2025.xlsx" >> %Log%

echo DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Balance_Report_Summary_December_2025.xlsx" >> %Log%
DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Balance_Report_Summary_December_2025.xlsx" >> %Log%

echo DIR Fee_Report_by_Account_December_2025.xlsx >> %Log%
DIR Fee_Report_by_Account_December_2025.xlsx >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Fee_Report_by_Account_December_2025.xlsx" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Fee_Report_by_Account_December_2025.xlsx" >> %Log%

echo COPY Fee_Report_by_Account_December_2025.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Fee_Report_by_Account_December_2025.xlsx" >> %Log%
COPY Fee_Report_by_Account_December_2025.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Fee_Report_by_Account_December_2025.xlsx" >> %Log%

echo DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Fee_Report_by_Account_December_2025.xlsx" >> %Log%
DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Fee_Report_by_Account_December_2025.xlsx" >> %Log%

REM **************************************************************************************************************
REM END - Monthly Reports
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Edge Clear
REM **************************************************************************************************************

echo DIR Fee_Report_Details_Edge_Clear_December_2025.xlsx >> %Log%
DIR Fee_Report_Details_Edge_Clear_December_2025.xlsx >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Edge Clear\Fee_Report_Details\Fee_Report_Details_Edge_Clear_December_2025.xlsx" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Edge Clear\Fee_Report_Details\Fee_Report_Details_Edge_Clear_December_2025.xlsx" >> %Log%

echo COPY Fee_Report_Details_Edge_Clear_December_2025.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Edge Clear\Fee_Report_Details\Fee_Report_Details_Edge_Clear_December_2025.xlsx" >> %Log%
COPY Fee_Report_Details_Edge_Clear_December_2025.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Edge Clear\Fee_Report_Details\Fee_Report_Details_Edge_Clear_December_2025.xlsx" >> %Log%

echo DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Edge Clear\Fee_Report_Details\Fee_Report_Details_Edge_Clear_December_2025.xlsx" >> %Log%
DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Edge Clear\Fee_Report_Details\Fee_Report_Details_Edge_Clear_December_2025.xlsx" >> %Log%

echo DIR Cash_Report_Edge_Clear_December_2025.xlsx >> %Log%
DIR Cash_Report_Edge_Clear_December_2025.xlsx >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Edge Clear\Cash_Report\Cash_Report_Edge_Clear_December_2025.xlsx" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Edge Clear\Cash_Report\Cash_Report_Edge_Clear_December_2025.xlsx" >> %Log%

echo COPY Cash_Report_Edge_Clear_December_2025.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Edge Clear\Cash_Report\Cash_Report_Edge_Clear_December_2025.xlsx" >> %Log%
COPY Cash_Report_Edge_Clear_December_2025.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Edge Clear\Cash_Report\Cash_Report_Edge_Clear_December_2025.xlsx" >> %Log%

echo DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Edge Clear\Cash_Report\Cash_Report_Edge_Clear_December_2025.xlsx" >> %Log%
DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Edge Clear\Cash_Report\Cash_Report_Edge_Clear_December_2025.xlsx" >> %Log%

REM **************************************************************************************************************
REM END - Edge Clear
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Payouts Form
REM **************************************************************************************************************

echo DIR Commission_Fees_Volume_History_2_202512.xlsx >> %Log%
DIR Commission_Fees_Volume_History_2_202512.xlsx >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Commission_Fees_Volume_History_2_202512.xlsx" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Commission_Fees_Volume_History_2_202512.xlsx" >> %Log%

echo COPY Commission_Fees_Volume_History_2_202512.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Commission_Fees_Volume_History_2_202512.xlsx" >> %Log%
COPY Commission_Fees_Volume_History_2_202512.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Commission_Fees_Volume_History_2_202512.xlsx" >> %Log%

echo DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Commission_Fees_Volume_History_2_202512.xlsx" >> %Log%
DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Commission_Fees_Volume_History_2_202512.xlsx" >> %Log%

echo DIR Commission_Fees_Volume_History_2_Excluded_Records_202512.xlsx >> %Log%
DIR Commission_Fees_Volume_History_2_Excluded_Records_202512.xlsx >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Commission_Fees_Volume_History_2_Excluded_Records_202512.xlsx" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Commission_Fees_Volume_History_2_Excluded_Records_202512.xlsx" >> %Log%

echo COPY Commission_Fees_Volume_History_2_Excluded_Records_202512.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Commission_Fees_Volume_History_2_Excluded_Records_202512.xlsx" >> %Log%
COPY Commission_Fees_Volume_History_2_Excluded_Records_202512.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Commission_Fees_Volume_History_2_Excluded_Records_202512.xlsx" >> %Log%

echo DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Commission_Fees_Volume_History_2_Excluded_Records_202512.xlsx" >> %Log%
DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Commission_Fees_Volume_History_2_Excluded_Records_202512.xlsx" >> %Log%

echo DIR Payouts_Form_202512.xlsx >> %Log%
DIR Payouts_Form_202512.xlsx >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Payouts_Form_202512.xlsx" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Payouts_Form_202512.xlsx" >> %Log%

echo COPY Payouts_Form_202512.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Payouts_Form_202512.xlsx" >> %Log%
COPY Payouts_Form_202512.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Payouts_Form_202512.xlsx" >> %Log%

echo DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Payouts_Form_202512.xlsx" >> %Log%
DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Monthly_Reports\Payouts_Form\Payouts_Form_202512.xlsx" >> %Log%

REM **************************************************************************************************************
REM END - Payouts Form
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Orchard Point
REM **************************************************************************************************************

echo DIR Commission_Fees_Volume_History_COOPERATIVE_PRODUCER_202512.xlsx >> %Log%
DIR Commission_Fees_Volume_History_COOPERATIVE_PRODUCER_202512.xlsx >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Orchard Point\Commission_Fees_Volume_History_COOPERATIVE_PRODUCER_202512.xlsx" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Orchard Point\Commission_Fees_Volume_History_COOPERATIVE_PRODUCER_202512.xlsx" >> %Log%

echo COPY Commission_Fees_Volume_History_COOPERATIVE_PRODUCER_202512.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Orchard Point\Commission_Fees_Volume_History_COOPERATIVE_PRODUCER_202512.xlsx" >> %Log%
COPY Commission_Fees_Volume_History_COOPERATIVE_PRODUCER_202512.xlsx "\\dormansftp1.file.core.windows.net\sftp\GMI\Orchard Point\Commission_Fees_Volume_History_COOPERATIVE_PRODUCER_202512.xlsx" >> %Log%

echo DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Orchard Point\Commission_Fees_Volume_History_COOPERATIVE_PRODUCER_202512.xlsx" >> %Log%
DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Orchard Point\Commission_Fees_Volume_History_COOPERATIVE_PRODUCER_202512.xlsx" >> %Log%

REM **************************************************************************************************************
REM END - Orchard Point
REM **************************************************************************************************************

REM **************************************************************************************************************
REM START - Greenfield
REM **************************************************************************************************************

echo DIR OPC05_Transaction_File_Monthly_202512.csv >> %Log%
DIR OPC05_Transaction_File_Monthly_202512.csv >> %Log%

echo DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\OPC05_Transaction_File_Monthly_202512.csv" >> %Log%
DEL "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\OPC05_Transaction_File_Monthly_202512.csv" >> %Log%

echo COPY OPC05_Transaction_File_Monthly_202512.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\OPC05_Transaction_File_Monthly_202512.csv" >> %Log%
COPY OPC05_Transaction_File_Monthly_202512.csv "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\OPC05_Transaction_File_Monthly_202512.csv" >> %Log%

echo DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\OPC05_Transaction_File_Monthly_202512.csv" >> %Log%
DIR "\\dormansftp1.file.core.windows.net\sftp\GMI\Dorman Reports\Test_Files\OPC05_Transaction_File_Monthly_202512.csv" >> %Log%

REM **************************************************************************************************************
REM END - Greenfield
REM **************************************************************************************************************