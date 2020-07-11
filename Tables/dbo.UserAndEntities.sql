CREATE TABLE [dbo].[UserAndEntities]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[User_ID] [int] NOT NULL,
[Entity_ID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserAndEntities] ADD CONSTRAINT [PK_UserAndEntities] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UKC_UserAndEntities] ON [dbo].[UserAndEntities] ([User_ID], [Entity_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserAndEntities] ADD CONSTRAINT [FK_UserAndEntities_Entities] FOREIGN KEY ([Entity_ID]) REFERENCES [dbo].[Entities] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[UserAndEntities] ADD CONSTRAINT [FK_UserAndEntities_Users] FOREIGN KEY ([User_ID]) REFERENCES [dbo].[Users] ([ID])
GO
