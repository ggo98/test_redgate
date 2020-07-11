CREATE TABLE [dbo].[CachingRules]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Description] [nvarchar] (320) COLLATE Latin1_General_CI_AS NOT NULL,
[Assembly] [nvarchar] (256) COLLATE Latin1_General_CI_AS NULL,
[TypeName] [nvarchar] (256) COLLATE Latin1_General_CI_AS NOT NULL,
[Parameters] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CachingRules] ADD CONSTRAINT [PK_CachingRules] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UKC_CachingRules] ON [dbo].[CachingRules] ([ID], [Description]) ON [PRIMARY]
GO
