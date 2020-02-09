CREATE TABLE [dbo].[CompanyInfo]
(
	[Id] INT NOT NULL IDENTITY, 
    [Name] NCHAR(10) NULL, 
    [Stock Ticker] NCHAR(10) NULL, 
    CONSTRAINT [PK_CompanyInfo] PRIMARY KEY ([Id])   
)
