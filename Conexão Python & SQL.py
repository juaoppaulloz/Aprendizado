FEITO NO JUPYTER(PYTHON)


--CREATE DATABASE PythonSQL
/*
CREATE TABLE Vendas(
id_venda INT PRIMARY KEY IDENTITY(1, 1),
data_venda DATE,
cliente VARCHAR (100),
produto VARCHAR (100),
preco DECIMAL (10,2),
quantidade INT
)
*/
/*
INSERT INTO Vendas (data_venda,cliente,produto,preco,quantidade) VALUES
('26/03/2025', 'Ana', 'Celular', 2000, 1)
*/

Select * From Vendas

--------------------------------------------------------------------------------
pip install pyodbc
pip install pandas as pd

import pyodbc
import pandas as pd

dados_conexao = (
    "Driver={SQL Server};"
    "Server=NOTEBOOK-CAR-02;"
    "Database=PythonSQL;"
)

conexao = pyodbc.connect(dados_conexao)
print("Conexão bem sucedida")
-------------------------------------------------------------------------------
cursor = conexao.cursor()

comando = """INSERT INTO Vendas(data_venda,cliente,produto,preco,quantidade) VALUES ('26/03/2025','Pedro','IOS',2000,1)"""
cursor.execute(comando)
cursor.commit()
print("Dados inseridos com Sucesso")
-----------------------------------------------------------------------
cursor = conexao.cursor()
comando = """INSERT INTO Vendas(data_venda,cliente,produto,preco,quantidade) VALUES ('03/02/2003','Joao','Xbox',1850,1)"""
cursor.execute(comando)
cursor.commit()
print("Dados inseridos com Sucesso")
-----------------------------------------------------------
cursor = conexao.cursor()
comando = """INSERT INTO Vendas(data_venda,cliente,produto,preco,quantidade) VALUES ('12/10/2003','Ketlen','Creme de Cabelo',300,4)"""
cursor.execute(comando)
cursor.commit()
print("Dados inseridos com Sucesso")
--------------------------------------------------------------------------
comando_sql = "Select * From Vendas"
dados = pd.read_sql(comando_sql, conexao)
display(dados)
-----------------------------------------------------------------------------------
cursor = conexao.cursor()

#Criando a tabela
comando = """
CREATE TABLE CLIENTE(
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(30),
    data DATETIME
);"""

# Executando o comando SQL
cursor.execute(comando)
conexao.commit()
print("Tabela criada com sucesso!")
----------------------------------------------------------------------------------------
cursor = conexao.cursor()

comando = """INSERT INTO CLIENTE (nome, data) VALUES ('Carlos', '03/02/2003')"""
cursor.execute(comando)
cursor.commit()
print("Dados inseridos com Sucesso")
--------------------------------------------------------------------------------------------
cursor = conexao.cursor()

comando = """INSERT INTO CLIENTE (nome, data) VALUES ('Joao Paulo', '03/02/2003')"""
cursor.execute(comando)
cursor.commit()
print("Dados inseridos com Sucesso")
-------------------------------------------------------------------------------------------
cursor = conexao.cursor()

comando = """INSERT INTO CLIENTE (nome, data) VALUES ('Ketlen', '12/10/2003')"""
cursor.execute(comando)
cursor.commit()
print("Dados inseridos com Sucesso")
----------------------------------------------------------------------------------------
comando_sql = "Select * From Cliente"
dados = pd.read_sql(comando_sql, conexao)
display(dados)
---------------------------------------------------------------------------------------------
cursor = conexao.cursor()

# Definição dos valores
data = '2023-04-18' # Correção do formato de data YYYY-MM-DD
cliente = 'João Paulo'
produto = 'Tablet'
preco = 1850
quantidade = 1

# Corrigindo a formatação SQL
comando = f"""
INSERT INTO Vendas(data_venda, cliente, produto, preco, quantidade)
VALUES ('{data}', '{cliente}', '{produto}', {preco}, {quantidade})
"""

#Exercutando o comando
cursor.execute(comando)

# Commit correto
conexao.commit()

print("Dados inseridos com sucesso")
------------------------------------------------------------------------------------------------
comando_sql = "Select * From Vendas"
dados = pd.read_sql(comando_sql, conexao)
display(dados)
--------------------------------------------------------------------
cursor = conexao.cursor()

comando = """Delete From Cliente Where nome = 'Pedro'"""
cursor.execute(comando)
conexao.commit()

print("Dados deletados")



















