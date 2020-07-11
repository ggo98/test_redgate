SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
create view [dbo].[RelationsView] as
select 
	Associations.ID as ID,
	Machines.Name as MachineName,
	NameSpaces.Name as NameSpace, 
	Associations.Name as Name,
	(select Name from Entities 
	where ID = (select Entity_ID from Columns where ID = SourceColumn_ID)
	) as SourceEntityName,
	Associations.Multiplicity as Multiplicity,
	(select Name from Entities 
	where ID = (select Entity_ID from Columns where ID = TargetColumn_ID)
	) as TargetEntityName,
	(select KeyIndex from Columns where Columns.ID = Relations.SourceColumn_ID) as SourceKeyIndex,
	(select KeyIndex from Columns where Columns.ID = Relations.TargetColumn_ID) as TargetKeyIndex,
	(select Name from Columns
	where ID = Relations.SourceColumn_ID) as SourceColumnName,
	(select Name from Columns
	where ID = Relations.TargetColumn_ID) as TargetColumnName,
	(select Type from Columns where Columns.ID = Relations.SourceColumn_ID) as SourceType,
	(select Type from Columns where Columns.ID = Relations.TargetColumn_ID) as TargetType,
	(select Length from Columns where Columns.ID = Relations.SourceColumn_ID) as SourceLength,
	(select Length from Columns where Columns.ID = Relations.TargetColumn_ID) as TargetLength,
	(select Scale from Columns where Columns.ID = Relations.SourceColumn_ID) as SourceScale,
	(select Scale from Columns where Columns.ID = Relations.TargetColumn_ID) as TargetScale,
	(select Nullable from Columns where Columns.ID = Relations.SourceColumn_ID) as SourceNullable,
	(select Nullable from Columns where Columns.ID = Relations.TargetColumn_ID) as TargetNullable,
	(select ColNo from Columns where Columns.ID = Relations.SourceColumn_ID) as SourceColNo,
	(select ColNo from Columns where Columns.ID = Relations.TargetColumn_ID) as TargetColNo,
	(select Description from Columns where Columns.ID = Relations.SourceColumn_ID) as SourceDescription,
	(select Description from Columns where Columns.ID = Relations.TargetColumn_ID) as TargetDescription
from Associations Associations
inner join Relations Relations
	on Associations.ID = Relations.Association_ID
inner join NameSpaces NameSpaces
	on NameSpaces.ID = (select top 1 NameSpace_ID from Entities where ID = SourceEntity_ID)
inner join Machines Machines
	on Machines.ID = NameSpaces.Machine_ID
GO
