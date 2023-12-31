USE [SachOnline]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 21/10/2023 20:28:52  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chi_tiet_dat_hang]    Script Date: 21/10/2023 20:28:52  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_dat_hang](
	[chi_tiet_id] [int] IDENTITY(1,1) NOT NULL,
	[don_dat_hang_id] [int] NULL,
	[sach_id] [int] NULL,
	[so_luong] [int] NULL,
	[don_gia] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[chi_tiet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chu_de]    Script Date: 21/10/2023 20:28:52  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chu_de](
	[chu_de_id] [int] IDENTITY(1,1) NOT NULL,
	[ten_chu_de] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__chu_de__3FBE340A218589E3] PRIMARY KEY CLUSTERED 
(
	[chu_de_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[don_dat_hang]    Script Date: 21/10/2023 20:28:52  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[don_dat_hang](
	[don_dat_hang_id] [int] IDENTITY(1,1) NOT NULL,
	[khach_hang_id] [int] NULL,
	[ngay_dat] [date] NULL,
	[ngay_giao_hang] [date] NULL,
	[tinh_trang_giao_hang] [tinyint] NULL,
	[da_thanh_toan] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[don_dat_hang_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khach_hang]    Script Date: 21/10/2023 20:28:52  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khach_hang](
	[khach_hang_id] [int] IDENTITY(1,1) NOT NULL,
	[ten_khach_hang] [varchar](100) NULL,
	[dia_chi] [varchar](255) NULL,
	[email] [varchar](100) NULL,
	[TaiKhoan] [varchar](15) NULL,
	[MatKhau] [varchar](15) NULL,
	[DienThoai] [varchar](10) NULL,
	[NgaySinh] [smalldatetime] NULL,
 CONSTRAINT [PK__khach_ha__D69D1E8ABF6ED0AB] PRIMARY KEY CLUSTERED 
(
	[khach_hang_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nha_xuat_ban]    Script Date: 21/10/2023 20:28:52  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nha_xuat_ban](
	[nha_xuat_ban_id] [int] IDENTITY(1,1) NOT NULL,
	[ten_nha_xuat_ban] [nvarchar](100) NOT NULL,
	[dia_chi] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__nha_xuat__0AFFD5DE0A208FC6] PRIMARY KEY CLUSTERED 
(
	[nha_xuat_ban_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sach]    Script Date: 21/10/2023 20:28:52  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sach](
	[sach_id] [int] IDENTITY(1,1) NOT NULL,
	[ten_sach] [varchar](255) NOT NULL,
	[tac_gia_id] [int] NULL,
	[nha_xuat_ban_id] [int] NULL,
	[gia_tien] [decimal](10, 2) NOT NULL,
	[chu_de_id] [int] NULL,
	[anhSP] [nvarchar](255) NULL,
	[NgayCapNhap] [date] NULL,
	[mo_ta] [nvarchar](max) NULL,
 CONSTRAINT [PK__sach__C3F674294D59C3C7] PRIMARY KEY CLUSTERED 
(
	[sach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tac_gia]    Script Date: 21/10/2023 20:28:52  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tac_gia](
	[tac_gia_id] [int] IDENTITY(1,1) NOT NULL,
	[ten_tac_gia] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tac_gia_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[viet_sach]    Script Date: 21/10/2023 20:28:52  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[viet_sach](
	[tac_gia_id] [int] NOT NULL,
	[sach_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tac_gia_id] ASC,
	[sach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[chi_tiet_dat_hang] ON 

INSERT [dbo].[chi_tiet_dat_hang] ([chi_tiet_id], [don_dat_hang_id], [sach_id], [so_luong], [don_gia]) VALUES (1, 1, 4, 1, 1000)
INSERT [dbo].[chi_tiet_dat_hang] ([chi_tiet_id], [don_dat_hang_id], [sach_id], [so_luong], [don_gia]) VALUES (2, 1, 9, 1, 10000)
INSERT [dbo].[chi_tiet_dat_hang] ([chi_tiet_id], [don_dat_hang_id], [sach_id], [so_luong], [don_gia]) VALUES (3, 1, 23, 1, 1000)
INSERT [dbo].[chi_tiet_dat_hang] ([chi_tiet_id], [don_dat_hang_id], [sach_id], [so_luong], [don_gia]) VALUES (4, 2, 9, 3, 10000)
SET IDENTITY_INSERT [dbo].[chi_tiet_dat_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[chu_de] ON 

INSERT [dbo].[chu_de] ([chu_de_id], [ten_chu_de]) VALUES (1, N'Ngoại Ngữ')
INSERT [dbo].[chu_de] ([chu_de_id], [ten_chu_de]) VALUES (2, N'Công Nghệ - Thông Tin')
INSERT [dbo].[chu_de] ([chu_de_id], [ten_chu_de]) VALUES (3, N'Văn Học')
INSERT [dbo].[chu_de] ([chu_de_id], [ten_chu_de]) VALUES (4, N'Luật')
INSERT [dbo].[chu_de] ([chu_de_id], [ten_chu_de]) VALUES (5, N'Khoa Học - Kĩ Thuật')
INSERT [dbo].[chu_de] ([chu_de_id], [ten_chu_de]) VALUES (6, N'Nông Nghiệp')
INSERT [dbo].[chu_de] ([chu_de_id], [ten_chu_de]) VALUES (7, N'Triết học - Chính trị')
INSERT [dbo].[chu_de] ([chu_de_id], [ten_chu_de]) VALUES (8, N'Lịch sử , Địa lí')
INSERT [dbo].[chu_de] ([chu_de_id], [ten_chu_de]) VALUES (9, N'Kinh Tế')
INSERT [dbo].[chu_de] ([chu_de_id], [ten_chu_de]) VALUES (10, N'Sách Giáo Khoa')
INSERT [dbo].[chu_de] ([chu_de_id], [ten_chu_de]) VALUES (11, N'Nghệ Thuật Sống')
SET IDENTITY_INSERT [dbo].[chu_de] OFF
GO
SET IDENTITY_INSERT [dbo].[don_dat_hang] ON 

INSERT [dbo].[don_dat_hang] ([don_dat_hang_id], [khach_hang_id], [ngay_dat], [ngay_giao_hang], [tinh_trang_giao_hang], [da_thanh_toan]) VALUES (1, 1, CAST(N'2023-10-20' AS Date), CAST(N'2023-10-16' AS Date), 1, 0)
INSERT [dbo].[don_dat_hang] ([don_dat_hang_id], [khach_hang_id], [ngay_dat], [ngay_giao_hang], [tinh_trang_giao_hang], [da_thanh_toan]) VALUES (2, 1, CAST(N'2023-10-20' AS Date), CAST(N'2023-10-31' AS Date), 1, 0)
SET IDENTITY_INSERT [dbo].[don_dat_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[khach_hang] ON 

INSERT [dbo].[khach_hang] ([khach_hang_id], [ten_khach_hang], [dia_chi], [email], [TaiKhoan], [MatKhau], [DienThoai], [NgaySinh]) VALUES (1, N'1', N'1', N'1', N'1', N'1', N'1', CAST(N'2023-10-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[khach_hang] ([khach_hang_id], [ten_khach_hang], [dia_chi], [email], [TaiKhoan], [MatKhau], [DienThoai], [NgaySinh]) VALUES (2, N'3', N'4', N'1234@gmail.com', N'3', N'3', N'1234', CAST(N'2023-10-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[khach_hang] ([khach_hang_id], [ten_khach_hang], [dia_chi], [email], [TaiKhoan], [MatKhau], [DienThoai], [NgaySinh]) VALUES (3, N'2', N'1', N'hoang@gmail.com', N'2', N'2', N'1', CAST(N'2023-10-09T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[khach_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[nha_xuat_ban] ON 

INSERT [dbo].[nha_xuat_ban] ([nha_xuat_ban_id], [ten_nha_xuat_ban], [dia_chi]) VALUES (1, N'Nhà Xuất Bản Trẻ', N'BD')
INSERT [dbo].[nha_xuat_ban] ([nha_xuat_ban_id], [ten_nha_xuat_ban], [dia_chi]) VALUES (3, N'NXB Thống Kê', N'BD')
INSERT [dbo].[nha_xuat_ban] ([nha_xuat_ban_id], [ten_nha_xuat_ban], [dia_chi]) VALUES (4, N'Kim Đồng', N'BD')
INSERT [dbo].[nha_xuat_ban] ([nha_xuat_ban_id], [ten_nha_xuat_ban], [dia_chi]) VALUES (5, N'Đại Học Quốc Gia', N'BD')
INSERT [dbo].[nha_xuat_ban] ([nha_xuat_ban_id], [ten_nha_xuat_ban], [dia_chi]) VALUES (7, N'Văn Hóa Nghệ Thuật', N'BD')
INSERT [dbo].[nha_xuat_ban] ([nha_xuat_ban_id], [ten_nha_xuat_ban], [dia_chi]) VALUES (8, N'Văn Hóa', N'BD')
INSERT [dbo].[nha_xuat_ban] ([nha_xuat_ban_id], [ten_nha_xuat_ban], [dia_chi]) VALUES (9, N'Lao Động Xã Hội', N'BD')
INSERT [dbo].[nha_xuat_ban] ([nha_xuat_ban_id], [ten_nha_xuat_ban], [dia_chi]) VALUES (10, N'Khoa Học  - Kĩ Thuật', N'BD')
SET IDENTITY_INSERT [dbo].[nha_xuat_ban] OFF
GO
SET IDENTITY_INSERT [dbo].[sach] ON 

INSERT [dbo].[sach] ([sach_id], [ten_sach], [tac_gia_id], [nha_xuat_ban_id], [gia_tien], [chu_de_id], [anhSP], [NgayCapNhap], [mo_ta]) VALUES (4, N'Sách 1', 1, 1, CAST(1000.00 AS Decimal(10, 2)), 1, N'1.JPG', CAST(N'2003-02-10' AS Date), N'1')
INSERT [dbo].[sach] ([sach_id], [ten_sach], [tac_gia_id], [nha_xuat_ban_id], [gia_tien], [chu_de_id], [anhSP], [NgayCapNhap], [mo_ta]) VALUES (5, N'Sách 2', 1, 3, CAST(100000.00 AS Decimal(10, 2)), 2, N'2.JPG', CAST(N'2000-12-02' AS Date), N'1')
INSERT [dbo].[sach] ([sach_id], [ten_sach], [tac_gia_id], [nha_xuat_ban_id], [gia_tien], [chu_de_id], [anhSP], [NgayCapNhap], [mo_ta]) VALUES (6, N'Sách 3', 1, 4, CAST(100000.00 AS Decimal(10, 2)), 3, N'3.JPG', CAST(N'2015-03-20' AS Date), N'1')
INSERT [dbo].[sach] ([sach_id], [ten_sach], [tac_gia_id], [nha_xuat_ban_id], [gia_tien], [chu_de_id], [anhSP], [NgayCapNhap], [mo_ta]) VALUES (7, N'Sách 4', 1, 5, CAST(1000.00 AS Decimal(10, 2)), 4, N'4.JPG', CAST(N'2015-03-20' AS Date), N'1')
INSERT [dbo].[sach] ([sach_id], [ten_sach], [tac_gia_id], [nha_xuat_ban_id], [gia_tien], [chu_de_id], [anhSP], [NgayCapNhap], [mo_ta]) VALUES (8, N'Sách 5', 1, 7, CAST(1000.00 AS Decimal(10, 2)), 7, N'5.JPG', CAST(N'2015-03-20' AS Date), N'1')
INSERT [dbo].[sach] ([sach_id], [ten_sach], [tac_gia_id], [nha_xuat_ban_id], [gia_tien], [chu_de_id], [anhSP], [NgayCapNhap], [mo_ta]) VALUES (9, N'Sách 6', 1, 1, CAST(10000.00 AS Decimal(10, 2)), 1, N'6.JPG', CAST(N'2015-03-20' AS Date), N'1')
INSERT [dbo].[sach] ([sach_id], [ten_sach], [tac_gia_id], [nha_xuat_ban_id], [gia_tien], [chu_de_id], [anhSP], [NgayCapNhap], [mo_ta]) VALUES (23, N'Sách7', 1, 1, CAST(1000.00 AS Decimal(10, 2)), 1, N'7.JPG', CAST(N'2025-03-07' AS Date), N'1')
SET IDENTITY_INSERT [dbo].[sach] OFF
GO
SET IDENTITY_INSERT [dbo].[tac_gia] ON 

INSERT [dbo].[tac_gia] ([tac_gia_id], [ten_tac_gia]) VALUES (1, N'Kim Ð?ng')
SET IDENTITY_INSERT [dbo].[tac_gia] OFF
GO
ALTER TABLE [dbo].[chi_tiet_dat_hang]  WITH CHECK ADD FOREIGN KEY([don_dat_hang_id])
REFERENCES [dbo].[don_dat_hang] ([don_dat_hang_id])
GO
ALTER TABLE [dbo].[chi_tiet_dat_hang]  WITH CHECK ADD  CONSTRAINT [FK__chi_tiet___sach___4BAC3F29] FOREIGN KEY([sach_id])
REFERENCES [dbo].[sach] ([sach_id])
GO
ALTER TABLE [dbo].[chi_tiet_dat_hang] CHECK CONSTRAINT [FK__chi_tiet___sach___4BAC3F29]
GO
ALTER TABLE [dbo].[don_dat_hang]  WITH CHECK ADD  CONSTRAINT [FK__don_dat_h__khach__47DBAE45] FOREIGN KEY([khach_hang_id])
REFERENCES [dbo].[khach_hang] ([khach_hang_id])
GO
ALTER TABLE [dbo].[don_dat_hang] CHECK CONSTRAINT [FK__don_dat_h__khach__47DBAE45]
GO
ALTER TABLE [dbo].[sach]  WITH CHECK ADD  CONSTRAINT [FK__sach__tac_gia_id__4222D4EF] FOREIGN KEY([tac_gia_id])
REFERENCES [dbo].[tac_gia] ([tac_gia_id])
GO
ALTER TABLE [dbo].[sach] CHECK CONSTRAINT [FK__sach__tac_gia_id__4222D4EF]
GO
ALTER TABLE [dbo].[sach]  WITH CHECK ADD  CONSTRAINT [FK_sach_chu_de] FOREIGN KEY([chu_de_id])
REFERENCES [dbo].[chu_de] ([chu_de_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sach] CHECK CONSTRAINT [FK_sach_chu_de]
GO
ALTER TABLE [dbo].[sach]  WITH CHECK ADD  CONSTRAINT [FK_sach_nha_xuat_ban] FOREIGN KEY([nha_xuat_ban_id])
REFERENCES [dbo].[nha_xuat_ban] ([nha_xuat_ban_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sach] CHECK CONSTRAINT [FK_sach_nha_xuat_ban]
GO
ALTER TABLE [dbo].[viet_sach]  WITH CHECK ADD  CONSTRAINT [FK__viet_sach__sach___4F7CD00D] FOREIGN KEY([sach_id])
REFERENCES [dbo].[sach] ([sach_id])
GO
ALTER TABLE [dbo].[viet_sach] CHECK CONSTRAINT [FK__viet_sach__sach___4F7CD00D]
GO
ALTER TABLE [dbo].[viet_sach]  WITH CHECK ADD FOREIGN KEY([tac_gia_id])
REFERENCES [dbo].[tac_gia] ([tac_gia_id])
GO
