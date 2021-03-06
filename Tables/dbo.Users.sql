CREATE TABLE [dbo].[Users]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Machine_ID] [int] NOT NULL,
[Name] [nvarchar] (128) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UKC_Users] ON [dbo].[Users] ([Machine_ID], [Name]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [FK_Users_Machines] FOREIGN KEY ([Machine_ID]) REFERENCES [dbo].[Machines] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
