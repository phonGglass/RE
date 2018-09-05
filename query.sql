create database RealEstate
on primary --Tập tin data
( 
  size = 512MB
  ,filegrowth = 10%
  ,maxsize = 5TB
  ,filename = 'E:\RealEstate\sql\RealEstate.mdf'
  ,name = RealEstate
)
log on --Tập tin log
(
  size = 512MB
  ,filegrowth = 10%
  ,maxsize = unlimited
  ,filename = 'E:\RealEstate\sql\RealEstate.ldf'
  ,name = RealEstate_Log
)
go

use RealEstate
go

----------------------- Create table
create table ACCOUNT
(
	accID int identity(1,1) not null,
	userName nvarchar(100) null,
	passWords nvarchar(100) null,
	phone nvarchar(100) null,
	email nvarchar(100) null,
	emailBackup1 nvarchar(100) null,
	emailBackup2 nvarchar(100) null,
	zaloLink nvarchar(500) null,
	[session] int null

	constraint pk_acc primary key (accID)
)
go

create table INVEST
(
	investID int identity(1,1) not null,
	images nvarchar(500) null,
	descriptions nvarchar(3000) null 

	constraint pk_invest primary key (investID)
)
go

create table FAMILY
(
	familyID int identity(1,1) not null,
	images nvarchar(500) null,
	descriptions nvarchar(3000) null
	
	constraint pk_family primary key (familyID) 
)
go

create table UTILITIES
(
	utilitiesID int identity(1,1) not null,
	images nvarchar(500) null,
	descriptions nvarchar(3000) null 

	constraint pk_utiliti primary key (utilitiesID)
)
go

create table ENTERTAINMENT
(
	entertainmentID int identity(1,1) not null,
	images nvarchar(500) null,
	descriptions nvarchar(3000) null 

	constraint pk_entertainment primary key (entertainmentID)
)
go

create table [EVENT]
(
	eventID int identity(1,1) not null,
	images nvarchar(500) null,
	descriptions nvarchar(3000) null 

	constraint pk_event primary key (eventID)
)
go

create table PRODUCTDETAIL
(
	productDetailID int identity(1,1) not null,
	productName nvarchar(500) null,
	images nvarchar(500) null,
	descriptions nvarchar(3000) null 

	constraint pk_proDetail primary key (productDetailID)
)
go

create table STAGE
(
	stageID int identity(1,1) not null,
	stageName nvarchar(500) null,
	images nvarchar(500) null,
	descriptions nvarchar(3000) null 

	constraint pk_stage primary key (stageID)
)
go

create table PRODUCTINFO
(
	productInfoID int identity(1,1) not null,
	productDetailID int null,
	stageID int null

	constraint pk_proInfo primary key (productInfoID),
	constraint fk_proDe foreign key (productDetailID) references PRODUCTDETAIL(productDetailID)
	on delete cascade
	on update cascade,
	constraint fk_stage foreign key (stageID) references STAGE(stageID)
	on delete cascade
	on update cascade,
)
go

create table TYPEOFPROJECT
(
	typeOfProjectID int identity(1,1) not null,
	productInfoID int null,
	stageID int null 

	constraint pk_typeOfPro primary key (typeOfProjectID)
)
go



create table PROJECTINFO
(
	projectInfoID int identity(1,1) not null,
	projectName nvarchar(100) null,
	images nvarchar(500) null,
	video nvarchar(500) null,
	investor nvarchar(500) null,
	supplier nvarchar(500) null,
	typeOfProjectID int null,
	investID int null,
	familyID int null,
	utilitiesID int null,
	entertainmentID int null,
	eventID int null,
	productInfoID int null,
	accID int null,
	descirption nvarchar(3000) null

	constraint pk_projectinfo primary key (projectInfoID),
	constraint fk_1 foreign key (typeOfProjectID) references TYPEOFPROJECT(typeOfProjectID)
	on delete cascade
	on update cascade,
	constraint fk_2 foreign key (investID) references INVEST(investID)
	on delete cascade
	on update cascade,
	constraint fk_3 foreign key (familyID) references FAMILY(familyID)
	on delete cascade
	on update cascade,
	constraint fk_4 foreign key (utilitiesID) references UTILITIES(utilitiesID)
	on delete cascade
	on update cascade,
	constraint fk_5 foreign key (entertainmentID) references ENTERTAINMENT(entertainmentID)
	on delete cascade
	on update cascade,
	constraint fk_6 foreign key (eventID) references [EVENT](eventID)
	on delete cascade
	on update cascade,
	constraint fk_7 foreign key (productInfoID) references PRODUCTINFO(productInfoID)
	on delete cascade
	on update cascade,
	constraint fk_8 foreign key (accID) references ACCOUNT(accID)
	on delete cascade
	on update cascade
)
go

