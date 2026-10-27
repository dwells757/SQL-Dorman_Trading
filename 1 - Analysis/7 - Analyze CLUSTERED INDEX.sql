SELECT name, type_desc 
FROM sys.indexes 
WHERE object_id = OBJECT_ID('[dbo].[ST4F1_File_History_TEST]') 
  AND type_desc IN ('CLUSTERED', 'CLUSTERED COLUMNSTORE');
