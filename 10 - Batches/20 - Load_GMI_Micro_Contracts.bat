CD \React\Junk
PAUSE

DIR GMI_Micro_Contracts.csv
PAUSE

sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[GMI_Micro_Contracts]" -S DORT-DB-1 -b
PAUSE

bcp GMIDATA..GMI_Micro_Contracts in GMI_Micro_Contracts.csv -f C:\React\Code\Format_Files\GMI_Micro_Contracts.FMT -m50 -S DORT-DB-1 -T -h"TABLOCK" -F 2
PAUSE

sqlcmd -E -Q"EXEC [GMIDATA].[dbo].[PROC_Scrub_GMI_Micro_Contracts]" -S DORT-DB-1 -b -h-1
PAUSE