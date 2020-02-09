CREATE TABLE [dbo].[TranCompanies]
(
	[TranCompanyName] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [CompanyID] INT NULL, 
    CONSTRAINT [FK_TranCompanies_CompanyInfo] FOREIGN KEY (CompanyId) REFERENCES CompanyInfo(ID)
)
