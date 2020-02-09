
CREATE PROC [dbo].[InsertSocialJson] 
@JSON nvarchar(max) 
,@UserID nvarchar(250)   = '7e2e39b42046af4fa0b8b43'
as 
--DECLARE @UserID nvarchar(25) = '7e2e39b42046af4fa0b8b43'
--DECLARE @JSON nvarchar(max)  = ' [{
--        "Handle": "crjackson1978",
--        "Network": "Twitter",
--        "Company": "Uber",
--		"CompanyID" : "4",
--        "Num": "2"
		
--        }, {
--       "Handle": "crjackson1978",
--        "Network": "Twitter",
--        "Company": "McDonald''s",
--		"CompanyID": "1",
--        "Num": "1"
--        }, {
--        "Handle": "crjackson1978",
--        "Network": "Twitter",
--        "Company": "Starbucks",
--		"CompanyID" : "3",
--        "Num": "2"
--    }]
--'
delete from dbo.TwitterRecomendations  
where exists ( select 
 @UserID
  from OPENJSON(@JSON) 
  WITH 
  ( Handle nvarchar(100)
  ,Network nvarchar(100)
  ,Company nvarchar(250)
  ,CompanyID int
  ,Num int)
  where TwitterRecomendations.UserID = @UserID
  and  TwitterRecomendations.SocialNetwork = Network
  and TwitterRecomendations.Handle = Handle
 )


 Insert into dbo.TwitterRecomendations(UserID,Handle,SocialNetwork,Socialcompany,NumMentions,CompanyID)
  select 
 @userID,Handle,Network,Company,Num,companyID
  from OPENJSON(@JSON) 
  WITH 
  ( Handle nvarchar(100)
  ,Network nvarchar(100)
  ,Company nvarchar(250)
  ,CompanyID int
  ,Num int)