SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[sp_ColumnsView]
as
    set nocount on

    SELECT *
	FROM [dbo].[ColumnsView] 
	order by MachineName, NameSpace, EntityName, Colno
GO
