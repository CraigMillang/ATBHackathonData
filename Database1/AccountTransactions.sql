CREATE TABLE [dbo].[AccountTransactions]
(
	[TransactionID] NVARCHAR(250) NOT NULL PRIMARY KEY, 
    [AccountID] NVARCHAR(520) NULL, 
 
    [Transaction_Type] NVARCHAR(50) NULL, 
    [Name] NVARCHAR(50) NULL, 
    [Amount] MONEY NULL, 
    [Currency] NVARCHAR(50) NULL, 
    [date] DATE NULL
)
