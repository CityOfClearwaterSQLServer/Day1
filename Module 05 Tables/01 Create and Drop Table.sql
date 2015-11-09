use SQLClass


create table Test (col1		varchar(20))
drop table Test

create table Sales.Test (col1		varchar(20))
drop table Sales.Test


drop table Sales.SalesDetails
drop table Sales.Sales
drop table Sales.Customers
drop table Manufacturing.Products

create table Manufacturing.Products
(
	SKU					char(10)			
		constraint pkProductsSKU primary key,
	ProductName			varchar(50)			not null,
	Price				money				null,
	ShortDescription	varchar(1000)		not null,
	[Description]		varchar(max)		null
)

create table Sales.Customers
(
	AccountNumber		int					identity(100, 1)
		constraint pkCustomersAccountNumber primary key,      -- nonclustered,
	FirstName			varchar(50)			not null,
	LastName			varchar(100)		not null,
	Email				varchar(255)		not null
		constraint uqCustomersEmail unique,					  -- clustered,
	Phone				char(12)			null
		constraint ckCustomersPhone 
		check (Phone like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),

	[State]				char(2)				null
		constraint dfCustomersState default 'FL'

	-- Table Level Constraint
--	, constraint ckCustomersPhone check (Phone like 
--						'[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
--	, constraint uqCustomersEmail unique (Email)
)

create table Sales.Sales
(
	InvoiceNum			char(15)			constraint pkSalesInvoiceNum primary key,
	OrderDate			datetime			not null
		constraint dfSalesOrderDate default GetDate(),
	AccountNumber		int					not null
		constraint fkSalesCustomersAccountNumber
		references Sales.Customers(AccountNumber)
)

create table Sales.SalesDetails
(
	-- Column Definitions
	InvoiceNum			char(15)
		constraint fkSalesDetailsSalesInvoiceNum
		references Sales.Sales(InvoiceNum),
	SKU					char(10)
		constraint fkSalesDetailsProductsSKU
		references Manufacturing.Products(SKU),
	Quantity			int					not null,

	-- Table Level Constraint
	constraint pkSalesDetails primary key (InvoiceNum, SKU)

--  , constraint fkSalesDetailsSalesInvoiceNum foreign key (InvoiceNum)
--	references Sales(InvoiceNum)
)
