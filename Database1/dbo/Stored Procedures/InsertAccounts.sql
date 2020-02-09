CREATE PROC InsertAccounts 
@JSON nvarchar(max) 
,@UserName nvarchar(250) 
as 


 INSERT INTO [dbo].[AccountsJson] (Userid,AccountID,Label,bank_id)

  select @UserName ,id,label,bank_id from OPENJSON(@JSON) 
  with ( 
  id nvarchar (500)
  ,label nvarchar(250)
  ,bank_id nvarchar(250)
  )
  where not exists (select AccountID,bank_id from AccountsJson ajs where  ajs.AccountID = id and ajs.bank_id = bank_id)