SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
create view [dbo].[CachedDataView] as
select 
	EntitiesDataPaths.ID as ID,
	machines.Name as MachineName,
	users.Name as UserName,
	nameSpaces.Name as NameSpace,
	entities.Name as EntityName,
	T6.ParametersValues as ParametersValues,
	T6.ParametersValuesSHA1 as ParametersValuesSHA1,
	entitiesDataPaths.RelativePath as RelativePath,
	entitiesDataPaths.FileName as FileName,
	entitiesDataPaths.CreationTimeUTC as CreationTimeUTC,
	entitiesDataPaths.TTLInSeconds as TimeToLiveInSeconds,
	dateadd(s,entitiesDataPaths.TTLInSeconds, entitiesDataPaths.CreationTimeUTC) as ExpirationTimeUTC
from Machines machines
inner join Users users
on machines.ID = users.Machine_ID
inner join UserAndEntities userAndEntities
on users.ID = userAndEntities.User_ID
inner join Entities entities
on entities.ID = userAndEntities.Entity_ID
inner join NameSpaces nameSpaces
on entities.NameSpace_ID = nameSpaces.ID
inner join EntitiesParametersValues T6
on userAndEntities.ID = T6.UserAndEntity_ID
inner join EntitiesDataPaths entitiesDataPaths
on T6.ID = entitiesDataPaths.EntityParametersValues_ID
GO
