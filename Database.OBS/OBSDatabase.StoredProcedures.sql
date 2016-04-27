-- --------------------------------------------------
-- Date Created: 1/20/2016 13:25:25
-- Author: tommy yang
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [{0}];
GO
IF SCHEMA_ID(N'{1}') IS NULL EXECUTE(N'CREATE SCHEMA [{1}]');
GO

IF(OBJECT_ID('[{1}].[SaveDep]', 'p') IS NOT NULL)
	DROP PROC [{1}].[SaveDep]
GO
CREATE PROCEDURE [{1}].[SaveDep](
	@Id UNIQUEIDENTIFIER,   
	@Time BIGINT,
	@User NVARCHAR(255),
	@Action NVARCHAR(100),
	@FileName NVARCHAR(255),
	@FileLocation NVARCHAR(255),
	@Browser NVARCHAR(255),
	@AccessedIPAddress NVARCHAR(100),
	@SiteLocation NVARCHAR(255)
)
AS
	INSERT INTO [{1}].[Audits] (Id,Time,[User],Action,FileName,FileLocation,Browser,AccessedIPAddress) VALUES (@Id, @Time, @User, @Action, @FileName, @FileLocation, @Browser, @AccessedIPAddress)
GO