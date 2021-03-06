/****** Object:  Table [dbo].[Capsules]    Script Date: 28/03/2016 09:06:27 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Capsules](
	[CapsuleId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](8) NOT NULL,
	[Name] [varchar](40) NULL CONSTRAINT [DF_Capsules_Name]  DEFAULT (''),
	[UserId] [varchar](100) NOT NULL,
	[ItemId] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Capsules] PRIMARY KEY CLUSTERED 
(
	[CapsuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CapsulesItems]    Script Date: 28/03/2016 09:06:27 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CapsulesItems](
	[CapsuleId] [int] NOT NULL,
	[ItemId] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_CapsulesItems] PRIMARY KEY CLUSTERED 
(
	[CapsuleId] ASC,
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventories]    Script Date: 28/03/2016 09:06:27 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventories](
	[InventoryId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Inventories] PRIMARY KEY CLUSTERED 
(
	[InventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InventoriesItems]    Script Date: 28/03/2016 09:06:27 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InventoriesItems](
	[InventoryId] [int] NOT NULL,
	[ItemId] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_InventoriesItems] PRIMARY KEY CLUSTERED 
(
	[InventoryId] ASC,
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Spawns]    Script Date: 28/03/2016 09:06:27 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Spawns](
	[SpawnId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](100) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Spawns] PRIMARY KEY CLUSTERED 
(
	[SpawnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SpawnsCapsules]    Script Date: 28/03/2016 09:06:27 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SpawnsCapsules](
	[SpawnId] [int] NOT NULL,
	[CapsuleCode] [varchar](8) NOT NULL,
 CONSTRAINT [PK_SpawnsCapsules] PRIMARY KEY CLUSTERED 
(
	[SpawnId] ASC,
	[CapsuleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SpawnsCapsulesItems]    Script Date: 28/03/2016 09:06:27 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SpawnsCapsulesItems](
	[SpawnId] [int] NOT NULL,
	[CapsuleCode] [varchar](8) NOT NULL,
	[ItemId] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_SpawnsCapsulesItems] PRIMARY KEY CLUSTERED 
(
	[SpawnId] ASC,
	[CapsuleCode] ASC,
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CapsulesItems]  WITH CHECK ADD  CONSTRAINT [FK_CapsulesItems_Capsules] FOREIGN KEY([CapsuleId])
REFERENCES [dbo].[Capsules] ([CapsuleId])
GO
ALTER TABLE [dbo].[CapsulesItems] CHECK CONSTRAINT [FK_CapsulesItems_Capsules]
GO
ALTER TABLE [dbo].[InventoriesItems]  WITH CHECK ADD  CONSTRAINT [FK_InventoriesItems_Inventories] FOREIGN KEY([InventoryId])
REFERENCES [dbo].[Inventories] ([InventoryId])
GO
ALTER TABLE [dbo].[InventoriesItems] CHECK CONSTRAINT [FK_InventoriesItems_Inventories]
GO
ALTER TABLE [dbo].[SpawnsCapsules]  WITH CHECK ADD  CONSTRAINT [FK_SpawnsCapsules_Spawns] FOREIGN KEY([SpawnId])
REFERENCES [dbo].[Spawns] ([SpawnId])
GO
ALTER TABLE [dbo].[SpawnsCapsules] CHECK CONSTRAINT [FK_SpawnsCapsules_Spawns]
GO
ALTER TABLE [dbo].[SpawnsCapsulesItems]  WITH CHECK ADD  CONSTRAINT [FK_SpawnsCapsulesItems_SpawnsCapsules] FOREIGN KEY([SpawnId], [CapsuleCode])
REFERENCES [dbo].[SpawnsCapsules] ([SpawnId], [CapsuleCode])
GO
ALTER TABLE [dbo].[SpawnsCapsulesItems] CHECK CONSTRAINT [FK_SpawnsCapsulesItems_SpawnsCapsules]
GO
