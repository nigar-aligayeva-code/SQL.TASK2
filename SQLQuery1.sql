CREATE DATABASE Relations302
USE Relations302
CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(200) UNIQUE
)


CREATE TABLE Products(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50) NOT NULL,
Price DECIMAL(5,2),
Cost DECIMAL(5,2),
CategoryId INT FOREIGN KEY REFERENCES Categories(Id)
)

CREATE TABLE Colors(
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(50) UNIQUE
)


CREATE TABLE ProductAndColor(
    ProductId INT FOREIGN KEY REFERENCES Products(Id),
    ColorId INT FOREIGN KEY REFERENCES Colors(Id),
    PRIMARY KEY (ProductId, ColorId)
)
SELECT p.Name AS [Product Name], clr.Name [Color Name], ctg.Name AS [Category Name] FROM Products AS p
JOIN ProductAndColor AS pc
ON p.Id=pc.ProductId 
JOIN Colors AS clr
ON clr.Id=pc.ColorId
JOIN Categories AS ctg
ON p.CategoryId = ctg.Id