CREATE TABLE [dbo].[Relations]
(
[ID] [bigint] NOT NULL IDENTITY(1, 1),
[Association_ID] [int] NOT NULL,
[SourceColumn_ID] [bigint] NOT NULL,
[TargetColumn_ID] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Relations] ADD CONSTRAINT [PK_Relations] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Relations_SourceColumn_ID] ON [dbo].[Relations] ([Association_ID], [SourceColumn_ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UKC_Relations] ON [dbo].[Relations] ([Association_ID], [SourceColumn_ID], [TargetColumn_ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Relations_TargetColumn_ID] ON [dbo].[Relations] ([Association_ID], [TargetColumn_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Relations] ADD CONSTRAINT [FK_Relations_Associations] FOREIGN KEY ([Association_ID]) REFERENCES [dbo].[Associations] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Relations] ADD CONSTRAINT [FK_Relations_Columns] FOREIGN KEY ([SourceColumn_ID]) REFERENCES [dbo].[Columns] ([ID])
GO
ALTER TABLE [dbo].[Relations] ADD CONSTRAINT [FK_Relations_Columns1] FOREIGN KEY ([TargetColumn_ID]) REFERENCES [dbo].[Columns] ([ID])
GO
