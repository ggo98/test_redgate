SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[sp_CreateAssociation](@NameSpace nvarchar(320),
	@SourceEntity nvarchar(128),
	@multiplicity smallint,
	@TargetEntity nvarchar(128),
	@AssociationName nvarchar(300) = null
)
as
	declare @SourceNameSpace_ID INT;
	declare @TargetNameSpace_ID INT;
	declare @ID INT;
	if (@AssociationName is NULL)
		set @AssociationName = @SourceEntity + '_' + @TargetEntity;

	select @SourceNameSpace_ID=(select ID from namespaces where Name=@NameSpace);

	select @ID=ID from Associations where 
		@SourceNameSpace_ID=(select TOP 1 NameSpace_ID from Entities where Name=@SourceEntity)
		and Name=@AssociationName;
		
	if (@ID is NULL)
	begin
		print 'null';
		insert into Associations
		select
		@AssociationName, -- Relation Name
		(select ID from entities where Name = @SourceEntity 
			and NameSpace_ID = (select ID from namespaces where Name = @NameSpace)), -- Source Entity
		(select ID from entities where Name = @TargetEntity
			and NameSpace_ID = (select ID from namespaces where Name = @NameSpace)), -- Target Entity
		@multiplicity;
		set @ID=@@IDENTITY;
		print '(just generated): ' + convert(varchar(32), @ID);

	end
	else
		print '(already exists): ' + convert(varchar(32), @ID);
GO
