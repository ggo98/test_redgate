SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO





CREATE view [dbo].[ColumnsView] as
select 
'fix_n_V1' fix_n_V1,
'V2' v2,
'change3' test,
'change_by_admin' change_by_admin,
'change_by_admin2' change_by_admin2,
'change_by_admin3' change_by_admin3,
'change_by_admin4' change_by_admin4,
'change_by_ggo1' change_by_ggo1,
'change_by_ggo2' change_by_ggo2,
	T3.ID as ID,
	T0.Name as MachineName,
	T1.Name as NameSpace, 
	T2.Name as EntityName, 
	T2.CreationTimeUTC as EntityCreationTimeUTC,
	T3.Name as Name, 
	T3.Type as Type, 
	T3.Length as Length, 
	T3.Scale as Scale,
	T3.Nullable as Nullable,
	T3.Colno as Colno,
	T3.KeyIndex as KeyIndex,
	T3.Description as Description
from Machines T0
inner join NameSpaces T1
on T0.ID = T1.Machine_ID
inner join Entities T2 
on T1.ID = T2.NameSpace_ID
inner join Columns T3
on T2.ID = T3.Entity_ID




GO
