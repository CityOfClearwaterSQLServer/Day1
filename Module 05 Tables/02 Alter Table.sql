use SQLClass

alter table Sales.Customers add Address1 varchar(50) not null

alter table Sales.Customers add
	Address2	varchar(50)		null,
	Address3	varchar(50)		null

alter table Sales.Customers drop column Address1

alter table Sales.Customers drop column Address2, Address3

alter table Sales.Sales 
	drop constraint fkSalesCustomersAccountNumber
alter table Sales.Customers 
	drop constraint pkCustomersAccountNumber
alter table Sales.Sales 
	alter column AccountNumber bigint
alter table Sales.Customers 
	alter column AccountNumber bigint
alter table Sales.Customers 
	add constraint pkCustomersAccountNumber primary key (AccountNumber)
alter table Sales.Sales
	add constraint fkSalesCustomersAccountNumber
	foreign key (AccountNumber) references Sales.Customers(AccountNumber)

alter table Sales.Customers
	nocheck constraint ckCustomersPhone
alter table Sales.Customers
	check constraint ckCustomersPhone