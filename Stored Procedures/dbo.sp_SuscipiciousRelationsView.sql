SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[sp_SuscipiciousRelationsView]
as
    set nocount on

    SELECT *
	FROM [dbo].[SuscipiciousRelationsView] 
	order by MachineName, NameSpace, SourceEntityName, Name
GO
