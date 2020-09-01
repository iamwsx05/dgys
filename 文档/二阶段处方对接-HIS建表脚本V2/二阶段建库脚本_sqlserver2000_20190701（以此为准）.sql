USE [master]
GO
/****** Object:  Database [DONGGUAN_HIS_CF_YIMU]    Script Date: 07/02/2019 15:20:25 ******/
CREATE DATABASE [DONGGUAN_HIS_CF_YIMU] ON  PRIMARY 
( NAME = N'DONGGUAN_HIS_CF_YIMU', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DONGGUAN_HIS_CF_YIMU.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DONGGUAN_HIS_CF_YIMU_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DONGGUAN_HIS_CF_YIMU_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DONGGUAN_HIS_CF_YIMU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET ARITHABORT OFF
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET  READ_WRITE
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET RECOVERY SIMPLE
GO
ALTER DATABASE [DONGGUAN_HIS_CF_YIMU] SET  MULTI_USER
GO
if ( ((@@microsoftversion / power(2, 24) = 8) and (@@microsoftversion & 0xffff >= 760)) or 
		(@@microsoftversion / power(2, 24) >= 9) )begin 
	exec dbo.sp_dboption @dbname =  N'DONGGUAN_HIS_CF_YIMU', @optname = 'db chaining', @optvalue = 'OFF'
 end
GO
USE [DONGGUAN_HIS_CF_YIMU]
GO
/****** Object:  User [DONGGUAN_HIS_CF_YIMU]    Script Date: 07/02/2019 15:20:25 ******/
EXEC dbo.sp_grantdbaccess @loginame = N'DONGGUAN_HIS_CF_YIMU', @name_in_db = N'DONGGUAN_HIS_CF_YIMU'
GO
/****** Object:  Table [dbo].[HIS_REGISTER]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_REGISTER](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[VISIT_NO] [nvarchar](90) NULL,
	[PATIENT_NO] [nvarchar](90) NULL,
	[NAME] [nvarchar](100) NULL,
	[ID_CARD] [nvarchar](80) NULL,
	[DEPART_ID] [nvarchar](90) NULL,
	[DEPARTMENT] [nvarchar](90) NULL,
	[DOC_ID] [nvarchar](40) NULL,
	[DOC_NAME] [nvarchar](40) NULL,
	[REG_DATE] [nvarchar](40) NULL,
 CONSTRAINT [SYS_C0051967] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [REG_DATE_TIME] ON [dbo].[HIS_REGISTER] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [REG_MODIFY_TIME] ON [dbo].[HIS_REGISTER] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [REG_PRES_VIIT_NO] ON [dbo].[HIS_REGISTER] 
(
	[VISIT_NO] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*挂号流水号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'VISIT_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'PATIENT_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人身份证号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'ID_CARD'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'科室ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'DEPART_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'科室名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'DEPARTMENT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医生ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'DOC_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医生名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'DOC_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*挂号记录时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER', @level2type=N'COLUMN',@level2name=N'REG_DATE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'挂号信息' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_REGISTER'
GO
/****** Object:  Table [dbo].[HIS_ENG_ORDER_OPERATION]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ENG_ORDER_OPERATION](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[ORDER_ID] [nvarchar](90) NULL,
	[CODE] [nvarchar](90) NULL,
	[NAME] [nvarchar](400) NULL,
	[START_TIME] [nvarchar](90) NULL,
	[END_TIME] [nvarchar](90) NULL,
	[INCISION_TYPE] [nvarchar](90) NULL,
	[INCISION_STATUS] [nvarchar](90) NULL,
	[INPLANT] [nvarchar](90) NULL,
 CONSTRAINT [SYS_C0051963] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOO_DATE_TIME] ON [dbo].[HIS_ENG_ORDER_OPERATION] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOO_MODIFY_TIME] ON [dbo].[HIS_ENG_ORDER_OPERATION] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOO_ORDER_ID] ON [dbo].[HIS_ENG_ORDER_OPERATION] 
(
	[ORDER_ID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION', @level2type=N'COLUMN',@level2name=N'ORDER_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'手术编码（ICD9-CM3）' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION', @level2type=N'COLUMN',@level2name=N'CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'手术名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION', @level2type=N'COLUMN',@level2name=N'NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'手术开始时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION', @level2type=N'COLUMN',@level2name=N'START_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'手术结束时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION', @level2type=N'COLUMN',@level2name=N'END_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'切口类别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION', @level2type=N'COLUMN',@level2name=N'INCISION_TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'愈合状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION', @level2type=N'COLUMN',@level2name=N'INCISION_STATUS'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有植入物' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION', @level2type=N'COLUMN',@level2name=N'INPLANT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'手术医嘱 ' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_OPERATION'
GO
/****** Object:  Table [dbo].[HIS_ENG_ORDER_INFECTION]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ENG_ORDER_INFECTION](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[ORDER_ID] [nvarchar](60) NULL,
	[HI_CODE] [nvarchar](60) NULL,
	[HI_NAME] [nvarchar](60) NULL,
	[HI_OUT_COME] [nvarchar](60) NULL,
	[RESCUE_TIMES] [nvarchar](60) NULL,
	[RESCUE_SUCC_TIMES] [nvarchar](60) NULL,
	[PATHOLOGIC_DIAG] [nvarchar](60) NULL,
	[PATHOLOGIC_NAME] [nvarchar](60) NULL,
 CONSTRAINT [SYS_C0051951] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOI_MODIFY_TIME] ON [dbo].[HIS_ENG_ORDER_INFECTION] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOI_PRES_DATE_TIME] ON [dbo].[HIS_ENG_ORDER_INFECTION] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOI_PRES_ORDER_ID] ON [dbo].[HIS_ENG_ORDER_INFECTION] 
(
	[ORDER_ID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构代码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION', @level2type=N'COLUMN',@level2name=N'ORDER_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医院感染代码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION', @level2type=N'COLUMN',@level2name=N'HI_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医院感染名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION', @level2type=N'COLUMN',@level2name=N'HI_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医院感染治疗结果' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION', @level2type=N'COLUMN',@level2name=N'HI_OUT_COME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'抢救次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION', @level2type=N'COLUMN',@level2name=N'RESCUE_TIMES'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'抢救成功次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION', @level2type=N'COLUMN',@level2name=N'RESCUE_SUCC_TIMES'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病理诊断' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION', @level2type=N'COLUMN',@level2name=N'PATHOLOGIC_DIAG'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病理名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION', @level2type=N'COLUMN',@level2name=N'PATHOLOGIC_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院患者感染及病理信息' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_INFECTION'
GO
/****** Object:  Table [dbo].[HIS_ENG_ORDER_FEE_DETAIL]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ENG_ORDER_FEE_DETAIL](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[COST_ID] [nvarchar](90) NULL,
	[PAY_FLAG] [nvarchar](10) NULL,
	[ORDER_ID] [nvarchar](90) NULL,
	[ORDER_ITEM_ID] [nvarchar](90) NULL,
	[PATIENT_NO] [nvarchar](90) NULL,
	[PATIENT_NAME] [nvarchar](90) NULL,
	[CHARGE_TIME] [datetime] NULL,
	[ITEM_TYPE] [nvarchar](200) NULL,
	[ITEM_CODE] [nvarchar](90) NULL,
	[ITEM_NAME] [nvarchar](90) NULL,
	[ITEM_QTY] [decimal](20, 4) NULL,
	[ITEM_QTY_UNIT] [nvarchar](90) NULL,
	[ITEM_UNIT_PRICE] [decimal](20, 4) NULL,
	[ITEM_AMOUNT] [decimal](20, 4) NULL,
	[DOC_ID] [nvarchar](90) NULL,
	[DOC_NAME] [nvarchar](90) NULL,
	[DEPART_ID] [nvarchar](90) NULL,
	[DEPARTMENT] [nvarchar](90) NULL,
	[EXECUTE_DEPART_ID] [nvarchar](90) NULL,
	[EXECUTE_DEPARTMENT] [nvarchar](90) NULL,
 CONSTRAINT [SYS_C0051959] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOFD_COST_ID] ON [dbo].[HIS_ENG_ORDER_FEE_DETAIL] 
(
	[COST_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOFD_DATE_TIME] ON [dbo].[HIS_ENG_ORDER_FEE_DETAIL] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOFD_MODIFY_TIME] ON [dbo].[HIS_ENG_ORDER_FEE_DETAIL] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOFD_ORDER_ID] ON [dbo].[HIS_ENG_ORDER_FEE_DETAIL] 
(
	[ORDER_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOFD_ORDER_ITEM_ID] ON [dbo].[HIS_ENG_ORDER_FEE_DETAIL] 
(
	[ORDER_ITEM_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOFD_ORG_CODE] ON [dbo].[HIS_ENG_ORDER_FEE_DETAIL] 
(
	[ORG_CODE] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*收费明细ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'COST_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'退费标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'PAY_FLAG'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'ORDER_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医嘱ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'ORDER_ITEM_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'PATIENT_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'PATIENT_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收费/退费时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'CHARGE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目费用类别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'ITEM_TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'ITEM_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'ITEM_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'ITEM_QTY'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'ITEM_QTY_UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目单价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'ITEM_UNIT_PRICE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目金额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'ITEM_AMOUNT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开单医生ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'DOC_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开单医生姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'DOC_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开单科室ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'DEPART_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开单科室名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'DEPARTMENT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'执行科室ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'EXECUTE_DEPART_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'执行科室名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL', @level2type=N'COLUMN',@level2name=N'EXECUTE_DEPARTMENT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院收费明细数据' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_FEE_DETAIL'
GO
/****** Object:  Table [dbo].[HIS_ENG_ORDER_EXAM]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ENG_ORDER_EXAM](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](90) NULL,
	[ORDER_ID] [nvarchar](90) NULL,
	[LIS_GROUP_CODE] [nvarchar](90) NULL,
	[LIS_GROUP_NAME] [nvarchar](90) NULL,
	[EXAM_ITEM_ID] [nvarchar](90) NULL,
	[EXAM_ITEM_NAME] [nvarchar](90) NULL,
	[REFERENCE_RANGE] [nvarchar](90) NULL,
	[RESULT] [nvarchar](90) NULL,
	[SEND_TIME] [nvarchar](90) NULL,
	[ABNORMAL_INDICATOR] [nvarchar](90) NULL,
	[LIS_TIME] [nvarchar](90) NULL,
	[PATIENT_NO] [nvarchar](90) NULL,
 CONSTRAINT [SYS_C0051965] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOE_DATE_TIME] ON [dbo].[HIS_ENG_ORDER_EXAM] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOE_MODIFY_TIME] ON [dbo].[HIS_ENG_ORDER_EXAM] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOE_ORDER_ID] ON [dbo].[HIS_ENG_ORDER_EXAM] 
(
	[ORDER_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOE_ORG_CODE] ON [dbo].[HIS_ENG_ORDER_EXAM] 
(
	[ORG_CODE] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'ORDER_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*检验组编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'LIS_GROUP_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*检验组名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'LIS_GROUP_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'检验项目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'EXAM_ITEM_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'检验项目名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'EXAM_ITEM_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*参考值' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'REFERENCE_RANGE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*检验结果' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'RESULT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开具时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'SEND_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*检验结果异常标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'ABNORMAL_INDICATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*检验时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'LIS_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*病人ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM', @level2type=N'COLUMN',@level2name=N'PATIENT_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院检验结果' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_EXAM'
GO
/****** Object:  Table [dbo].[HIS_ENG_ORDER_DRUG_SEND]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ENG_ORDER_DRUG_SEND](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[ITEM_SEND_ID] [nvarchar](90) NULL,
	[DISPENSE_STORE] [nvarchar](90) NULL,
	[ORDER_ID] [nvarchar](90) NULL,
	[ITEM_ID] [nvarchar](90) NULL,
	[TYPE] [nvarchar](90) NULL,
	[GROUP_NO] [nvarchar](90) NULL,
	[PATIENT_NO] [nvarchar](90) NULL,
	[PATIENT_NAME] [nvarchar](90) NULL,
	[DRUG_ID] [nvarchar](90) NULL,
	[DRUG_NAME] [nvarchar](90) NULL,
	[PREP_FORM] [nvarchar](90) NULL,
	[SPEC_NAME] [nvarchar](400) NULL,
	[MANUFACTURER_NAME] [nvarchar](200) NULL,
	[QTY] [decimal](20, 4) NULL,
	[QTY_UNIT] [nvarchar](90) NULL,
	[SEND_DOSE] [nvarchar](90) NULL,
	[SEND_UNIT] [nvarchar](90) NULL,
	[SEND_DATE_TIME] [nvarchar](90) NULL,
	[REDUCE_FLAG] [nvarchar](90) NULL,
	[UNIT_PRICE] [decimal](20, 4) NULL,
	[AMOUNT] [decimal](20, 4) NULL,
	[DOC_ID] [nvarchar](90) NULL,
	[DOC_NAME] [nvarchar](90) NULL,
	[PHARM_PRE_ID] [nvarchar](90) NULL,
	[PHARM_PRE_NAME] [nvarchar](90) NULL,
	[PHARM_CHK_ID] [nvarchar](90) NULL,
	[PHARM_CHK_NAME] [nvarchar](90) NULL,
 CONSTRAINT [SYS_C0051957] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODS_DATE_TIME] ON [dbo].[HIS_ENG_ORDER_DRUG_SEND] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODS_DATE_TIME_ID] ON [dbo].[HIS_ENG_ORDER_DRUG_SEND] 
(
	[ITEM_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODS_DRUG_ID] ON [dbo].[HIS_ENG_ORDER_DRUG_SEND] 
(
	[DRUG_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODS_ITEM_SEND_ID] ON [dbo].[HIS_ENG_ORDER_DRUG_SEND] 
(
	[ITEM_SEND_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODS_MODIFY_TIME] ON [dbo].[HIS_ENG_ORDER_DRUG_SEND] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODS_ORDER_ID] ON [dbo].[HIS_ENG_ORDER_DRUG_SEND] 
(
	[ORDER_ID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'行的唯一标识' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'ITEM_SEND_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发药药房名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'DISPENSE_STORE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'ORDER_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*医嘱ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'ITEM_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医嘱类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'组号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'GROUP_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PATIENT_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PATIENT_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'药品id' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'DRUG_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医院药品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'DRUG_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'剂型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PREP_FORM'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'规格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'SPEC_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'厂家' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'MANUFACTURER_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发/退药数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'QTY'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发/退药数量单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'QTY_UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发/退药剂量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'SEND_DOSE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发/退药剂量单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'SEND_UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发/退药时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'SEND_DATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*退药标识' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'REDUCE_FLAG'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'单价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'UNIT_PRICE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'金额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'AMOUNT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医师工号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'DOC_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医师姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'DOC_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*调剂药师工号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PHARM_PRE_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*调剂药师姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PHARM_PRE_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*审核药师工号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PHARM_CHK_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*审核药师姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PHARM_CHK_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院医嘱（医嘱的药品部分）发药数据' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_SEND'
GO
/****** Object:  Table [dbo].[HIS_ENG_ORDER_DRUG_EXECUTE]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ENG_ORDER_DRUG_EXECUTE](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[ITEM_EXEC_ID] [nvarchar](90) NULL,
	[ORDER_ID] [nvarchar](90) NULL,
	[ITEM_ID] [nvarchar](90) NULL,
	[PATIENT_NO] [nvarchar](90) NULL,
	[PATIENT_NAME] [nvarchar](90) NULL,
	[TYPE] [nvarchar](90) NULL,
	[GROUP_NO] [nvarchar](90) NULL,
	[DRUG_ID] [nvarchar](90) NULL,
	[DRUG_NAME] [nvarchar](90) NULL,
	[PREP_FORM] [nvarchar](90) NULL,
	[SPEC_NAME] [nvarchar](400) NULL,
	[MANUFACTURER_NAME] [nvarchar](200) NULL,
	[ADMIN_ROUTE] [nvarchar](90) NULL,
	[ADMIN_DOSE] [nvarchar](90) NULL,
	[ADMIN_DOSE_UNIT] [nvarchar](90) NULL,
	[ADMIN_FREQUENCY] [nvarchar](90) NULL,
	[ADMIN_METHOD] [nvarchar](90) NULL,
	[ADMIN_GOAL] [nvarchar](90) NULL,
	[DOC_ID] [nvarchar](90) NULL,
	[DOC_NAME] [nvarchar](90) NULL,
	[EXECUTE_TIME] [datetime] NULL,
	[EXECUTE_DEPART_ID] [nvarchar](90) NULL,
	[EXECUTE_DEPARTMENT] [nvarchar](90) NULL,
	[PHARM_CHK_ID] [nvarchar](90) NULL,
	[PHARM_CHK_NAME] [nvarchar](90) NULL,
 CONSTRAINT [SYS_C0051955] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODE_DATE_TIME] ON [dbo].[HIS_ENG_ORDER_DRUG_EXECUTE] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODE_DRUG_ID] ON [dbo].[HIS_ENG_ORDER_DRUG_EXECUTE] 
(
	[DRUG_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODE_ITEM_ID] ON [dbo].[HIS_ENG_ORDER_DRUG_EXECUTE] 
(
	[ITEM_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODE_MODIFY_TIME] ON [dbo].[HIS_ENG_ORDER_DRUG_EXECUTE] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODE_ORDER_ID] ON [dbo].[HIS_ENG_ORDER_DRUG_EXECUTE] 
(
	[ORDER_ID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*医嘱执行ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'ITEM_EXEC_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'ORDER_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医嘱ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'ITEM_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'PATIENT_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'PATIENT_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医嘱类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'组号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'GROUP_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'药品id' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'DRUG_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医院药品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'DRUG_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'剂型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'PREP_FORM'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'规格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'SPEC_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'厂家' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'MANUFACTURER_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药途径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'ADMIN_ROUTE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'执行剂量数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'ADMIN_DOSE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'执行剂量单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'ADMIN_DOSE_UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药频率' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'ADMIN_FREQUENCY'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'ADMIN_METHOD'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药目的' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'ADMIN_GOAL'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医师工号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'DOC_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医师姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'DOC_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'执行时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'EXECUTE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*执行科室ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'EXECUTE_DEPART_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'执行科室名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'EXECUTE_DEPARTMENT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*审核药师工号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'PHARM_CHK_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*审核药师姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE', @level2type=N'COLUMN',@level2name=N'PHARM_CHK_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院药嘱（医嘱的药品部分）执行数据' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG_EXECUTE'
GO
/****** Object:  Table [dbo].[HIS_ENG_ORDER_DRUG]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ENG_ORDER_DRUG](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ITEM_ID] [nvarchar](90) NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[ORDER_ID] [nvarchar](90) NULL,
	[PATIENT_NO] [nvarchar](90) NULL,
	[PATIENT_NAME] [nvarchar](90) NULL,
	[TYPE] [nvarchar](90) NULL,
	[START_TIME] [nvarchar](90) NULL,
	[END_TIME] [nvarchar](90) NULL,
	[CONTINUE_DAY] [nvarchar](90) NULL,
	[PRES_DATE_TIME] [nvarchar](90) NULL,
	[GROUP_NO] [nvarchar](90) NULL,
	[DRUG_ID] [nvarchar](90) NULL,
	[DRUG_NAME] [nvarchar](90) NULL,
	[PREP_FORM] [nvarchar](90) NULL,
	[SPEC_NAME] [nvarchar](400) NULL,
	[REG_NAME] [nvarchar](600) NULL,
	[MANUFACTURER_NAME] [nvarchar](200) NULL,
	[ADMIN_ROUTE] [nvarchar](90) NULL,
	[ADMIN_DOSE] [nvarchar](90) NULL,
	[ADMIN_DOSE_UNIT] [nvarchar](90) NULL,
	[ADMIN_FREQUENCY] [nvarchar](90) NULL,
	[ADMIN_METHOD] [nvarchar](90) NULL,
	[ADMIN_GOAL] [nvarchar](90) NULL,
	[COMMENTS] [nvarchar](90) NULL,
	[DOC_ID] [nvarchar](90) NULL,
	[DOC_NAME] [nvarchar](90) NULL,
	[DOC_TITLE] [nvarchar](90) NULL,
	[PRES_DEPART_ID] [nvarchar](90) NULL,
	[PRES_DEPARTMENT] [nvarchar](90) NULL,
 CONSTRAINT [SYS_C0051953] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOD_DRUG_DRUG_ID] ON [dbo].[HIS_ENG_ORDER_DRUG] 
(
	[DRUG_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOD_DRUG_ORG_CODE] ON [dbo].[HIS_ENG_ORDER_DRUG] 
(
	[ORG_CODE] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOD_ITEM_ID] ON [dbo].[HIS_ENG_ORDER_DRUG] 
(
	[ITEM_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOD_MODIFY_TIME] ON [dbo].[HIS_ENG_ORDER_DRUG] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOD_ORDER_ID] ON [dbo].[HIS_ENG_ORDER_DRUG] 
(
	[ORDER_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOD_PRES_DATE_TIME] ON [dbo].[HIS_ENG_ORDER_DRUG] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*医嘱ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'ITEM_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构代码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'ORDER_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*病人ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'PATIENT_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'PATIENT_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医嘱类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'药嘱开始时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'START_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'药嘱结束时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'END_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用药持续时间（天）' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'CONTINUE_DAY'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开具时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'PRES_DATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'组号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'GROUP_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'药品id' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'DRUG_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医院药品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'DRUG_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'剂型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'PREP_FORM'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'规格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'SPEC_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'REG_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'药品生产厂家' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'MANUFACTURER_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药途径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'ADMIN_ROUTE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'单次给药剂量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'ADMIN_DOSE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*单次给药剂量单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'ADMIN_DOSE_UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药频率' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'ADMIN_FREQUENCY'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药时机' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'ADMIN_METHOD'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用药目的' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'ADMIN_GOAL'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*医嘱备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'COMMENTS'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医师工号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'DOC_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医师姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'DOC_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医师职称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'DOC_TITLE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开具科室ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'PRES_DEPART_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开具科室名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG', @level2type=N'COLUMN',@level2name=N'PRES_DEPARTMENT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院药嘱（医嘱的药品部分）开具数据' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DRUG'
GO
/****** Object:  Table [dbo].[HIS_ENG_ORDER_DIAGNOSE]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ENG_ORDER_DIAGNOSE](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[ORDER_ID] [nvarchar](90) NULL,
	[DIAG_DATE] [nvarchar](90) NULL,
	[DIAG_NAME] [nvarchar](400) NULL,
	[DIAG_TYPE] [nvarchar](90) NULL,
	[DSCHARGE_TYPE] [nvarchar](90) NULL,
	[ICD10] [nvarchar](90) NULL,
 CONSTRAINT [SYS_C0051961] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODI_DATE_TIME] ON [dbo].[HIS_ENG_ORDER_DIAGNOSE] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODI_MODIFY_TIME] ON [dbo].[HIS_ENG_ORDER_DIAGNOSE] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODI_ORDER_ID] ON [dbo].[HIS_ENG_ORDER_DIAGNOSE] 
(
	[ORDER_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EODI_ORG_CODE] ON [dbo].[HIS_ENG_ORDER_DIAGNOSE] 
(
	[ORG_CODE] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DIAGNOSE', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DIAGNOSE', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DIAGNOSE', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DIAGNOSE', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DIAGNOSE', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DIAGNOSE', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DIAGNOSE', @level2type=N'COLUMN',@level2name=N'ORDER_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'诊断时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DIAGNOSE', @level2type=N'COLUMN',@level2name=N'DIAG_DATE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'诊断名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DIAGNOSE', @level2type=N'COLUMN',@level2name=N'DIAG_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'诊断类别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DIAGNOSE', @level2type=N'COLUMN',@level2name=N'DIAG_TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'出院情况' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DIAGNOSE', @level2type=N'COLUMN',@level2name=N'DSCHARGE_TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'ICD10编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DIAGNOSE', @level2type=N'COLUMN',@level2name=N'ICD10'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院患者诊断数据' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_DIAGNOSE'
GO
/****** Object:  Table [dbo].[HIS_ENG_ORDER_COST]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ENG_ORDER_COST](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[ORDER_ID] [nvarchar](60) NULL,
	[BED_FEE] [decimal](20, 4) NULL,
	[NURSE_FEE] [decimal](20, 4) NULL,
	[WM_FEE] [decimal](20, 4) NULL,
	[CPD_FEE] [decimal](20, 4) NULL,
	[CMH_FEE] [decimal](20, 4) NULL,
	[RADIO_FEE] [decimal](20, 4) NULL,
	[EXAM_FEE] [decimal](20, 4) NULL,
	[OXY_FEE] [decimal](20, 4) NULL,
	[BLOOD_FEE] [decimal](20, 4) NULL,
	[OPERATION_FEE] [decimal](20, 4) NULL,
	[CHECK_FEE] [decimal](20, 4) NULL,
	[ANESTH_FEE] [decimal](20, 4) NULL,
	[TREAT_FEE] [decimal](20, 4) NULL,
	[OTHER_FEE] [decimal](20, 4) NULL,
	[TOTAL_FEE] [decimal](20, 4) NULL,
 CONSTRAINT [SYS_C0051949] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOC_MODIFY_TIME] ON [dbo].[HIS_ENG_ORDER_COST] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOC_PRES_DATE_TIME] ON [dbo].[HIS_ENG_ORDER_COST] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EOC_PRES_ORDER_ID] ON [dbo].[HIS_ENG_ORDER_COST] 
(
	[ORDER_ID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构代码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'ORDER_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'床位费(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'BED_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'护理费(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'NURSE_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'西药费(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'WM_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'中成药费(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'CPD_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'中草药费(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'CMH_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'放射费(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'RADIO_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'化验费(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'EXAM_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'输氧费(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'OXY_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'输血费(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'BLOOD_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'手术费(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'OPERATION_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'检查费(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'CHECK_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'麻醉费(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'ANESTH_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'治疗费(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'TREAT_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'其他费用(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'OTHER_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院费用总计(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST', @level2type=N'COLUMN',@level2name=N'TOTAL_FEE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院患者费用结算表' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER_COST'
GO
/****** Object:  Table [dbo].[HIS_ENG_ORDER]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ENG_ORDER](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[ORDER_ID] [nvarchar](60) NULL,
	[SEX] [nvarchar](20) NULL,
	[PAY_TYPE] [nvarchar](290) NULL,
	[PATIENT_NO] [nvarchar](90) NULL,
	[SSID] [nvarchar](100) NULL,
	[NAME] [nvarchar](100) NULL,
	[ADDRESS] [nvarchar](400) NULL,
	[PHONE_NO] [nvarchar](120) NULL,
	[ID_CARD] [nvarchar](80) NULL,
	[HEIGHT] [nvarchar](40) NULL,
	[WEIGHT] [nvarchar](40) NULL,
	[BIRTH_WEIGHT] [nvarchar](40) NULL,
	[ALLERGY_LIST] [nvarchar](200) NULL,
	[PREGNANCY] [nvarchar](20) NULL,
	[TIME_OF_PREG] [decimal](10, 0) NULL,
	[BREAST_FEEDING] [nvarchar](20) NULL,
	[BIRTHDAY] [nvarchar](90) NULL,
	[MARITAL] [nvarchar](90) NULL,
	[OCCPATION] [nvarchar](90) NULL,
	[NATONALITY] [nvarchar](90) NULL,
	[ENTRY_TIME] [decimal](10, 0) NULL,
	[IN_DATE] [nvarchar](90) NULL,
	[IN_DEPART_ID] [nvarchar](100) NULL,
	[IN_DEPARTMENT] [nvarchar](90) NULL,
	[IN_AREA] [nvarchar](400) NULL,
	[OUT_DATE] [nvarchar](90) NULL,
	[OUT_DEPART_ID] [nvarchar](100) NULL,
	[OUT_DEPARTMENT] [nvarchar](90) NULL,
	[DOC_GROUP] [nvarchar](90) NULL,
	[DEPT_GROUP] [nvarchar](400) NULL,
	[OUT_AREA] [nvarchar](400) NULL,
 CONSTRAINT [SYS_C0051947] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EO_CREATE_ORDER_ID] ON [dbo].[HIS_ENG_ORDER] 
(
	[ORDER_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EO_CREATE_TIME] ON [dbo].[HIS_ENG_ORDER] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EO_MODIFY_TIME] ON [dbo].[HIS_ENG_ORDER] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*医院机构代码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*住院ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'ORDER_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'SEX'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'费用类型 ' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'PAY_TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'PATIENT_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*社保卡号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'SSID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'ADDRESS'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人电话' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'PHONE_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人身份证号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'ID_CARD'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'身高' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'HEIGHT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'体重' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'WEIGHT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'出身时体重' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'BIRTH_WEIGHT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'过敏药物列表' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'ALLERGY_LIST'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否怀孕' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'PREGNANCY'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'孕期(周)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'TIME_OF_PREG'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否哺乳' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'BREAST_FEEDING'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'出生日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'BIRTHDAY'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'婚姻状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'MARITAL'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'职业' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'OCCPATION'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'民族' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'NATONALITY'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'ENTRY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'入院时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'IN_DATE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'入院科室ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'IN_DEPART_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'入院科室名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'IN_DEPARTMENT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'入院病区名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'IN_AREA'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'出院时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'OUT_DATE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'出院科室ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'OUT_DEPART_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'出院科室名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'OUT_DEPARTMENT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'出院医疗组名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'DOC_GROUP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'出院科室分类名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'DEPT_GROUP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'出院病区名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER', @level2type=N'COLUMN',@level2name=N'OUT_AREA'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院记录信息' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_ORDER'
GO
/****** Object:  Table [dbo].[HIS_ENG_CF_ITEM_FEE]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ENG_CF_ITEM_FEE](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](90) NULL,
	[COST_ID] [nvarchar](90) NULL,
	[REFUND_FLAG] [nvarchar](90) NULL,
	[VISIT_NO] [nvarchar](90) NULL,
	[CFID] [nvarchar](90) NULL,
	[CF_ITEM_ID] [nvarchar](90) NULL,
	[PATIENT_NO] [nvarchar](90) NULL,
	[PATIENT_NAME] [nvarchar](90) NULL,
	[ITEM_TYPE] [nvarchar](90) NULL,
	[FEE_DATE] [nvarchar](90) NULL,
	[ITEM_ID] [nvarchar](90) NULL,
	[ITEM_NAME] [nvarchar](90) NULL,
	[ITEM_UNIT] [nvarchar](90) NULL,
	[ITEM_UNITPRICE] [nvarchar](90) NULL,
	[ITEM_QUANTITY] [nvarchar](90) NULL,
	[ITEM_AMOUNT] [nvarchar](90) NULL,
	[DOC_ID] [nvarchar](90) NULL,
	[DOC_NAME] [nvarchar](90) NULL,
	[DEPART_ID] [nvarchar](90) NULL,
	[DEPARTMENT] [nvarchar](90) NULL,
 CONSTRAINT [SYS_C0051973] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECI_CFID] ON [dbo].[HIS_ENG_CF_ITEM_FEE] 
(
	[CFID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECI_COST_ID] ON [dbo].[HIS_ENG_CF_ITEM_FEE] 
(
	[COST_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECI_DATE_TIME] ON [dbo].[HIS_ENG_CF_ITEM_FEE] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECI_ITEM_ID] ON [dbo].[HIS_ENG_CF_ITEM_FEE] 
(
	[ITEM_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECI_MODIFY_TIME] ON [dbo].[HIS_ENG_CF_ITEM_FEE] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'业务编号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'COST_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'退费标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'REFUND_FLAG'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'门诊挂号流水号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'VISIT_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*处方ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'CFID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'处方明细ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'CF_ITEM_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'PATIENT_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'PATIENT_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'明细费用类别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'ITEM_TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收费/退费时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'FEE_DATE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'ITEM_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'ITEM_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'ITEM_UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目单价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'ITEM_UNITPRICE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'ITEM_QUANTITY'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目金额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'ITEM_AMOUNT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医生id' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'DOC_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医生姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'DOC_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'科室ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'DEPART_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'科室名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE', @level2type=N'COLUMN',@level2name=N'DEPARTMENT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'门诊收费明细表(门诊费用清单)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM_FEE'
GO
/****** Object:  Table [dbo].[HIS_ENG_CF_ITEM]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ENG_CF_ITEM](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[ITEM_ID] [nvarchar](60) NULL,
	[CFID] [nvarchar](60) NULL,
	[DRUG_ID] [nvarchar](80) NULL,
	[DRUG_NAME] [nvarchar](200) NULL,
	[REG_NAME] [nvarchar](200) NULL,
	[MANUFACTURER_NAME] [nvarchar](200) NULL,
	[CONTINUE_DAY] [nvarchar](90) NULL,
	[SPEC] [nvarchar](60) NULL,
	[QUANTITY] [nvarchar](40) NULL,
	[DISPENSE_UNIT] [nvarchar](90) NULL,
	[UNIT_PRICE] [nvarchar](40) NULL,
	[AMOUNT] [nvarchar](40) NULL,
	[GROUP_NO] [nvarchar](30) NULL,
	[FIRST_USE] [nvarchar](20) NULL,
	[PREP_FORM] [nvarchar](80) NULL,
	[ADMIN_ROUTE] [nvarchar](100) NULL,
	[ADMIN_AREA] [nvarchar](100) NULL,
	[ADMIN_FREQUENCY] [nvarchar](100) NULL,
	[ADMIN_DOSE] [nvarchar](100) NULL,
	[ADMIN_DOSE_UNIT] [nvarchar](100) NULL,
	[TOTAL_ADMIN_DOSE] [nvarchar](90) NULL,
	[TOTAL_ADMIN_DOSE_UNIT] [nvarchar](90) NULL,
	[ADMIN_METHOD] [nvarchar](90) NULL,
	[SPECIAL_PROMOTE] [nvarchar](90) NULL,
	[SKIN_TEST] [nvarchar](90) NULL,
	[COMMENTS] [nvarchar](500) NULL,
 CONSTRAINT [SYS_C0051971] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECT_CF_ID] ON [dbo].[HIS_ENG_CF_ITEM] 
(
	[CFID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECT_DATE_TIME] ON [dbo].[HIS_ENG_CF_ITEM] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECT_DRUG_ID] ON [dbo].[HIS_ENG_CF_ITEM] 
(
	[DRUG_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECT_DRUG_NAME] ON [dbo].[HIS_ENG_CF_ITEM] 
(
	[DRUG_NAME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECT_ITEM_ID] ON [dbo].[HIS_ENG_CF_ITEM] 
(
	[ITEM_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECT_MODIFY_TIME] ON [dbo].[HIS_ENG_CF_ITEM] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECT_ORG_CODE] ON [dbo].[HIS_ENG_CF_ITEM] 
(
	[ORG_CODE] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*处方明细ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'ITEM_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'处方ID，和主表关联' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'CFID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*药品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'DRUG_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医院药品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'DRUG_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'REG_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'厂家' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'MANUFACTURER_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用药持续时间（天）' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'CONTINUE_DAY'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'规格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'SPEC'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'销售数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'QUANTITY'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'销售单位(最小销售单位)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'DISPENSE_UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'销售单位单价(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'UNIT_PRICE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'销售金额(元)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'AMOUNT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'组号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'GROUP_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'首剂使用' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'FIRST_USE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'剂型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'PREP_FORM'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药途径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'ADMIN_ROUTE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药部位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'ADMIN_AREA'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药频率' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'ADMIN_FREQUENCY'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'单次给药剂量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'ADMIN_DOSE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*单次给药剂量单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'ADMIN_DOSE_UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'总剂量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'TOTAL_ADMIN_DOSE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*总剂量单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'TOTAL_ADMIN_DOSE_UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药时机' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'ADMIN_METHOD'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'SPECIAL_PROMOTE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'皮试结果' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'SKIN_TEST'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*药品备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM', @level2type=N'COLUMN',@level2name=N'COMMENTS'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'门诊处方明细视图' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_ITEM'
GO
/****** Object:  Table [dbo].[HIS_ENG_CF_DRUG_SEND]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ENG_CF_DRUG_SEND](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[SEND_ID] [nvarchar](90) NULL,
	[CFID] [nvarchar](90) NULL,
	[CF_ITEM_ID] [nvarchar](90) NULL,
	[DISPENSE_STORE] [nvarchar](90) NULL,
	[PATIENT_NO] [nvarchar](90) NULL,
	[PATIENT_NAME] [nvarchar](90) NULL,
	[DRUG_ID] [nvarchar](90) NULL,
	[DRUG_NAME] [nvarchar](90) NULL,
	[REG_NAME] [nvarchar](90) NULL,
	[MANUFACTURER_NAME] [nvarchar](200) NULL,
	[PREP_FORM] [nvarchar](90) NULL,
	[SPEC] [nvarchar](90) NULL,
	[QTY] [decimal](20, 4) NULL,
	[QTY_UNIT] [nvarchar](90) NULL,
	[SEND_DOSE] [nvarchar](90) NULL,
	[SEND_UNIT] [nvarchar](90) NULL,
	[SEND_DATE_TIME] [nvarchar](90) NULL,
	[PHARM_AUDT_ID] [nvarchar](90) NULL,
	[PHARM_AUDT_NAME] [nvarchar](90) NULL,
	[PHARM_PRE_ID] [nvarchar](90) NULL,
	[PHARM_PRE_NAME] [nvarchar](90) NULL,
	[PHARM_CHK_ID] [nvarchar](90) NULL,
	[PHARM_CHK_NAME] [nvarchar](90) NULL,
	[PHARM_DELV_ID] [nvarchar](90) NULL,
	[PHARM_DELV_NAME] [nvarchar](90) NULL,
 CONSTRAINT [SYS_C0051975] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECDS_CFID] ON [dbo].[HIS_ENG_CF_DRUG_SEND] 
(
	[CFID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECDS_DATE_TIME] ON [dbo].[HIS_ENG_CF_DRUG_SEND] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECDS_DRUG_ID] ON [dbo].[HIS_ENG_CF_DRUG_SEND] 
(
	[DRUG_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECDS_MODIFY_TIME] ON [dbo].[HIS_ENG_CF_DRUG_SEND] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECDS_ORG_CODE] ON [dbo].[HIS_ENG_CF_DRUG_SEND] 
(
	[ORG_CODE] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ECDS_SEND_ID] ON [dbo].[HIS_ENG_CF_DRUG_SEND] 
(
	[SEND_ID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'行唯一标识' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'SEND_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'处方ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'CFID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'处方明细ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'CF_ITEM_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发药药房名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'DISPENSE_STORE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PATIENT_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PATIENT_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'药品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'DRUG_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医院药品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'DRUG_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'REG_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'厂家' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'MANUFACTURER_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'剂型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PREP_FORM'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'规格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'SPEC'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发药数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'QTY'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发药单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'QTY_UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发药剂量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'SEND_DOSE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发药剂量单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'SEND_UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发药时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'SEND_DATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*审核药师工号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PHARM_AUDT_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*审核药师姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PHARM_AUDT_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*备药药师工号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PHARM_PRE_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*备药药师姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PHARM_PRE_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*核对药师工号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PHARM_CHK_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*核对药师姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PHARM_CHK_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*发药药师工号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PHARM_DELV_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*发药药师姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND', @level2type=N'COLUMN',@level2name=N'PHARM_DELV_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'门诊发药明细表(门诊各药房发药清单)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF_DRUG_SEND'
GO
/****** Object:  Table [dbo].[HIS_ENG_CF]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ENG_CF](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[CFID] [nvarchar](60) NULL,
	[VISIT_NO] [nvarchar](60) NULL,
	[DEPART_ID] [nvarchar](90) NULL,
	[DEPARTMENT] [nvarchar](200) NULL,
	[AGE] [nvarchar](20) NULL,
	[PRES_TYPE] [nvarchar](90) NULL,
	[PRES_DATE_TIME] [nvarchar](90) NULL,
	[SEX] [nvarchar](20) NULL,
	[PAY_TYPE] [nvarchar](290) NULL,
	[PATIENT_NO] [nvarchar](90) NULL,
	[PRES_NO] [nvarchar](90) NULL,
	[NAME] [nvarchar](100) NULL,
	[ADDRESS] [nvarchar](400) NULL,
	[PHONE_NO] [nvarchar](120) NULL,
	[ID_CARD] [nvarchar](80) NULL,
	[HEIGHT] [nvarchar](40) NULL,
	[WEIGHT] [nvarchar](40) NULL,
	[BIRTH_WEIGHT] [nvarchar](40) NULL,
	[CCR] [nvarchar](20) NULL,
	[ALLERGY_LIST] [nvarchar](600) NULL,
	[DIAGNOSE] [nvarchar](2000) NULL,
	[PREGNANCY] [nvarchar](20) NULL,
	[TIME_OF_PREG] [nvarchar](20) NULL,
	[BREAST_FEEDING] [nvarchar](20) NULL,
	[DIALYSIS] [nvarchar](20) NULL,
	[PROX_NAME] [nvarchar](40) NULL,
	[PROX_ID_CARD] [nvarchar](80) NULL,
	[DOC_ID] [nvarchar](40) NULL,
	[DOC_NAME] [nvarchar](40) NULL,
	[DOC_TITLE] [nvarchar](200) NULL,
	[DEPT_GROUP] [nvarchar](400) NULL,
	[TOTAL_AMOUNT] [nvarchar](40) NULL,
	[PRES_SOURCE] [nvarchar](200) NULL,
	[CORRES_CF_PRESNO] [nvarchar](90) NULL,
	[RECIPE_TYPE] [nvarchar](90) NULL,
	[PHARM_CHK_ID] [nvarchar](200) NULL,
	[PHARM_CHK_NAME] [nvarchar](200) NULL,
 CONSTRAINT [SYS_C0051969] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EC_CF_ID] ON [dbo].[HIS_ENG_CF] 
(
	[CFID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EC_DATE_TIME] ON [dbo].[HIS_ENG_CF] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EC_DEPARTMENT] ON [dbo].[HIS_ENG_CF] 
(
	[DEPARTMENT] ASC,
	[DOC_NAME] ASC,
	[PRES_DATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EC_MODIFY_TIME] ON [dbo].[HIS_ENG_CF] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EC_ORG_CODE] ON [dbo].[HIS_ENG_CF] 
(
	[ORG_CODE] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EC_PRES_DATE_TIME] ON [dbo].[HIS_ENG_CF] 
(
	[PRES_DATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EC_PRES_NO] ON [dbo].[HIS_ENG_CF] 
(
	[PRES_NO] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*处方ID号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'CFID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'门诊号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'VISIT_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'科室编号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'DEPART_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'科室名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'DEPARTMENT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'年龄' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'AGE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'处方类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'PRES_TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'处方医生开具时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'PRES_DATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'SEX'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'费用类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'PAY_TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'患者号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'PATIENT_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'处方号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'PRES_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'病人姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'ADDRESS'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'PHONE_NO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'ID_CARD'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'身高' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'HEIGHT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'体重' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'WEIGHT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'出生时体重' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'BIRTH_WEIGHT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'内生肌酐清除率' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'CCR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'过敏药品列表' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'ALLERGY_LIST'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*诊断' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'DIAGNOSE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否怀孕' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'PREGNANCY'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'孕期（周）' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'TIME_OF_PREG'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否哺乳' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'BREAST_FEEDING'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否透析' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'DIALYSIS'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'代办人姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'PROX_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'代办人身份证号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'PROX_ID_CARD'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医生工号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'DOC_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医生姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'DOC_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医生职称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'DOC_TITLE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'科室组名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'DEPT_GROUP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'处方金额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'TOTAL_AMOUNT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'处方来源' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'PRES_SOURCE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'退药标记' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'CORRES_CF_PRESNO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'处方类别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'RECIPE_TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*审核药师工号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'PHARM_CHK_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*审核药师姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF', @level2type=N'COLUMN',@level2name=N'PHARM_CHK_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'门诊处方视图 ' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ENG_CF'
GO
/****** Object:  Table [dbo].[HIS_DRUG_CONVERT]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_DRUG_CONVERT](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[DRUG_ID] [nvarchar](90) NULL,
	[DRUG_NAME] [nvarchar](160) NULL,
	[UNIT_NUM] [nvarchar](1000) NULL,
	[UNIT] [nvarchar](90) NULL,
	[CONVERT_NUM] [nvarchar](100) NULL,
	[CONVERT_UNIT] [nvarchar](100) NULL,
 CONSTRAINT [SYS_C0051979] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DCO_DATE_TIME] ON [dbo].[HIS_DRUG_CONVERT] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DCO_DRUG_ID] ON [dbo].[HIS_DRUG_CONVERT] 
(
	[DRUG_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DCO_MODIFY_TIME] ON [dbo].[HIS_DRUG_CONVERT] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CONVERT', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CONVERT', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CONVERT', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CONVERT', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CONVERT', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CONVERT', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'药品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CONVERT', @level2type=N'COLUMN',@level2name=N'DRUG_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'药品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CONVERT', @level2type=N'COLUMN',@level2name=N'DRUG_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'单位数值' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CONVERT', @level2type=N'COLUMN',@level2name=N'UNIT_NUM'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CONVERT', @level2type=N'COLUMN',@level2name=N'UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'转换后数值' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CONVERT', @level2type=N'COLUMN',@level2name=N'CONVERT_NUM'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'转换后单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CONVERT', @level2type=N'COLUMN',@level2name=N'CONVERT_UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'药品单位转换比信息' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CONVERT'
GO
/****** Object:  Table [dbo].[HIS_DRUG_CATALOG]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_DRUG_CATALOG](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[DRUG_ID] [nvarchar](90) NULL,
	[DRUG_NAME] [nvarchar](160) NULL,
	[TRADE_NAME] [nvarchar](60) NULL,
	[SPEC_NAME] [nvarchar](400) NULL,
	[PREP_NAME] [nvarchar](90) NULL,
	[MANUFACTURER_NAME] [nvarchar](200) NULL,
	[PZWH] [nvarchar](100) NULL,
	[MZ_UNIT] [nvarchar](40) NULL,
	[ZY_UNIT] [nvarchar](40) NULL,
	[BWM] [nvarchar](60) NULL,
	[YP_ID] [nvarchar](40) NULL,
	[PHARMA_TYPE] [nvarchar](90) NULL,
	[DRUG_TYPE] [nvarchar](40) NULL,
	[USE_FLAG] [nvarchar](10) NULL,
 CONSTRAINT [SYS_C0051977] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DC_DATE_TIME] ON [dbo].[HIS_DRUG_CATALOG] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DC_DRUG_ID] ON [dbo].[HIS_DRUG_CATALOG] 
(
	[DRUG_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DC_MODIFY_TIME] ON [dbo].[HIS_DRUG_CATALOG] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医院药品编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'DRUG_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'药品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'DRUG_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'TRADE_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'规格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'SPEC_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'剂型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'PREP_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'生产企业' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'MANUFACTURER_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'批准文号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'PZWH'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'门诊使用单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'MZ_UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'住院使用单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'ZY_UNIT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'本位码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'BWM'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'药交ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'YP_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医院药理分类' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'PHARMA_TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'药品分类' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'DRUG_TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否使用' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG', @level2type=N'COLUMN',@level2name=N'USE_FLAG'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医院药品目录数据' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DRUG_CATALOG'
GO
/****** Object:  Table [dbo].[HIS_DOCTOR]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_DOCTOR](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[DOC_ID] [nvarchar](40) NULL,
	[DOC_NAME] [nvarchar](100) NULL,
	[DOC_TITLE] [nvarchar](20) NULL,
	[WORK_SCOPE] [nvarchar](800) NULL,
	[DEPART_ID] [nvarchar](100) NULL,
	[DEPARTMENT] [nvarchar](100) NULL,
 CONSTRAINT [SYS_C0051983] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DOC_DATE_TIME] ON [dbo].[HIS_DOCTOR] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DOC_ID] ON [dbo].[HIS_DOCTOR] 
(
	[DOC_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DOC_MODIFY_TIME] ON [dbo].[HIS_DOCTOR] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DOCTOR', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DOCTOR', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DOCTOR', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DOCTOR', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DOCTOR', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DOCTOR', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医生ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DOCTOR', @level2type=N'COLUMN',@level2name=N'DOC_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医生名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DOCTOR', @level2type=N'COLUMN',@level2name=N'DOC_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医生职称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DOCTOR', @level2type=N'COLUMN',@level2name=N'DOC_TITLE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'工作范围' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DOCTOR', @level2type=N'COLUMN',@level2name=N'WORK_SCOPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医生所属科室ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DOCTOR', @level2type=N'COLUMN',@level2name=N'DEPART_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医生所属科室名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DOCTOR', @level2type=N'COLUMN',@level2name=N'DEPARTMENT'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'医生信息' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DOCTOR'
GO
/****** Object:  Table [dbo].[HIS_DEPARTMENT]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_DEPARTMENT](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[DEPT_ID] [nvarchar](100) NULL,
	[DEPT_NAME] [nvarchar](100) NULL,
	[DEPT_ABBR] [nvarchar](100) NULL,
	[DEPT_TYPE] [nvarchar](20) NULL,
	[HOSP_AREA] [nvarchar](100) NULL,
 CONSTRAINT [SYS_C0051981] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DEPT_DATE_TIME] ON [dbo].[HIS_DEPARTMENT] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DEPT_ID] ON [dbo].[HIS_DEPARTMENT] 
(
	[DEPT_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DEPT_MODIFY_TIME] ON [dbo].[HIS_DEPARTMENT] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DEPARTMENT', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DEPARTMENT', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DEPARTMENT', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DEPARTMENT', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DEPARTMENT', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DEPARTMENT', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'科室ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DEPARTMENT', @level2type=N'COLUMN',@level2name=N'DEPT_ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'科室名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DEPARTMENT', @level2type=N'COLUMN',@level2name=N'DEPT_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'科室简称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DEPARTMENT', @level2type=N'COLUMN',@level2name=N'DEPT_ABBR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'科室类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DEPARTMENT', @level2type=N'COLUMN',@level2name=N'DEPT_TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所属院区' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DEPARTMENT', @level2type=N'COLUMN',@level2name=N'HOSP_AREA'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'科室信息' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_DEPARTMENT'
GO
/****** Object:  Table [dbo].[HIS_ALLERGY]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ALLERGY](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[ALLE_ID] [nvarchar](90) NULL,
	[ALLE_NAME] [nvarchar](90) NULL,
	[ALLE_TYPE] [nvarchar](90) NULL,
 CONSTRAINT [SYS_C0051989] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ALLE_DATE_TIME] ON [dbo].[HIS_ALLERGY] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ALLE_ID] ON [dbo].[HIS_ALLERGY] 
(
	[ALLE_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ALLE_MODIFY_TIME] ON [dbo].[HIS_ALLERGY] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ALLERGY', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ALLERGY', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ALLERGY', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ALLERGY', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ALLERGY', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ALLERGY', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'过敏药物名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ALLERGY', @level2type=N'COLUMN',@level2name=N'ALLE_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'过敏药物类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ALLERGY', @level2type=N'COLUMN',@level2name=N'ALLE_TYPE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'过敏药物' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ALLERGY'
GO
/****** Object:  Table [dbo].[HIS_ADMIN_ROUTE]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ADMIN_ROUTE](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[ROUTE_ID] [nvarchar](90) NULL,
	[ROUTE_CODE] [nvarchar](90) NULL,
	[ROUTE_NAME] [nvarchar](90) NULL,
 CONSTRAINT [SYS_C0051985] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ADR_DATE_TIME] ON [dbo].[HIS_ADMIN_ROUTE] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ADR_MODIFY_TIME] ON [dbo].[HIS_ADMIN_ROUTE] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ADR_ROUTE_ID] ON [dbo].[HIS_ADMIN_ROUTE] 
(
	[ROUTE_ID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_ROUTE', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_ROUTE', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_ROUTE', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_ROUTE', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_ROUTE', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_ROUTE', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药途径编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_ROUTE', @level2type=N'COLUMN',@level2name=N'ROUTE_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药途径名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_ROUTE', @level2type=N'COLUMN',@level2name=N'ROUTE_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药途径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_ROUTE'
GO
/****** Object:  Table [dbo].[HIS_ADMIN_FREQUENCY]    Script Date: 07/02/2019 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIS_ADMIN_FREQUENCY](
	[ID] [decimal](20, 0) NOT NULL,
	[CREATOR] [nvarchar](40) NULL,
	[CREATE_TIME] [datetime] NULL,
	[MODIFIER] [nvarchar](40) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ORG_CODE] [nvarchar](100) NULL,
	[FREQ_ID] [nvarchar](90) NULL,
	[FREQ_CODE] [nvarchar](90) NULL,
	[FREQ_NAME] [nvarchar](90) NULL,
 CONSTRAINT [SYS_C0051987] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ADF_DATE_TIME] ON [dbo].[HIS_ADMIN_FREQUENCY] 
(
	[CREATE_TIME] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ADF_FREQ_ID] ON [dbo].[HIS_ADMIN_FREQUENCY] 
(
	[FREQ_ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ADF_MODIFY_TIME] ON [dbo].[HIS_ADMIN_FREQUENCY] 
(
	[MODIFY_TIME] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_FREQUENCY', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_FREQUENCY', @level2type=N'COLUMN',@level2name=N'CREATOR'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_FREQUENCY', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_FREQUENCY', @level2type=N'COLUMN',@level2name=N'MODIFIER'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_FREQUENCY', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'*机构编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_FREQUENCY', @level2type=N'COLUMN',@level2name=N'ORG_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药频率编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_FREQUENCY', @level2type=N'COLUMN',@level2name=N'FREQ_CODE'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药频率名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_FREQUENCY', @level2type=N'COLUMN',@level2name=N'FREQ_NAME'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'给药频率' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIS_ADMIN_FREQUENCY'
GO
