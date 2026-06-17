-- =================================================================================
-- ENGENHARIA DE DADOS AVANÇADA / INGESTÃO DE BILLING DATA (SCHEMA REAL GCP)
-- CONCEITO: Modelagem DDL/DML de Tabelas Aninhadas (STRUCT e ARRAY)
--
-- CONTEXTO DE NEGÓCIO (Pedido do Gestor de Infraestrutura):
-- "Para aproximar nossos laboratórios de FinOps da realidade de grandes contratos, 
-- precisamos parar de usar tabelas simplificadas. Ingeste os logs de faturamento brutos 
-- utilizando a arquitetura oficial de exportação do Google Cloud Billing (Standard Usage). 
-- A tabela deve conter campos aninhados complexos para suportar auditorias de SKUs, 
-- data/hora em formato TIMESTAMP UTC, mapeamento de localizações globais e arrays de créditos."
-- =================================================================================

CREATE OR REPLACE TABLE `meu_finops.custos_nuvem_bruto_gcp` AS 
SELECT 
  '01A2B3-C4D5E6-F7G8H9' AS billing_account_id,
  TIMESTAMP('2026-06-15 14:30:00 UTC') AS usage_start_time,
  TIMESTAMP('2026-06-15 15:30:00 UTC') AS usage_end_time,
  STRUCT(
    'ipnet-vendas-prod' AS id, 
    'App Vendas Produção' AS name, 
    '1029384756' AS number,
    [STRUCT('ambiente' AS key, 'producao' AS value), STRUCT('equipe' AS key, 'engenharia' AS value)] AS labels
  ) AS project,
  STRUCT('6F08-BB0B-24B3' AS id, 'Compute Engine' AS description) AS service,
  STRUCT('A214-8789-973C' AS id, 'Licença Core OS rodando em São Paulo' AS description) AS sku,
  STRUCT('southamerica-east1' AS location, 'São Paulo' AS zone) AS location,
  450.00 AS cost,
  'BRL' AS currency,
  0.035 AS currency_conversion_rate,
  [STRUCT('Sustained Usage Discount' AS name, -45.00 AS amount, '10293' AS id)] AS credits
UNION ALL
SELECT 
  '01A2B3-C4D5E6-F7G8H9' AS billing_account_id, TIMESTAMP('2026-06-16 02:00:00 UTC') AS usage_start_time, TIMESTAMP('2026-06-16 03:00:00 UTC') AS usage_end_time,
  STRUCT('ipnet-data-lake' AS id, 'Data Lake Central' AS name, '5544332211' AS number, [STRUCT('ambiente' AS key, 'producao' AS value), STRUCT('equipe' AS key, 'bi' AS value)] AS labels),
  STRUCT('A312-C837-1029' AS id, 'BigQuery' AS description) AS service,
  STRUCT('B912-8821-4402' AS id, 'Analysis Query Usage (Slots)' AS description) AS sku,
  STRUCT('us-central1' AS location, 'Iowa' AS zone) AS location,
  320.50 AS cost, 'BRL' AS currency, 0.035 AS currency_conversion_rate,
  [] AS credits
UNION ALL
SELECT 
  '01A2B3-C4D5E6-F7G8H9' AS billing_account_id, TIMESTAMP('2026-06-16 18:15:00 UTC') AS usage_start_time, TIMESTAMP('2026-06-16 19:15:00 UTC') AS usage_end_time,
  STRUCT('ipnet-vendas-prod' AS id, 'App Vendas Produção' AS name, '1029384756' AS number, [STRUCT('ambiente' AS key, 'producao' AS value), STRUCT('equipe' AS key, 'engenharia' AS value)] AS labels),
  STRUCT('2E11-992A-4410' AS id, 'Cloud Storage' AS description) AS service,
  STRUCT('C102-3392-8821' AS id, 'Standard Storage Nearline Americas' AS description) AS sku,
  STRUCT('us-east1' AS location, 'N. Virginia' AS zone) AS location,
  25.00 AS cost, 'BRL' AS currency, 0.035 AS currency_conversion_rate,
  [] AS credits;
