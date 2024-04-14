DIR C:\React\Junk\WFUTM.csv
PAUSE

sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[WFUTM]" -S REACT -b
PAUSE

bcp GMIDATA..WFUTM in C:\React\Junk\WFUTM.csv -f C:\React\Code\Format_Files\WFUTM.FMT -m50 -S REACT -T -h"TABLOCK" -F 2
PAUSE