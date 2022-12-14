
GO
/****** Object:  Table [dbo].[CxcMavi]    Script Date: 23/09/2022 07:40:42 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CxcMavi](
	[ID] [int] NOT NULL,
	[MaxDiasVencidosMAVI] [float] NULL,
	[MopAnteriorMAVI] [int] NULL,
	[MopMavi] [int] NULL,
	[MaxDiasInactivosMAVI] [float] NULL,
	[DiasVencActMAVI] [float] NULL,
	[DiasInacActMAVI] [float] NULL,
	[MopActMAVI] [float] NULL,
	[Fecha1erIncumplimiento] [datetime] NULL,
	[FechaUltAbono] [datetime] NULL,
 CONSTRAINT [priCxcMavi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CxcMavi] ADD  DEFAULT ('19000101') FOR [Fecha1erIncumplimiento]
GO
