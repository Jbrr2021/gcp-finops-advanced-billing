-- =================================================================================
-- ENGENHARIA DE DADOS AVANÇADA / BUSCA PARCIAL DE TEXTOS EM OBJETOS
-- CONCEITO: Operador LIKE e Caractere Curinga (%) em Campos Aninhados
--
-- CONTEXTO DE NEGÓCIO (Pedido do Gestor):
-- "O time de compliance precisa mapear todas as nossas instâncias e recursos alocados 
-- em data centers localizados nos Estados Unidos. Crie uma consulta que traga o ID do 
-- projeto, descrição do serviço, SKU e a localização exata, filtrando apenas os 
-- registros onde o código da região comece com o padrão 'us-'."
-- =================================================================================

SELECT 
  project.id AS projeto_id,
  service.description AS servico_descricao,
  sku.description AS sku_descricao,
  location.location AS regiao_codigo
FROM 
  `meu_finops.custos_nuvem_bruto_gcp`
WHERE 
  location.location LIKE 'us-%'
ORDER BY 
  cost DESC;
