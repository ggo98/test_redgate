CREATE TABLE [dbo].[Entities]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[NameSpace_ID] [int] NOT NULL,
[CachingRule_ID] [int] NULL,
[Name] [nvarchar] (128) COLLATE Latin1_General_CI_AS NOT NULL,
[Flags] [int] NOT NULL,
[CreationTimeUTC] [datetime] NULL,
[Description] [text] COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [PK_Entities] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UKC_Entities] ON [dbo].[Entities] ([NameSpace_ID], [Name]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [FK_Entities_CachingRules] FOREIGN KEY ([CachingRule_ID]) REFERENCES [dbo].[CachingRules] ([ID]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [FK_Entities_NameSpaces] FOREIGN KEY ([NameSpace_ID]) REFERENCES [dbo].[NameSpaces] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
