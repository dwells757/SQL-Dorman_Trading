CD \React\Junk
PAUSE

DIR WFUTM.csv
PAUSE

DEL WFUTM.csv
PAUSE

COPY "\\192.168.89.212\e$\inetpub\ftproot\GMI\Dorman Reports\WFUTM.csv"
PAUSE

DIR WFUTM.csv
PAUSE

sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[WFUTM]" -S REACT -b
PAUSE

bcp GMIDATA..WFUTM in WFUTM.csv -f C:\React\Code\Format_Files\WFUTM.FMT -m50 -S REACT -T -h"TABLOCK" -F 2
PAUSE

sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Scrub_WFUTM]" -S REACT -b -h-1
PAUSE