CREATE TABLE [dbo].[TwitterRecomendations]
(
	[UserID] NVARCHAR(250) NOT NULL , 
    [SocialNetwork] NVARCHAR(50) NOT NULL, 
    [Handle] NVARCHAR(100) NOT NULL, 
    [SocialCompany] NCHAR(10) NOT NULL, 
    [NumMentions] INT NULL, 
    [CompanyID] INT NULL, 
    PRIMARY KEY ([UserID], [SocialNetwork], [Handle],[SocialCompany]), 
    CONSTRAINT [FK_TwitterRecomendations_CompanyInof] FOREIGN KEY (CompanyID) REFERENCES CompanyInfo(ID), 
    CONSTRAINT [FK_TwitterRecomendations_User] FOREIGN KEY (UserID) REFERENCES [User](UserName)
)
