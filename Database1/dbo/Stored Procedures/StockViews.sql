CREATE PROCEDURE [dbo].[StockViews] 
 @UserID nvarchar(200) ='7e2e39b42046af4fa0b8b43'
as 

SELECT  
AC.UserID
,ci.Id
--,CI.Name
--,CI.Exchange
--,CI.[Stock Ticker]
--,Ci.PEIndicator
--,ci.[5YearRoR]
--,ci.MarketCap
--,ci.Price2Book
--,ci.DividendRate
--,ci.CSR
,count(1) as Num 
into #TempCount
FROM AccountTransactions ACT
LEFT JOIN AccountsJson AC
ON AC.AccountID = ACT.AccountID
LEFT JOIN TranCompanies tc 
ON TC.TranCompanyName = ACT.Name
LEFT JOIN CompanyInfo CI 
ON CI.Id = TC.CompanyID
where ci.Id is not null
and ac.UserID = '7e2e39b42046af4fa0b8b43'
Group by 
AC.UserID
,ci.Id

select top 5
isnull(tr.UserID,tc.UserID)
,CI.Name
,CI.Exchange
,CI.[Stock Ticker]
,Ci.PEIndicator
,ci.[5YearRoR]
,ci.MarketCap
,ci.Price2Book
,ci.DividendRate
,ci.CSR
,(isnull(tr.NumMentions,0) +isnull(tc.Num,0)) as Num

From [dbo].[TwitterRecomendations] tr
 full outer  join #Tempcount tc 
on tc.Id = tr.CompanyID
LEFT JOIN CompanyInfo CI 
ON CI.Id = isnull(Tr.CompanyID,tc.Id)
where ci.Id is not null
and isnull(tr.UserID,tc.UserID) = '7e2e39b42046af4fa0b8b43'
order by (isnull(tr.NumMentions,0) +isnull(tc.Num,0))