CREATE TABLE [dbo].[EntitiesParametersValues]
(
[ID] [bigint] NOT NULL IDENTITY(1, 1),
[UserAndEntity_ID] [int] NOT NULL,
[ParametersValuesSHA1] [binary] (20) NOT NULL,
[ParametersValues] [ntext] COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EntitiesParametersValues] ADD CONSTRAINT [PK_EntitiesParametersValues] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UKC_EntitiesParametersValues] ON [dbo].[EntitiesParametersValues] ([UserAndEntity_ID], [ParametersValuesSHA1]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EntitiesParametersValues] ADD CONSTRAINT [FK_EntitiesParametersValues_UserAndEntities] FOREIGN KEY ([UserAndEntity_ID]) REFERENCES [dbo].[UserAndEntities] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
