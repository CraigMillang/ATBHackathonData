CREATE TABLE [dbo].[CompanyInfo]
(
	[Id] INT NOT NULL IDENTITY, 
    [Name] nvarchar(200) NULL, 
	[Exchange] nvarchar(100) NULL,
    [Stock Ticker] nvarchar(10) NULL, 
    [PE] DECIMAL(18, 2) NULL, 
    [PEAverage] DECIMAL NULL, 
    [PEIndicator] INT NULL, 
    [5YearRoR] DECIMAL(6, 2) NULL, 
    [MarketCap] BIGINT NULL, 
    [Price2Book] DECIMAL(6, 2) NULL, 
    [DividendRate] DECIMAL(4, 2) NULL, 
    [CSR] INT NULL, 
    CONSTRAINT [PK_CompanyInfo] PRIMARY KEY ([Id])   
)
