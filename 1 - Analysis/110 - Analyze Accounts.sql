USE [GMIDATA]
GO

SET NOCOUNT ON

--***************************************************************************
-- Load #Accounts
--***************************************************************************
CREATE TABLE #Accounts
(YFIRM VARCHAR(1),
YOFFIC VARCHAR(3),
YACCT VARCHAR(5),
Account VARCHAR(20) DEFAULT '',
YREL1F VARCHAR(1),
YREL1O VARCHAR(3),
YREL1A VARCHAR(5),
Related_Account VARCHAR(20) DEFAULT '',
Records INT)

--***************************************************************************
-- Load #Accounts
--***************************************************************************
INSERT INTO #Accounts
(YFIRM,
YOFFIC,
YACCT,
YREL1F,
YREL1O,
YREL1A,
Records)
SELECT
YFIRM,
YOFFIC,
YACCT,
YREL1F,
YREL1O,
YREL1A,
COUNT(*) --Records
FROM [dbo].[GNACMFF1_File_Current]
WHERE (YINACT='') --"Active" Accounts ONLY
GROUP BY
YFIRM,
YOFFIC,
YACCT,
YREL1F,
YREL1O,
YREL1A

--***************************************************************************
-- Generate Account
--***************************************************************************
UPDATE #Accounts
SET Account =
	CASE YOFFIC
		WHEN '' THEN RTRIM(YFIRM) + '-' + RTRIM(YACCT)
		ELSE RTRIM(YFIRM) + '-' + RTRIM(YOFFIC) + '-' + RTRIM(YACCT)
	END

--***************************************************************************
-- Generate Account
--***************************************************************************
UPDATE #Accounts
SET Related_Account =
	CASE YREL1O
		WHEN '' THEN RTRIM(YREL1F) + '-' + RTRIM(YREL1A)
		ELSE RTRIM(YREL1F) + '-' + RTRIM(YREL1O) + '-' + RTRIM(YREL1A)
	END
WHERE (YREL1F<>'')

SELECT *
FROM #Accounts
WHERE (Records<>1)
ORDER BY
YFIRM,
YOFFIC,
YACCT,
YREL1F,
YREL1O,
YREL1A

SELECT *
FROM #Accounts
WHERE (Related_Account=Account)
ORDER BY
YFIRM,
YOFFIC,
YACCT,
YREL1F,
YREL1O,
YREL1A

SELECT *
FROM #Accounts
WHERE (YREL1O='150')
ORDER BY
YFIRM,
YOFFIC,
YACCT,
YREL1F,
YREL1O,
YREL1A

DROP TABLE #Accounts

SET NOCOUNT OFF