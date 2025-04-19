JOINS, OPERAÇÕES MATEMÁTICAS, DECLARE_SET e CONSULTAS

--LEFT, RIGHT E INNER JOIN: Exemplos práticos
--CREATE DATABASE Joins (Criando um banco de dados novo)

/*--USANDO JOIN NA TABELA
--LEFT JOIN
Select id_produto, nome_produto, produtos.id_subcategoria, nome_subcategoria 
FROM produtos
LEFT JOIN subcategorias ON produtos.id_subcategoria = subcategorias.id_subcategoria

--RIGHT JOIN
Select id_produto, nome_produto, produtos.id_subcategoria, nome_subcategoria 
FROM produtos
RIGHT JOIN subcategorias ON produtos.id_subcategoria = subcategorias.id_subcategoria

--INNER JOIN
Select id_produto, nome_produto, produtos.id_subcategoria, nome_subcategoria 
FROM produtos
INNER JOIN subcategorias ON produtos.id_subcategoria = subcategorias.id_subcategoria

--FULL JOIN
Select id_produto, nome_produto, produtos.id_subcategoria, nome_subcategoria 
FROM produtos
FULL JOIN subcategorias ON produtos.id_subcategoria = subcategorias.id_subcategoria
*/
	
/*--USANDO ANTI JOIN NA TABELA
--LEFT ANTI JOIN
Select id_produto, nome_produto, produtos.id_subcategoria, nome_subcategoria 
FROM produtos
LEFT JOIN subcategorias ON produtos.id_subcategoria = subcategorias.id_subcategoria
WHERE subcategorias.id_subcategoria IS NULL

--RIGHT ANTI JOIN
Select id_produto, nome_produto, produtos.id_subcategoria, nome_subcategoria 
FROM produtos
RIGHT JOIN subcategorias ON produtos.id_subcategoria = subcategorias.id_subcategoria
WHERE produtos.id_subcategoria IS NULL

--FULL ANTI JOIN
Select id_produto, nome_produto, produtos.id_subcategoria, nome_subcategoria 
FROM produtos
FULL JOIN subcategorias ON produtos.id_subcategoria = subcategorias.id_subcategoria
WHERE produtos.id_subcategoria IS NULL OR subcategorias.id_subcategoria IS NULL
*/

/*--CROSS JOIN NA TABELA
Select nome_produto, nome_subcategoria
FROM produtos CROSS JOIN subcategorias
*/

/*--UNION E UNION ALL
Select FirstName, BirthDate From DimCustomer
Where Gender = 'F' UNION
Select FirstName, BirthDate From DimCustomer
Where Gender = 'M'

Select FirstName, BirthDate From DimCustomer
Where Gender = 'F' UNION ALL
Select FirstName, BirthDate From DimCustomer
Where Gender = 'M'
*/

/* --CAST E VARIANT PROPERTY
Select CAST (21.45 AS INT)
Select CAST (21.45 AS FLOAT)
Select CAST (18.7 AS VARCHAR(30))
Select CAST ('31/05/2014' AS DATETIME)
Select SQL_VARIANT_PROPERTY('31/05/2014', 'Basetype') AS 'Data 1'
Select SQL_VARIANT_PROPERTY(CAST('31/05/2014' AS datetime), 'BaseType') AS 'Data 2'
*/

/*--FORMAT
--a) Numérico

Select FORMAT (1000, 'N') AS 'Número'
Select FORMAT (1000, 'G') AS 'Geral'
Select FORMAT (1000, 'C') AS 'Moeda'

--b) Personalizados
Select FORMAT (123456789, '###-##-####') AS 'Personalizado'

--c) Data
Select FORMAT(CAST('21/03/2021' AS DATETIME), 'dd/MM/yyyy') AS 'Data'
*/

/*--ROUND, FLOOR e CEILING
--ROUND Arredonda com casas decimais
--FLOOR Arredonda para baixo
--CEILING Arredonda para cima

Select ROUND (18.739130, 2) AS 'Round 1'

Select ROUND (18.739130, 2, 1) AS 'Round 2'

Select FLOOR (18.739130) AS 'FLOOR'

Select Ceiling (18.739130) AS 'CEILING'
*/

/*--DECLARE E SET
Declare @quantidade INT
Set @quantidade = 100
Select @quantidade

Declare @idade INT
Set @idade = 30
Select @idade

Declare @preço FLOAT
Set @preço = 10.89
Select @preço

Declare @preco2 FLOAT
Set @preco2 = 10.89
Select @preco2

Declare @nome VARCHAR
Set @nome = 'Mateus'
Select @nome

Declare @data DATETIME
Set @data = '28-10-2021'
Select @data
*/

/*--VARIAVEIS DENTRO DE CONSULTAS
Declare @varDesconto FLOAT
Set @varDesconto = 0.1

Select 
	ProductKey AS "ID",
	ProductName AS "Nome do Produto",
	UnitPrice AS "Preço",
	UnitPrice * (1 - @varDesconto) AS "Preço com Desconto"

FROM DimProduct


Declare @varData DATETIME
Set @varData = '01/01/1980'

Select 
	FirstName AS "Nome",
	LastName AS "Sobrenome",
	BirthDate AS "Nascimento",
	'Cliente' AS 'Tipo'

From DimCustomer
Where BirthDate >= @varData

UNION

Select
	FirstName AS "Nome",
	LastName AS "Sobrenome",
	BirthDate AS "Nascimento",
	'Funcionário' AS 'Tipo'

From DimEmployee
Where BirthDate >= @varData
Order By Nascimento

SET NOCOUNT ON

Declare @varData DATETIME
Declare @varNumFuncionarios INT
Declare @varNumClientes INT
Set @varData = '01/01/1980'

--Select 'Numero de Funcionários', @varNumFuncionarios
--UNION
--Select 'Numero de Clientes', @varNumClientes

Set @varNumFuncionarios = (Select Count (*) From DimEmployee Where BirthDate >= @varData)
Set @varNumClientes = (Select Count (*) From DimCustomer Where Birthdate >= @varData)

PRINT 'Numero de Funcionarios = ' + CAST(@varNumFuncionarios AS VARCHAR(MAX))
PRINT 'Numero de Clientes = ' + CAST(@varNumClientes AS VARCHAR(MAX))

Select TOP (100) * From FactSales
Declare @varProdutoMaisVendido INT
Declare @varTotalMaisVendido FLOAT

Select TOP(1)
@varProdutoMaisVendido = ProductKey,
@varTotalMaisVendido = SalesAmount

From FactSales
Order BY SalesAmount DESC

Select @varProdutoMaisVendido AS 'Produto', @varTotalMaisVendido AS 'Total'

Select ProductName
From DimProduct
Where ProductKey = @varProdutoMaisVendido

Select * From DimProduct



Declare @ListaNomes VARCHAR (MAX)
Set @ListaNomes  = ' '

Select @listanomes = @Listanomes + FirstName + ', ' + Char(10)
From DimEmployee
Where DepartmentName = 'Marketing'

Print LEFT (@ListaNomes, DATALENGTH(@ListaNomes) -3)




Select @@SERVERNAME AS 'Nome do Servidor'

Select @@VERSION "Versão"

Select * From DimProduct
Select @@ROWCOUNT "Contagem de Linhas"



Declare @valor1 INT		Set @valor1 = 10
Declare @valor2 INT		Set @valor2 = 5
Declare @valor3 FLOAT		Set @valor3 = 34
Declare @valor4 FLOAT		Set @valor4 = 7

Declare @soma INT			Set @soma = @valor1 + @valor2
Declare @subtração INT		Set @subtração = @valor3 - @valor4
Declare @multiplicacao INT	Set @multiplicacao = @valor1 * @valor4
Declare @divisao Float		Set @divisao = @valor3/@valor4

Select @soma
Select @subtração
Select @multiplicacao
Select round(@divisao,2)
*/

/*-- CONCAT
Select	FirstName "Nome",
		LastName "Sobrenome",
		Emailaddress "E-mail",
		CONCAT (FirstName, ' ', LastName , ' - email: ' , Emailaddress) "Nome e Email"
From DimCustomer
*/

/*-- LEFT & RIGHT
Select	ProductName "Nome",
		UnitPrice "Preço",
		Left (StyleName, 7) "Cod 1",
		Right (StyleName, 7) "Cod 2"
From DimProduct
*/

/*-- REPLACE
Select	CONCAT (FirstName, ' ', LastName) AS 'Nome Completo',
		Gender AS 'Sexo (Abrev)',
		REPLACE (REPLACE(Gender, 'M', 'Masculino'), 'F', 'Feminino') AS 'Sexo (Extenso)'
From DimCustomer
*/

/*--TRANSLATE e STUFF
Select TRANSLATE ('3*[2+1]/{8-4}', '[]{}', '()()') "TRANSLATE 1"
Select TRANSLATE ('ABCD-490123', 'ABCD', 'WXYZ') "TRANSLATE 2"
Select STUFF ('Vba Impressionador', 1, 3, 'Excel') "Stuff"
*/

/*--CRIANDO BANCO E TABELAS
CREATE DATABASE aulas_SQL
CREATE TABLE produtos 
(
id_produto INT IDENTITY(1,1) PRIMARY KEY,
nome_produto varchar(30),
id_subcategoria int
)
INSERT INTO produtos (nome_produto, id_subcategoria)
VALUES
('Fone Bluetooth JBL', 5),
('PS4', 6),
('Notebook Samsung I3', 2),
('Iphone 11', 1),
('Moto G9', 1)

CREATE TABLE subcategorias
(
id_subcategoria INT IDENTITY(1,1) PRIMARY KEY,
nome_subcategoria VARCHAR(30)
)

INSERT INTO subcategorias (nome_subcategoria)
VALUES
('Celular'),
('Notebook'),
('Câmera Digital'),
('Televisão'),
('Fone de ouvido')

--Select * From produtos
--Select * From subcategorias
*/

						--EXERCÍCIOS


						--Exercício 1
/*
Select 
ProductSubCategoryname "Nome Sub Categoria",
ProductKey "Chave do Produto"
FROM DimProduct
INNER JOIN DimProductSubcategory ON DimProduct.ProductSubCategoryKey = DimProductSubcategory.ProductSubcategoryKey
*/
						
						
						--Exercício 2	
/*
Select ProductSubCategoryKey "Id da Sub categoria",
ProductSubCategoryName "Sub Categoria",
ProductCategoryName "Categoria"
From DimProductSubcategory
LEFT JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

/*
Select Storekey, StoreName, EmployeeCount, ContinentName, RegionCountryName
From DimStore
Left Join DimGeography on dimstore.geographykey = DimGeography.GeographyKey
*/


						--Exercício 3
/*
Select Productname, ProductDescription
From DimProduct
Left Join DimProductSubCategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
*/


						--Exercicio 4
/*
--Select TOP (100) * From FactStrategyPlan
Select StrategyPlanKey, Datekey, AccountName, Amount
From FactStrategyPlan
Inner Join DimAccount ON FactStrategyPlan.AccountKey = DimAccount.AccountKey

Declare @produto VARCHAR(20)
Declare @quantidade FLOAT
Declare @preco FLOAT 
Declare @faturamento FLOAT

Set @produto = 'Celular'
Set @quantidade = 12
Set @preco = 9.99 
Set @faturamento = @preco * @quantidade

Select	@produto "Produto",
		@quantidade "Quantidade",
		FORMAT (@preco, 'C') "Preço",
		FORMAT (@faturamento, 'C') "Faturamento" 
*/
			
			
						--Exercício 5
/*
Declare @nome VARCHAR (30)	SET @nome = 'André'
Declare @datanasci DATETIME SET @datanasci = '10-02-1998'
Declare @num_pets INT		SET @num_pets = 2

Print 'Meu nome é ' + @nome + ', nasci em ' + FORMAT(@datanasci, 'dd/MM/yyyy') + ' e tenho ' + CAST(@num_pets AS VARCHAR(MAX)) + ' pets.'
*/


						--Exercício 6
/*
Declare @nomedaslojas VARCHAR (MAX) Set @nomedaslojas = ' '

Select @nomedaslojas = @nomedaslojas + StoreName + ', ' From DimStore
Where CloseDate BetWeen '01/01/2008' AND '31/12/2008'

Print 'As lojas fechadas no ano de 2008 foram: ' + @nomedaslojas
*/


						--Exercício 7
/*
Declare @id_subcategoria INT
Declare @subcategoria VARCHAR (100)

Set @subcategoria = 'Lamps'
Set @id_subcategoria = (Select ProductSubCategoryKey From DimProductSubcategory Where ProductSubcategoryName = @subcategoria)

Select * From DimProduct
Where ProductSubcategoryKey = @id_subcategoria
*/


						--Exercicio 8
/*
-- Operações Básicas
Select 10 AS 'Número'
Select 'Marcus' as 'Nome'
Select '21/06/2021' AS 'Data'

-- Operações com números 

Select 10+20
Select 20-5
Select 31*40
Select 431.0/23

-- Operações com Textos
Select 'SQL' + ' ' + 'Impressionador'
*/
