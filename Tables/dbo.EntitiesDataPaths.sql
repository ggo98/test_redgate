CREATE TABLE [dbo].[EntitiesDataPaths]
(
[ID] [bigint] NOT NULL IDENTITY(1, 1),
[EntityParametersValues_ID] [bigint] NOT NULL,
[RelativePath] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[FileName] [nvarchar] (128) COLLATE Latin1_General_CI_AS NULL,
[TTLInSeconds] [int] NULL,
[PathType] [int] NULL,
[CreationTimeUTC] [datetime] NULL CONSTRAINT [DF_dbo_EntitiesDataPaths] DEFAULT (getutcdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EntitiesDataPaths] ADD CONSTRAINT [PK_EntitiesDataPaths] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UKC_EntitiesDataPaths] ON [dbo].[EntitiesDataPaths] ([EntityParametersValues_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EntitiesDataPaths] ADD CONSTRAINT [FK_EntitiesDataPaths_EntitiesParametersValues] FOREIGN KEY ([EntityParametersValues_ID]) REFERENCES [dbo].[EntitiesParametersValues] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
