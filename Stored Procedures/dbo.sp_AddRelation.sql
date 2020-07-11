SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[sp_AddRelation](@NameSpace nvarchar(128),
	@SourceEntity nvarchar(128),
	@TargetEntity nvarchar(128),
	@SourceColumn nvarchar(128),
	@TargetColumn nvarchar(128),
	@AssociationName nvarchar(300) = null
)
as
	declare @id INT;
	DECLARE @s varchar(2048)
	if (@AssociationName is NULL)
		set @AssociationName = @SourceEntity + '_' + @TargetEntity;

	select @ID=ID from Associations where Name=@AssociationName;
	if (@ID is NULL)
	begin
		set @s = 'An association named [' + @AssociationName + '] does not exist.';
		RAISERROR(@s, 16,1);
		return(50000);
	end
	else
		print convert(varchar(32), @ID)

	insert into Relations
	select 
	--@ID,
	(select ID from Associations where Name=@AssociationName),
	(select ID from Columns 
	where 
		Entity_ID = 
			(select ID from entities where Name = @SourceEntity 
			and NameSpace_ID = (select ID from namespaces where Name = @NameSpace)
			)
		and Name = @TargetColumn) x, -- Source Key
	(select ID from Columns where 
		Entity_ID = 
			(select ID from entities where Name = @TargetEntity 
			and NameSpace_ID = (select ID from namespaces where Name = @NameSpace))
		and Name = @TargetColumn) y -- Target Key
GO
