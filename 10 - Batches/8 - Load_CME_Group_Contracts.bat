DIR C:\React\Junk\CME_Group_Contracts.csv
PAUSE

sqlcmd -E -Q"TRUNCATE TABLE [GMIDATA].[dbo].[CME_Group_Contracts]" -S REACT -b
PAUSE

bcp GMIDATA..CME_Group_Contracts in C:\React\Junk\CME_Group_Contracts.csv -f C:\React\Code\Format_Files\CME_Group_Contracts.FMT -m50 -S REACT -T -h"TABLOCK"
PAUSE