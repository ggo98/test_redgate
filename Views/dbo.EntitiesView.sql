SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
create view [dbo].[EntitiesView] as
select 
	T2.ID as ID,
	T0.Name as MachineName,
	T1.Name as NameSpace, 
	T2.Name as EntityName, 
	T2.CreationTimeUTC as EntityCreationTimeUTC,
	T2.Flags as EntityFlags, 
	T3.Description as Caching,
	T3.ID as Caching_ID,
	T3.Assembly as CachingAssembly,
	T3.TypeName as CachingType,
	T3.Parameters as CachingParameters
from Machines T0
inner join NameSpaces T1
on T0.ID = T1.Machine_ID
inner join Entities T2 
on T1.ID = T2.NameSpace_ID
left join CachingRules T3
on T2.CachingRule_ID = T3.ID
GO
