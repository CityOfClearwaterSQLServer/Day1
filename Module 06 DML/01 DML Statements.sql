use SQLClass

insert into Sales.Customers
values
('Fred', 'Flintstone', 'fred@slate.com', '000-555-1212', default)

insert into Sales.Customers
(FirstName, LastName, Email, Phone, State)
values
('Barney', 'Rubble', 'barney@slate.com', '000-555-1212', default)

update Sales.Customers
set Phone = '727-555-1212'
where Phone is null

delete from Sales.Customers
where State is null

insert Sales.Customers
(FirstName, LastName, Email)
	select distinct FirstName, LastName, EmailAddress
	from AdventureWorks2014.Sales.vIndividualCustomer

select * from Sales.Customers

select FirstName, LastName, EmailAddress as Email
	into ##Test								-- # = Local ## = Global Temporary
from AdventureWorks2014.Sales.vIndividualCustomer

select * from ##Test