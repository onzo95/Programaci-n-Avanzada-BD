USE Northwind_S02_Lab;

select  CustomerID,
CompanyName, ContactName
from Customers
where CustomerID = 'HUNGO'

begin tran;

delete from [Order Details]
where OrderID = 10262

delete from Orders
where CustomerID = 'HUNGO'

delete from Customers
where CustomerID = 'HUNGO'

select  CustomerID,
CompanyName, ContactName
from Customers
where CustomerID = 'HUNGO'

rollback; 

select  CustomerID,
CompanyName, ContactName
from Customers
where CustomerID = 'HUNGO'