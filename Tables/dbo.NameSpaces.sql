CREATE TABLE [dbo].[NameSpaces]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Machine_ID] [int] NOT NULL,
[Name] [nvarchar] (320) COLLATE Latin1_General_CI_AS NOT NULL,
[Description] [ntext] COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NameSpaces] ADD CONSTRAINT [PK_NameSpaces] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UKC_NameSpaces] ON [dbo].[NameSpaces] ([Machine_ID], [Name]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NameSpaces] ADD CONSTRAINT [FK_NameSpaces_Machines] FOREIGN KEY ([Machine_ID]) REFERENCES [dbo].[Machines] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
