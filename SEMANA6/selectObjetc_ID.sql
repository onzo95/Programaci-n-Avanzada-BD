USE Northwind_S02_Lab;

SELECT OBJECT_ID('dbo.HappyBirthdayEmployeeView', 'V') AS ViewIdBefore;

DROP VIEW IF EXISTS dbo.HappybirthdayEmployeeView

SELECT OBJECT_ID('dbo.HappyBirthdayEmployeeView', 'V') AS ViewIdAfter;