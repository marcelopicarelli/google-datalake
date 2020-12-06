# Plataforma de Dados – Google Cloud Plataform

## Objetivo
O objetivo deste projeto é apresentar uma plataforma de ingestão de dados, de bancos relacionais e dados oriundo de API´s (streaming).

## Requisitos
Utilização do Google Cloud Plataform como provedora de serviços de cloud pública. Neste escopo todos os componentes utilizados são fornecidos pela própria provedora como Serviço Gerenciado (SaaS)

## Tecnologias Escolhidas
* **Cloud Pub/Sub** – O Pub/Sub é a solução gerenciada da Google para mensageria em relação ao Kafka que possui ordenação de mensagens o Pub/Sub tem a vantagem de permitir push de mensagens fazendo com que os dados possam ser distribuídos globalmente.

* **Cloud Dataflow** – O Dataflow é um serviço gerenciado da Google para execução de pipelines de dados. Baseado no Apache Beam possui o desenvolvimento rápido (Python) de pipelines de dados e com abordagem sem servidor. Outra vantagem é a cobrança por tempo de uso.

* **Cloud Storage** – É o serviço da Google para armazenamento ilimitado de objetos, com baixa latência e alta durabilidade e disponibilidade.

* **Cloud Bigtable** – É o serviço gerenciado do Google para banco de dados NO-SQL baseado no Apache HBase que oferece baixa latência, escalonamento e conexões simplificadas com Google Cloud e o ecossistema Apache.

* **BigQuery** – É o serviço gerenciado do Google para Data Warehouse, altamente escalonável, que utiliza ANSI-SQL além de outros componente que agilizam a exploração dos dados pelos Analistas e Cientistas de Dados.

* **Cloud Datalab** – Provê notebooks do Jupyter para explorar e visualizar dados de maneira simples utilizando Python e SQL. É possível gerenciar o notebook através de roles específicas por usuário (IAM) garantindo a granularidade do acesso ao dado.

* **Cloud Dataproc** – O Dataproc é o serviço gerenciado do Google para clusters Hadoop e Spark, como auto-escalonamento, criptografia e segurança embutidas.

* **Cloud Composer** – É o serviço de orquestração de fluxos gerenciado do Google, criado no Apache Airflow. É operado em Python livre de fornecedores, com possibilidades de integrações multi-cloud e nuvem hibrida.

* **Debezium** - Debezium é uma plataforma distribuída de código aberto para a captura de dados alterados (stream) que fornece inúmeros conectores para diversas bases de dados.

## Arquitetura dos Componentes
 
![alt text](https://github.com/marcelopicarelli/google-datalake/blob/main/centauro.png)

## Ingestão de dados Streaming
Para ingestão dos dados via API e dados relacionais de banco via stream as tecnologias escolhidas foram Confluent Kafka e Debezium para change data capture dos bancos de dados relacionais.
Os dados tanto da API, quanto do Debezium serão postados um tópico Kafka que serão transportados para a camada do Datalake pelo Cloud Dataflow.

## Ingestão de dados Batch
Para ingestão dos dados batch dos bancos de dados um job Cloud Dataflow se encarregará dos dados relacionais transportando estes para o Datalake.
Exploração de dados

Para que os times de BI Analytics possam explorar os dados no datalake a tecnologia escolhida foi o Cloud Datalab, uma solução baseada em notebooks que utiliza linguagens como Python e SQL.
As instâncias do Cloud Datalab são únicas portanto cara membro da equipe deve possuir sua própria. As regras de acesso (IAM) são gerenciáveis e é possível delegar a criação de instância para um membro da equipe ou o próprio usuário instanciar a sua.
Com a criação de um Datalab é criado um Cloud Source Repositoty no projeto, e cada instância clonará o repositório em datalab-notebooks podendo o compartilhamento ser gerenciado por meio da console do Google Cloud.

## Machine Learning

Para o Machine Learning e Deep Learning a tecnologia escolhida foi o AI Plataform que é uma solução completa para ciência de dados e conta com ferramentas como o AutoML, TensorFlow, Notebooks e AI Training.

## Engenharia de dados

Para a Engenharia de dados um cluster dataproc coordenará os movimentos dos dados nas camadas do datalake.

## Datalake

O Data Lake foi dividido em algumas camadas e áreas para uma melhor organização e funcionamento dos processos.
* **Transient/Landing Zone** – Zona transiente que armazena dados de outros sistemas por um pequeno espaço de tempo, sendo o ponto único de entrada do Data Lake. Toda informação a ser processada e enviada para as outras camadas deve obrigatoriamente passa por essa camada;
*	**Raw Zone** – Zona de persistência dos dados na sua forma original;
*	**Trusted Zone** – Zona de persistência de dados para fins corporativos, com os processos de qualidade executados;
*	**Refined Zone** – Zona de persistência responsável por armazenar os dados manipulados, enriquecidos e transformados.

## Transient Zone

Zona transiente que armazena dados de outros sistemas por um curto espaço de tempo, sendo o ponto único de entrada do Data Lake. Toda informação a ser processada e enviada para as outras camadas deve obrigatoriamente passa por essa camada. 
Os principais objetivos dessa camada é centralizar a entrada de dados mantendo seu formato original, seguir as regras de segurança isolando as outras camadas, possibilitar o processamento das informações e possibilitar o processamento dos dados sem antes ter que passar por um fluxo de ETL.

**Características**:
* Não guarda histórico
*	Não possui os dados replicados em outras regiões
*	Recepção de dados de outros sistemas

## Raw Zone

A camada raw é uma zona comum de persistência de todo o dado na sua forma original em que foi recebido/capturado dos sistemas produtores de informações, realizando algumas verificações de qualidade sem alterar o conteúdo das informações, controles e informando a camada de monitoramento de possíveis variações nos dados.
Essa camada é a única porta de entrada para o Data Lake, servindo de insumo para a camada Trusted e é estruturada para realizar grandes processamentos em paralelo para preparar a informação, sem considerar o consumo das informações por usuários ou processos de negócio.

### Divisões
*	Default - Área padrão para arquivos estruturados e semiestruturados
*	Não estruturada - Área destinada para arquivos não estruturados separados por coleções de objetos

### Formato de armazenamento
*	Origem de arquivos (bucket ou file server): Manter o mesmo tipo de formato gerado pela origem
*	Origem de banco de dados: Deve-se persistir em formato delimitado
*	Origem de filas/tópicos: Deve-se persistir em formato JSON ou Avro

### Processos
*	Ingestão de dados batch
*	Versionamento de layout
*	Processos de qualidade de dados técnico
*	Preparação de dados para camada trusted
*	Compressão de dados
*	Camada de armazenamento de dados binários (não estruturados)

## Trusted Zone

A camada Trusted armazena os dados para fins corporativos, mantendo o último layout recebido e possui processos de qualidade e padronização de dados que aumentam a confiabilidade das informações, bem como persiste as informações no melhor formato visando o consumo. 

Essa camada só pode receber dados a partir da camada Raw e é estruturada para realizar grandes processamento paralelos para aplicação de regras de negócio e considera o consumo tipo das informações por usuários de negócio, cientistas de dados e processos sistêmicos.

### Divisões
*	Default - Área padrão para arquivos estruturados e semiestruturados
*	Não estruturada - Área destinada para arquivos não estruturados separados por coleções de objetos
*	Confidencial - Área destinada para arquivos com informações restritas e controle de acesso mais rigoroso

### Tipo de Consumidores
*	Sistêmico
*	Usuários de negócio
*	Cientistas de dados

### Formato de Armazenamento
*	Parquet

### Processos
*	Aplicação de regras de qualidade técnicas
*	Padronização de domínios
*	Padronização de tipo de dados
*	Processo de schema evolution
*	Processo de conversão de formato
*	Preparação de dados para camada Refined

### Uso Indicado
*	Uso sistêmico para preparação de dados e fluxos de negócio
*	Extração de informações para camada Refined ou camadas de gestão (avaliar solução ponta a ponta)
*	Exploração de dados, análise de dados e ML

## Refined Zone

A camada Refined é a área responsável por armazenar os dados manipulados, enriquecidos, criados e transformados com orientação a casos de usos e otimizada para consumo. Possui processos de qualidade focando numa visão de negócio, assim padronizando, monitorando e garantindo a execução das regras de negócio.
Essa camada só pode receber dados a partir da camada trusted e é totalmente estruturada para o consumo das informações por usuários de negócio, cientistas de dados e/ou processos sistêmicos.

### Tipo de Consumidores
*	Sistêmico
*	Usuários de negócio
*	Cientistas de dados

### Formato de Armazenamento
*	Parquet
*	Banco de dados

### Processos
*	Aplicação de regras de qualidade de negócio
*	Preparação de dados para consumo de negócio

### Usos Indicados
*	Uso sistêmico para preparação de dados e fluxos de negócio
*	Exploração de dados, análise de dados e ML
