-- =================================================================================
-- ENGENHARIA DE DADOS AVANÇADA / ACESSO A DADOS ANINHADOS (STRUCT)
-- CONCEITO: Notação de Ponto (.) para Extração de Objetos em Tabelas Complexas
--
-- CONTEXTO DE NEGÓCIO (Pedido do Gestor):
-- "O time de contabilidade precisa auditar os custos mas não possui ferramentas para ler 
-- objetos complexos (STRUCT). Crie uma consulta analítica extraindo o ID do projeto, 
-- a descrição legível do serviço, a descrição exata do SKU e a zona geográfica de cada 
-- recurso, exibindo o custo original de forma flat (tabela tradicional) e ordenada."
-- =================================================================================

SELECT 
  project.id AS projeto_id,
  service.description AS servico_descricao,
  sku.description AS sku_descricao,
  location.zone AS zona_geografica,
  cost AS custo_bruto
FROM 
  `meu_finops.custos_nuvem_bruto_gcp`
ORDER BY 
  custo_bruto DESC;
