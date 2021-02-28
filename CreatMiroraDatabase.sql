create database DB_Watch_Master
go
use DB_Watch_Master
go
create table Categories(
	CatalogID int identity(1,1) primary key,
	CatName nvarchar(100),
	CatPriority int,
	CatDescription ntext,
	ParentID int,
	CatStatus bit
)

go
create table Colors(
	ColorID int identity(1,1) primary key,
	ColorName nvarchar(50),
	ColorStatus bit 
)
go
create table Product(
	ProductID varchar(5) primary key,
	ProductName nvarchar(100) unique,
	Title nvarchar(100),
	ProductDescription ntext,
	CreatedDate date default getdate(),
	ImageMain varchar(100),
	Discount float,
	ProductView int,
	Price float,
	ProductStatus bit,
)
go
create table CatProduct(
	CatProId int identity(1,1) primary key,
	CatId int foreign key references Categories(CatalogID),
	ProductID varchar(5) foreign key references Product(ProductID),
)
go
create table ProductDetail(
	ProductDetailID int identity(1,1) primary key,
	ProductID varchar(5) foreign key references Product(ProductID),
	ColorID int foreign key references Colors(ColorID),
	Quantity int,
	ProductDtStatus bit default 1,
)
create table Users(
	UserId int identity(1,1) primary key,
	UserName nvarchar(50),
	UserPassword varchar(16),
	Gender bit,
	Mail varchar(100),
	Phone char(10),
	UserAddress varchar(200),
	UserStatus bit default 1,
	Permission bit default 0, 
)
go
create table Orders(
	OrderId int identity(1,1) primary key,
	UserId int foreign key references Users(UserID),
	CreatedDate date default getdate(),
	TotalAmount float,
	OrderStatus bit default 0
)
create table OrderDetail(
	OrderDetailID int identity(1,1) primary key,
	OrderId int foreign key references Orders(OrderId),
	ProductDetailID int foreign key references ProductDetail(ProductDetailID),
	Quantity int,
	Amount float,
	OrderStatus bit,
	
)
create table Comment(
	CommentId int identity(1,1) primary key,
	ProductID varchar(5) foreign key references Product(ProductID),
	UserId int foreign key references Users(UserId),
	CreatedateComment date default getdate(),
	CommentContent ntext,
	ParentId int ,
	CommentStatus bit default 0
)
create table Stars(
	StarID int identity(1,1) primary key,
	ProductID varchar(5) foreign key references Product(ProductID),
	UserID int foreign key references Users(UserID),
	Mark int
)
Create table Favorite(
	FavoriteID int identity(1,1) primary key,
	ProductID varchar(5) foreign key references Product(ProductID),
	UserID int foreign key references Users(UserID),
)
Create table Banner(
	BannerID int identity(1,1) primary key,
	BannerName varchar(100),
	Imagelink varchar(100),
	BannerLink varchar(100),
	BannerPriority int,
	BannerStatus bit default 1
)
create table Images(
	ImageId int identity(1,1) primary key,
	ProductID varchar(5) foreign key references Product(ProductID),
	ImageLink varchar(100),
	ImageStatus bit	 
)
create table NewType(
	NewsTypeID varchar(10) primary key,
	TypeName nvarchar(100),
	NewsTypeStatus bit
)
create table News(
	NewsID int identity(1,1) primary key,
	CreateDate datetime,
	NewsTypeID varchar(10) foreign key references NewType(NewsTypeID),
	Tittle ntext,
	NewsDescription ntext,
	NewsStatus bit
)
create table SystemWatch(
	SystemID int primary key identity(1,1),
	SystemName varchar(100),
	Systemvalue ntext,
)
--alter table	Product
--add ImageMain varchar(100)
--go
--alter table ProductDetail
--drop column Imagelink
--go
--alter table Comment
--ADD CONSTRAINT df_CommentStatus
--DEFAULT 0 FOR CommentStatus;
--go
--alter table Orders
--ADD CONSTRAINT df_OrderStatus
--DEFAULT 0 FOR OrderStatus;
--alter table ProductDetail
--ADD CONSTRAINT df_ProductDtStatus
--DEFAULT 1 FOR ProductDtStatus;