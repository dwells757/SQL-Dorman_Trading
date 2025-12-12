CD \HCC\Junk
PAUSE

DIR GMI_Micro_Contracts.csv
PAUSE

sqlcmd -Q"TRUNCATE TABLE [dbo].[GMI_Micro_Contracts]" -d gmidata -S ncusprdsql01.database.windows.net -b -U dorsqladmin -P bjTT6hw$ig9Bkq
PAUSE

bcp [dbo].[GMI_Micro_Contracts] in GMI_Micro_Contracts.csv -f C:\HCC\Code\Format_Files\GMI_Micro_Contracts.FMT -m50 -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -h"TABLOCK" -F 2
PAUSE

sqlcmd -Q"EXEC [dbo].[PROC_Scrub_GMI_Micro_Contracts]" -d gmidata -S ncusprdsql01.database.windows.net -U dorsqladmin -P bjTT6hw$ig9Bkq -b -h-1
PAUSE