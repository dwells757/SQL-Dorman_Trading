USE [GMIDATA]
GO

SET NOCOUNT ON

--***************************************************************************
-- Load #Related_Accounts
--***************************************************************************
CREATE TABLE #Related_Accounts
(YREL1F VARCHAR(1),
YREL1O VARCHAR(3),
YREL1A VARCHAR(5),
Records INT,
Related_Account VARCHAR(20) DEFAULT '')

--***************************************************************************
-- Load #Related_Accounts
--***************************************************************************
INSERT INTO #Related_Accounts
(YREL1F,
YREL1O,
YREL1A,
Records)
SELECT
YREL1F,
YREL1O,
YREL1A,
COUNT(*) --Records
FROM [dbo].[GNACMFF1_File_Current]
WHERE (YINACT='') --"Active" Accounts ONLY
GROUP BY
YREL1F,
YREL1O,
YREL1A

--***************************************************************************
-- Generate Related_Account
--***************************************************************************
UPDATE #Related_Accounts
SET Related_Account =
	CASE YREL1O
		WHEN '' THEN RTRIM(YREL1F) + '-' + RTRIM(YREL1A)
		ELSE RTRIM(YREL1F) + '-' + RTRIM(YREL1O) + '-' + RTRIM(YREL1A)
	END


SELECT *
FROM #Related_Accounts
ORDER BY
YREL1F,
YREL1O,
YREL1A

--***************************************************************************
-- Load #Accounts
--***************************************************************************
CREATE TABLE #Accounts
(YFIRM VARCHAR(1),
YOFFIC VARCHAR(3),
YACCT VARCHAR(5),
Records INT,
Related_Account VARCHAR(20) DEFAULT '')

--***************************************************************************
-- Load #Accounts
--***************************************************************************
INSERT INTO #Accounts
(YFIRM,
YOFFIC,
YACCT,
Records)
SELECT
YFIRM,
YOFFIC,
YACCT,
COUNT(*) --Records
FROM [dbo].[GNACMFF1_File_Current]
WHERE (YINACT='') --"Active" Accounts ONLY
GROUP BY
YFIRM,
YOFFIC,
YACCT

--***************************************************************************
-- Generate Related_Account
--***************************************************************************
UPDATE #Accounts
SET Related_Account =
	CASE YOFFIC
		WHEN '' THEN RTRIM(YFIRM) + '-' + RTRIM(YACCT)
		ELSE RTRIM(YFIRM) + '-' + RTRIM(YOFFIC) + '-' + RTRIM(YACCT)
	END


SELECT *
FROM #Accounts
ORDER BY
YFIRM,
YOFFIC,
YACCT

DROP TABLE #Related_Accounts
DROP TABLE #Accounts

SET NOCOUNT OFF