CREATE TABLE [dbo].[AccountsJson] (
    [UserID]    NVARCHAR (250) NOT NULL,
    [AccountID] NVARCHAR (250) NOT NULL,
    [Label]     NVARCHAR (200) NULL,
    [bank_id]   NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC, [AccountID] ASC),
    CONSTRAINT [FK_AccountsJson_Bank_ID] FOREIGN KEY ([bank_id]) REFERENCES [dbo].[Bank] ([BankId]), 
    CONSTRAINT [FK_AccountsJson_User (UserName)] FOREIGN KEY (UserID) REFERENCES [User](UserName)
);


