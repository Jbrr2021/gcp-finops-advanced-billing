-- =================================================================================
-- ENGENHARIA DE DADOS AVANÇADA / CÁLCULOS FINANCEIROS E MATRIZES (ARRAYS)
-- CONCEITO: LEFT JOIN UNNEST e COALESCE para Extração de Custo Líquido Real (Net Cost)
--
-- CONTEXTO DE NEGÓCIO (Pedido do Gestor):
-- "Para fins de fechamento contábil e auditoria de faturamento real (Net Cost), crie um 
-- relatório que cruze o custo bruto original (cost) com a matriz de descontos aplicados. 
-- Utilize LEFT JOIN UNNEST para garantir que recursos sem desconto não sejam omitidos 
-- do relatório e aplique COALESCE para neutralizar os valores nulos com zero, exibindo o 
-- ID do projeto, serviço, custo bruto e o custo líquido real final."
-- =================================================================================

SELECT 
  project.id AS projeto_id,
  service.description AS servico_descricao,
  cost AS custo_bruto,
  cost + COALESCE(c.amount, 0) AS custo_liquido_real
FROM 
  `meu_finops.custos_nuvem_bruto_gcp`
  LEFT JOIN UNNEST(credits) AS c
ORDER BY 
  custo_liquido_real DESC;
