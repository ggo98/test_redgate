SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[sp_RelationsView]
as
    set nocount on

    SELECT *
	FROM [dbo].[RelationsView] 
	order by MachineName, NameSpace, SourceEntityName, Name
GO
