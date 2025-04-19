print("Hello World")
pip install matplotlib
pip install pandas
pip install pyodbc
# importando as bibliotecas necessárias:

import pyodbc
import pandas as pd
import matplotlib

#criando dados de conexão
import pyodbc
import pandas as pd
import matplotlib

dados_conexao = (
    "Driver={SQL Server};"
    "Server=NOTEBOOK-CAR-02;"
    "Database=ContosoRetailDW;"
)

# conectando
conexao = pyodbc.connect(dados_conexao)
print("Conexão bem Sucedida")
# fazendo a leitura da tabela do SQL Server

comando_sql = "SELECT ColorName, UnitPrice FROM DimProduct"

dados = pd.read_sql(comando_sql, conexao)

display (dados)
# criando um agrupamento do total de produtos por cores:
dados.groupby('ColorName').count()
# armazenando o agrupamento em uma variavel

total_produtos_por_cor = dados.groupby('ColorName').count()
display(total_produtos_por_cor)
# plotando um gráfico do agrupamento
total_produtos_por_cor.plot(kind='bar')
import pandas as pd
import matplotlib.pyplot as plt

# Supondo que os 'dados' ja tenham sidos carregados antes
agrupado = dados.groupby('ColorName').count()

# Criando a figura
plt.figure(figsize=(10, 5))

# Criando o gráfico de dispersão
plt.scatter(agrupado.index, agrupado.iloc[:, 0], color='red', marker='o')

# Configurando rótulos e título
plt.xlabel('Nome da Cor', fontsize=12)
plt.ylabel('Quantidade', fontsize=12)
plt.title('Dispersão de produtos por Cor', fontsize=14)
plt.xticks(rotation=45, ha='right') 

# Exibir o gráfico
plt.show()
# Supondo que os 'dados' ja tenham sidos carregados antes
agrupado = dados.groupby('ColorName').count()

# Criando a figura
plt.figure(figsize=(10, 5))

# Criando o gráfico de colunas horizontais
plt.barh(agrupado.index, agrupado.iloc[:, 0], color='royalblue')

# Configurando rótulos e título
plt.xlabel('Nome da Cor', fontsize=12)
plt.ylabel('Quantidade', fontsize=12)
plt.title('Contagem de Produtos por Cor', fontsize=14)

# Exibir o gráfico
plt.show()
# Supondo que os 'dados' ja tenham sidos carregados antes
agrupado = dados.groupby('ColorName').count()

# Criando a figura
plt.figure(figsize=(8, 8))

# Criando o gráfico de dispersão
plt.pie(agrupado.iloc[:, 0], labels=agrupado.index, autopct='%1.1F%%',colors=plt.cm.Paired.colors)

# Configurando rótulos e título
plt.title('Distribuição de Produto por Cor', fontsize=14)

# Exibir o gráfico
plt.show()
# Supondo que os 'dados' ja tenham sidos carregados antes
agrupado = dados.groupby('ColorName').count()

# Criando a figura
plt.figure(figsize=(8, 8))

# Criando a lista de espaçamentos (0,1 para todos os setores)
explode = [0.2] * len(agrupado) #Aumente o valor para mais espaçamento

# Criando o gráfico de dispersão
plt.pie(agrupado.iloc[:, 0], labels=agrupado.index, autopct='%1.1F%%',colors=plt.cm.Paired.colors, explode=explode, shadow=True)

# Configurando rótulos e título
plt.title('Distribuição de Produto por Cor', fontsize=14)

# Exibir o gráfico
plt.show()

