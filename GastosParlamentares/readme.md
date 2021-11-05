# Análise de Dados do Custo da Atividade Parlamentar dos Senadores da República

#### Aluno: [Antonio Fernando Souza da Cunha](https://github.com/fernandonit).
#### Orientador: [Anderson Nascimento](https://github.com/insightds).

---

Trabalho apresentado ao curso [BI MASTER](https://ica.puc-rio.ai/bi-master) como pré-requisito para conclusão de curso e obtenção de crédito na disciplina "Projetos de Sistemas Inteligentes de Apoio à Decisão".

---

### Resumo

A atividade legislativa dos nossos parlamentares em Brasília tem um custo. Além dos salários e extras, existem outras despesas relacionadas às atividades legislativas no parlamento e que são de controle individual. Por controle individual entende-se gastos que não precisam passar por comissões, votações, negociações e sanções.

São possibilidades de despesas pré-estabelecidas e que não são necessariamente obrigatórias de execução. Gastos que não tem relação com a manutenção predial do congresso, por exemplo. Ou com os impostos e taxas que o congresso precisa pagar para permanecer funcional, como IPTU, luz e água. Ou com previsões de gastos que dependem de consenso e votação em plenário, como projetos e emendas.

O que este trabalho visa apresentar é a composição dos gastos que estão relacionados individualmente aos parlamentares, como passagens aéreas, contratação de comissionados, aluguéis e material de publicidade. O congresso publica mensalmente parte desses gastos, são os Dados Abertos.

Sobre os Dados Abertos, embora seja louvável a iniciativa de mostrar a população como é gasto o dinheiro de impostos do trabalhador, os dados carecem de estruturação. Como são fornecidos hoje, é praticamente impossível importá-los para uma ferramenta de BI e iniciar uma análise detalhada da composição das despesas. Além da falta de estruturação dos dados, não há por parte da imprensa que cobre os gastos púbicos um trabalho de consolidação e exibição dessas informações. Como foi feito com o consórcio de mídia que publica informações sobre a COVID-19.

Em outras palavras, o pagador de imposto não sabe onde e como consultar como seus eleitos no congresso lidam com o dinheiro público. Este trabalho de conclusão de curso tem como objetivo preencher esse espaço. Um projeto de tratamento dos Dados Abertos do Senado Federal. Desde o entendimento da composição do dado até a etapa final de exibição nos painéis, passando pela criação dos modelos transacional e multidimensional, transformação e carga dos dados.

Além do entendimento de como o dinheiro é gasto, este trabalho abre outras possibilidades. Como por exemplo, analisar se houve expansão ou retração dos gastos dos Senadores depois de 2018, ano em que tivemos uma eleição marcada pelo forte discurso moralizante e anticorrupção. Ou se a massificação do trabalho remoto em função da pandemia repercutiu nos gastos dos Senadores.

Importante enfatizar que para este trabalho não foram processados os dados da Câmara dos Deputados, apenas do Senado. A Câmara, ao contrário do Senado, não disponibiliza a identificação dos deputados no histórico de gastos com remuneração. Informam apenas o último salário do deputado. Além dos salários dos próprios parlamentares, estes contratam comissionados e alocam funcionários do congresso para seus gabinetes. Este é um item fundamental para a compreensão do custo da atividade parlamentar.

Sem informar o histórico de remuneração com a identificação dos deputados, a Câmara ficou de fora do estudo. A base de dados deste trabalho será atualizada caso a Câmara disponibilize o dado de remuneração identificado.

O processo de análise dos dados compreendeu as seguintes etapas:


Etapa 1 - Extração dos dados

Cota parlamentar (cotão): https://www12.Senado.leg.br/transparencia/dados-abertos-transparencia/dados-abertos-ceaps. Cotas para o exercício da atividade parlamentar dos Senadores (CEAPS), conhecido como Cotão. São valores reembolsados através da apresentação de notas fiscais e dentro de regras definidas pela Casa.
	
	
Remuneração: http://www.Senado.leg.br/transparencia/rh/servidores/consulta_remuneracao.asp. Informações sobre as remunerações pagas aos senadores e para os funcionários que trabalham sob sua supervisão, sejam eles comissionados ou próprios. Apenas os senadores são identificados nos arquivos. Comissionados e concursados não são identificados, apenas os lançamentos dos pagamentos são registrados e relacionados aos gabinetes e escritórios políticos dos senadores.


Viagens oficiais: https://www12.Senado.leg.br/transparencia/sen/viagens-oficiais. Registro dos gastos com passagens e seguros relacionados às viagens oficiais dos senadores. A viagem pode acontecer por iniciativa do senador ou da Casa. As diárias relativas as missões são computadas nas remunerações.
	  

Combustíveis: https://www12.Senado.leg.br/transparencia/sen/gastos-com-combustivel. Gastos dos senadores com combustíveis. Embora exista previsão para esta despesa no Cotão, ela também acontece de forma apartada. O site do Senado não informa a diferença entre este gasto com combustível e o do Cotão. Foram incluídos no estudo em função dos valores substanciais.


Despesas com assistência à saúde dos senadores: o senado publica o valor sumarizado e sem a identificação dos senadores. Como não é possível identitificar os senadores responsáveis pelas despesas, os gastos com saúde ficaram fora do trabalho.


Todos os arquivos foram extraídos a partir de 2018.



Etapa 2 - Desenho, construção e carga do banco de dados do modelo transacional

A partir da análise dos dados extraídos na etapa 1, foram gerados novos arquivos do tipo CSV que se encaixam com o modelo transacional gerado para este projeto. O SQL Power Architect foi a ferramenta utilizada para a construção do modelo e geração do script de criação das tabelas, estas sob o schema senado_transacional. O PostgreSQL foi o gerenciador de banco de dados escolhido para o projeto. A carga dos arquivos CSV foi realizada pela ferramenta de importação do pgAdmin.



Etapa 3 - Desenho, construção e carga do modelo multidimensional

A exemplo da etapa anterior, foi utilizado o SQL Power Architect para a construção do modelo e a geração do script de criação das tabelas, estas sob o schema senado_dw. Foi utilizado o Pentaho Data Integration para a transformação e carga dos dados nas tabelas do schema dw.



Etapa 4 - Construção dos painéis

Foi utilizado o Power BI para a criação dos seguintes painéis:
	
Visão geral
Visão por regiões e estados dos senadores
Visão por partidos
Detalhamento de despesas
Remuneração dos senadores
Visão por grupo de despesas
	
	

### Abstract

The legislative activity of our parliamentarians in Brasilia has a cost. In addition to salaries and extras, there are other expenses related to legislative activities in parliament that are individual control. Individual control means expenses that do not need to go through committees, votes, negotiations, and sanctions.

These are pre-established and non-compulsory implementation possibilities. Expenses that have nothing to do with the building maintenance of the congress, for example. Or with the taxes and fees that Congress needs to pay to remain functional, such as IPTU, light and water. Or with spending forecasts that depend on consensus and plenary voting, such as bills and amendments.

What this paper aims to present is the composition of expenses that are individually related to parliamentarians, such as air tickets, hiring commissioned, rents and advertising material. The congress publishes monthly part of these expenses, are the Dados Abertos.

On Dados Abertos, although it is commendable the initiative to show the population how the worker's tax money is spent, the data lacks structuring. As they are provided today, it is virtually impossible to import them into a BI tool and initiate a detailed analysis of the composition of expenses. In addition to the lack of structuring of the data, there is no press that covers the public expenditures a work of consolidation and display of this information. As was done with the media consortium that publishes information about COVID-19.

In other words, the taxpayer doesn't know where and how to consult how his elected officials in Congress handle public money. This course completion work aims to fill this space. A draft treatment of open data of the Federal Senate. From the understanding of the composition of the data to the final stage of display in the panels, through the creation of transactional and multidimensional models, transformation, and data load.

In addition to understanding how money is spent, this work opens other possibilities. For example, to analyze whether there was expansion or retraction of senators' spending after 2018, the year in which we had an election marked by strong moralizing and anti-corruption discourse. Or if the massification of remote work due to the pandemic has had an impact on senators' spending.

It is important to emphasize that for this work were not processed the data of the Chamber of Deputies, only the Senate. The Chamber, unlike the Senate, does not provide the identification of deputies in the history of spending on remuneration. They only report the deputy's last salary. In addition to the salaries of parliamentarians themselves, they hire commissioners and allocate congressional staff to their offices. This is a fundamental item for understanding the cost of parliamentary activity.

Without informing the history of remuneration with the identification of deputies, the Chamber was left out of the study. The database of this work will be updated if the Chamber makes available the identified remuneration data.

The data analysis process comprised the following steps:


1. Data extraction

	- Parliamentary quota (cotão): https://www12.Senado.leg.br/transparencia/dados-abertos-transparencia/dados-abertos-ceaps
	  
	  Quotas for the exercise of the parliamentary activity of senators (CEAPS), known as Cotão. These amounts are reimbursed through the presentation of invoices and within the rules defined by the Senate.
	
	
	- Remuneration: http://www.Senado.leg.br/transparencia/rh/servidores/consulta_remuneracao.asp

	  Information on the salaries paid to senators and to employees working under their supervision, whether commissioned or Senate officials.
	  
	  Only senators are identified in the archives. Commissioned and concursados are not identified, only the postings of payments are recorded and related to the offices and political offices of senators.


	- Official trips: https://www12.Senado.leg.br/transparencia/sen/viagens-oficiais

	  Record of expenses with tickets and insurance related to the official travel of senators. The trip can happen on the initiative of the senator or the House. The daily rates relating to the missions are computed in the remunerations.
	  

	- Fuels: https://www12.Senado.leg.br/transparencia/sen/gastos-com-combustivel
	
	  Senators' spending on fuel. Although there is a forecast for this expenditure in Cotão, it also happens in a separate way.
	  
	  The Senate website does not report the difference between this fuel expenditure and that of Cotão. They were included in the study according to the substantial values.


	- Senators' health care expenses
	
	  The Senate publishes the sumarized value and without the identification of senators. Since it is not possible to identify the senators responsible for the expenses, health spending was out of work.


	All files were extracted from 2018.



2 - Design, construction, and load of the transactional model database

	From the analysis of the data extracted in step 1, new CSV-type files were generated that fit with the transactional model generated for this project.
	
	SQL Power Architect was the tool used to construct the model and generate the script for creating the tables, these under the schema  senado_transacional.
	
	PostgreSQL was the database manager chosen for the project.
	
	The loading of the CSV files was performed by the import tool of pgAdmin.
	
	

3 - Design, construction, and load of the multidimensional model

	Like the previous step, SQL Power Architect was used to construct the model and generate the table creation script, which was under the schema  senado_dw.
	
	Pentaho Data Integration was used to transform and load the data in the schema    dw tables.



4 - Construction of panels

	Power BI was used to create the following panels:
	
	- Overview

	- View by regions and states of senators

	- Vision by parties

	- Detailing of expenses

	- Remuneration of senators

	- View by expense group


---

Matrícula: 192.671.091

Pontifícia Universidade Católica do Rio de Janeiro

Curso de Pós Graduação *Business Intelligence Master*
