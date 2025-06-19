USE GMIDATA
GO

SET NOCOUNT ON

SELECT
LEFT(CONVERT(VARCHAR,ORDINAL_POSITION) + '        ',8) + --Columns 1-8
'SQLCHAR       0      ' + --Columns 9-29
CASE DATA_TYPE
	WHEN 'varchar' THEN RIGHT('   ' + CONVERT(VARCHAR,CHARACTER_MAXIMUM_LENGTH),3)
	WHEN 'numeric' THEN ' 20'
	WHEN 'datetime' THEN ' 20'
	ELSE ' 20'
END + --Columns 30-32
'      ","                   ' + --Columns 33-60
RIGHT('    ' + CONVERT(VARCHAR,ORDINAL_POSITION),3) + --Columns 61-63
'      ' + --Collumns 64-69
COLUMN_NAME --Columns 70-...
FROM INFORMATION_SCHEMA.COLUMNS
WHERE (TABLE_NAME = 'GMI_Micro_Contracts')

SET NOCOUNT OFF