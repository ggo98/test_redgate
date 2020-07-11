CREATE TABLE [dbo].[Machines]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (128) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Machines] ADD CONSTRAINT [PK_Machines] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UKC_Machines] ON [dbo].[Machines] ([Name]) ON [PRIMARY]
GO
