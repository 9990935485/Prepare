USE [PREcare]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 02/05/2018 07:14:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Address_Id]  DEFAULT (newid()),
	[Address1] [varchar](200) NOT NULL,
	[Address2] [varchar](200) NULL,
	[CountryId] [uniqueidentifier] NOT NULL,
	[StateId] [uniqueidentifier] NOT NULL,
	[City] [varchar](50) NOT NULL,
	[PinCode] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 02/05/2018 07:14:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Country_Id]  DEFAULT (newid()),
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 02/05/2018 07:14:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Role_Id]  DEFAULT (newid()),
	[Name] [varchar](20) NOT NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[School]    Script Date: 02/05/2018 07:14:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School](
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_School_Id]  DEFAULT (newid()),
	[Name] [nvarchar](200) NOT NULL,
	[RegistrationNumber] [nvarchar](50) NULL,
	[AddressId] [uniqueidentifier] NOT NULL,
	[ContactNumber] [bigint] NOT NULL,
	[AlternateNumber] [bigint] NULL,
	[ContactPersonName] [nvarchar](200) NULL,
	[ContactPersonNumber] [bigint] NULL,
	[WebsiteUrl] [nvarchar](200) NULL,
	[Logo] [image] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 02/05/2018 07:14:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_State_Id]  DEFAULT (newid()),
	[CountryId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 02/05/2018 07:14:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_User_Id]  DEFAULT (newid()),
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[SchoolId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[ContactNumber] [bigint] NOT NULL,
	[AlternateNumber] [bigint] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_User_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Address] ([Id], [Address1], [Address2], [CountryId], [StateId], [City], [PinCode]) VALUES (N'a82f076d-db44-4c66-b77c-ac9ff1c8dac3', N'Gurgaon', NULL, N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'53d66083-4bb2-4f04-a9de-60e0be959e15', N'Gurgaon', 122001)
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'India')
GO
INSERT [dbo].[Role] ([Id], [Name], [Sequence]) VALUES (N'409250f9-8426-4d40-90fe-547ba86cd9c1', N'SuperAdmin
', 1)
GO
INSERT [dbo].[Role] ([Id], [Name], [Sequence]) VALUES (N'fd56046c-2645-46da-84f1-98b943f8a3df', N'Admin', 2)
GO
INSERT [dbo].[Role] ([Id], [Name], [Sequence]) VALUES (N'33acc58b-0d67-4714-b2dc-dacf1c4d40a1', N'SchoolAdmin
', 3)
GO
INSERT [dbo].[Role] ([Id], [Name], [Sequence]) VALUES (N'd740bb6d-f12f-46b8-8c69-ef2fd80f713d', N'User', 4)
GO
INSERT [dbo].[School] ([Id], [Name], [RegistrationNumber], [AddressId], [ContactNumber], [AlternateNumber], [ContactPersonName], [ContactPersonNumber], [WebsiteUrl], [Logo], [CreatedOn], [CreatedBy]) VALUES (N'141cb20f-f8d7-4837-a92c-8d8ca7eba1da', N'PREcare', NULL, N'a82f076d-db44-4c66-b77c-ac9ff1c8dac3', 9990935485, 9871263947, N'Vijay', 9990935485, N'precare.com', NULL, CAST(N'2018-04-27 09:01:11.000' AS DateTime), NULL)
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'c76037ec-8aa4-4cf7-b34f-011fb82c0ad8', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'MADHYA PRADESH')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'7d35a32f-8002-43da-a37a-017c579153cc', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'CHATTISGARH')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'253980a0-fdd3-4b69-805e-09e557957163', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'TRIPURA')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'55f3c7d9-269a-4b88-a497-2634105b2a7b', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'ANDAMAN & NICOBAR')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'cf14020e-5dc7-484c-8eb4-28051e04f192', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'MEGHALAYA')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'724c3926-981a-4066-aa63-3128cdb91bcb', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'WEST BENGAL')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'202d6ec1-81ba-4010-8881-3ed6d2862c1b', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'TAMIL NADU')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'0da04fc4-77be-4811-814b-461850ca78ca', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'RAJASTHAN')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'cc7d4488-7e7d-44eb-a1e4-47f6249938fb', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'GUJRAT')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'5b9b9764-18a0-4f2c-b215-48190e549373', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'JAMMU & KASHMIR')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'1093e94a-aa6a-4974-af0d-4fcb696546ad', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'MANIPUR')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'2c7932d4-4284-4d1f-993c-5603f94ce261', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'HIMACHAL PRADESH')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'81a6bdeb-713c-4f40-aba3-591df842abae', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'GOA')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'53d66083-4bb2-4f04-a9de-60e0be959e15', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'HARYANA')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'70ec6b0e-64f1-4e74-bf2f-75e8dc19d0b3', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'DAMAN & DIU')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'67e3290b-6e05-40a4-9e21-78485a86e0c1', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'UTTAR PRADESH')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'5d72136d-65a8-4453-839e-8694f7b8c0ce', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'JHARKHAND')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'27bdbec1-353d-4601-a9fa-86b5dd741f85', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'ORISSA')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'e33e9b6c-dd13-4f05-950e-92b671eaa7e9', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'PUNJAB')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'd64cbf67-e9b3-471c-9677-ac2a8217f595', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'CHANDIGARH')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'a87bc010-dcf3-4f82-b66f-b11ca969a614', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'LAKSHDWEEP')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'b74f075d-8263-4acb-864d-b943cbf7ad04', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'ARUNACHAL PRADESH')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'a8d2069a-c1a0-48f1-b766-bc553fc69bb9', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'PONDICHERY')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'ad31c13e-c1a5-43b1-a6af-cd126109847b', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'ASSAM')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'140012c0-3f5b-475e-8774-d325d43bd4c2', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'KARNATAKA')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'd0f5be7f-ab2b-4d69-ad70-dfe7ff9129d7', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'SIKKIM')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'4d139846-fc88-44cc-bf11-e42892901e62', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'DADRA & NAGAR')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'6d42dfb6-8bb5-40b9-ab23-eb69c7201c02', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'UTTARANCHAL')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'bfd70d3a-19de-4ae2-9f91-edc20d654a0a', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'MIZORAM')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'8d641106-f571-4de0-9882-eea82d21d046', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'DELHI')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'97ef2e9b-3c60-46ed-81a4-ef2d1129497c', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'KERALA')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'29948741-d9b2-4c17-a3db-ef6026dc6c3f', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'NAGALAND')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'b94b2c5a-755d-4c54-800a-f924bce42e53', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'BIHAR')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'7dc03266-3820-452e-bae5-f9f3fa4b9781', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'ANDHRA PRADESH')
GO
INSERT [dbo].[State] ([Id], [CountryId], [Name]) VALUES (N'2453e254-50a6-45b2-99a3-fd42aec07b3f', N'f929a693-5597-4e72-9bbe-dee29a484a5a', N'MAHARASHTRA')
GO
INSERT [dbo].[User] ([Id], [FirstName], [MiddleName], [LastName], [UserName], [Password], [SchoolId], [RoleId], [Email], [ContactNumber], [AlternateNumber], [CreatedOn], [CreatedBy], [IsActive]) VALUES (N'b40134f6-631f-4931-a9d2-59e09c5272f8', N'Super', NULL, N'Admin', N'prepare', N'PREpare@123', N'141cb20f-f8d7-4837-a92c-8d8ca7eba1da', N'409250f9-8426-4d40-90fe-547ba86cd9c1', N'care@precare.com', 9990935485, 9871263947, CAST(N'2018-04-27 09:02:21.000' AS DateTime), NULL, 1)
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Country]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_State]
GO
ALTER TABLE [dbo].[School]  WITH CHECK ADD  CONSTRAINT [FK_School_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[School] CHECK CONSTRAINT [FK_School_Address]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
USE [master]
GO
ALTER DATABASE [PREcare] SET  READ_WRITE 
GO
