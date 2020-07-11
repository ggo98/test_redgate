CREATE TABLE [dbo].[Associations]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (300) COLLATE Latin1_General_CI_AS NOT NULL,
[SourceEntity_ID] [int] NOT NULL,
[TargetEntity_ID] [int] NOT NULL,
[Multiplicity] [smallint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Associations] ADD CONSTRAINT [PK_Associations] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Associations] ON [dbo].[Associations] ([SourceEntity_ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UKC_Associations] ON [dbo].[Associations] ([SourceEntity_ID], [TargetEntity_ID], [Name]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Associations1] ON [dbo].[Associations] ([TargetEntity_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Associations] ADD CONSTRAINT [FK_Associations_Entities] FOREIGN KEY ([SourceEntity_ID]) REFERENCES [dbo].[Entities] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Associations] ADD CONSTRAINT [FK_Associations_Entities1] FOREIGN KEY ([TargetEntity_ID]) REFERENCES [dbo].[Entities] ([ID])
GO
