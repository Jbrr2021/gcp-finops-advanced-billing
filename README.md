# 🚀 GCP FinOps Advanced Billing - Engenharia de Dados Avançada

<img width="1920" height="930" alt="image" src="https://github.com/user-attachments/assets/dbbc8ab0-cb6f-4e15-85fc-8f1f0f1961d9" />


Bem-vindo ao meu repositório de nível intermediário/avançado! Após consolidar a minha base essencial de sintaxe SQL, decidi elevar o nível dos meus laboratórios para replicar exatamente os desafios de produção que os engenheiros enfrentam no dia a dia.

Nesta biblioteca pessoal, abandonei as tabelas didáticas e passei a trabalhar diretamente com o **Schema oficial e bruto de exportação do Google Cloud Billing (Standard Usage Cost)**.

## 📊 A Realidade dos Dados Brutos
Os provedores de nuvem geram dados massivos em formatos aninhados e repetidos. Para simular esse cenário, estruturei o dataset `custos_nuvem_bruto_gcp` utilizando tipos de dados complexos do Google BigQuery:
*   **`STRUCT` (Objetos):** Agrupamentos de propriedades como `project`, `service`, `sku` e `location`.
*   **`ARRAY` (Listas repetidas):** Coleções de registros dentro de uma mesma linha para mapear `credits` (descontos) e `labels`.
*   **`TIMESTAMP`:** Registro preciso de fuso horário UTC para auditoria cronológica.

## 📁 Catálogo de Soluções Avançadas

### ⚙️ 1. Infraestrutura Analítica Real
*   `setup_carga_bruta_gcp_billing_schema.sql`: Ingestão de dados analíticos complexos reproduzindo a árvore oficial de faturamento estruturada em objetos e matrizes do GCP.

### 🕵️‍♂️ 2. Extração e Navegação em Objetos Aninhados
*   `extracao_campos_aninhados_struct_gcp_billing.sql`: **Pedido do Gestor:** Conversão de dados aninhados em formato flat (tabela tradicional) para auditoria contábil, utilizando a notação de ponto (`.`) para isolar IDs de projetos, descrições de serviços, SKUs e zonas geográficas de forma otimizada.

### 💰 3. Engenharia de Desaninhamento e Auditoria de Créditos
*   `desaninhamento_creditos_arrays_gcp_billing_unnest.sql`: **Pedido do Gestor:** Extração da economia real gerada por planos de desconto acordados com o cliente. Implementação avançada da cláusula `UNNEST` combinada com `CROSS JOIN` implícito para descompactar arrays vazios e identificar de forma cirúrgica créditos de uso contínuo (*Sustained Usage Discounts*).

## 🧠 Evolução Profissional
Dominar o desaninhamento de estruturas complexas no BigQuery consolida a minha autonomia para lidar com grandes volumetrias de dados (Big Data) e pipelines reais de governança de dados na nuvem.

