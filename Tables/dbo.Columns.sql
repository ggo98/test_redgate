CREATE TABLE [dbo].[Columns]
(
[ID] [bigint] NOT NULL IDENTITY(1, 1),
[Entity_ID] [int] NOT NULL,
[Name] [nvarchar] (128) COLLATE Latin1_General_CI_AS NOT NULL,
[Type] [int] NOT NULL,
[Length] [int] NOT NULL,
[Scale] [int] NOT NULL,
[Nullable] [bit] NOT NULL,
[ColNo] [int] NOT NULL,
[KeyIndex] [int] NOT NULL,
[Description] [text] COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Columns] ADD CONSTRAINT [PK_Columns] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UKC_Columns2] ON [dbo].[Columns] ([Entity_ID], [ColNo]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UKC_Columns] ON [dbo].[Columns] ([Entity_ID], [Name]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Columns] ADD CONSTRAINT [FK_Columns_Entity] FOREIGN KEY ([Entity_ID]) REFERENCES [dbo].[Entities] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
