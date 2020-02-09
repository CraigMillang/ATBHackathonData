CREATE TABLE [dbo].[TwitterRecomendations]
(
	[UserID] NVARCHAR(250) NOT NULL , 
    [SocialNetwork] NVARCHAR(50) NOT NULL, 
    [Handle] NVARCHAR(100) NOT NULL, 
    [SocialCompany] NVARCHAR(25) NOT NULL, 
    [NumMentions] INT NULL, 
    [CompanyID] NCHAR(10) NULL, 
    PRIMARY KEY ([UserID], [SocialNetwork], [Handle],[SocialCompany])
)
