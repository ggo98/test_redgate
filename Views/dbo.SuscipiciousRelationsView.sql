SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
create view [dbo].[SuscipiciousRelationsView] as
select 
	ID,
	MachineName,
	NameSpace,
	Name,
	SourceEntityName,
	TargetEntityName,
	SourceColumnName,
	TargetColumnName,
	case 
	when ((Multiplicity = 1 or Multiplicity = 2) and TargetKeyIndex < 1) -- Multiplicity is One or ZeroOrOne but target is not a KEY
		or 
		(Multiplicity = 3 and TargetKeyIndex > 0) -- Multipliciy is Many but target is a KEY
	then TargetEntityName 
	end as SucipiciousEntityName,
	case 
	when ((Multiplicity = 1 or Multiplicity = 2) and TargetKeyIndex < 1) -- Multipliciy is One or ZeroOrOne but target is not a KEY
		or 
		(Multiplicity = 3 and TargetKeyIndex > 0) -- Multiplicity is Many but target is a KEY
	then TargetColumnName 
	end as SucipiciousColumnName,
	Multiplicity,
	TargetKeyIndex
from
	[dbo].[RelationsView]
where
	((Multiplicity = 1 or Multiplicity = 2) and TargetKeyIndex < 1) -- Multipliciy is One or ZeroOrOne but target is not a KEY
	or 
	(Multiplicity = 3 and TargetKeyIndex > 0) -- Multiplicity is Many but target is a KEY
GO
