-- =================================================================================
-- ENGENHARIA DE DADOS AVANÇADA / MANIPULAÇÃO DE ESTRUTURAS REPETIDAS (ARRAYS)
-- CONCEITO: Uso de UNNEST para Desaninhamento de Listas em Faturamento Cloud
--
-- CONTEXTO DE NEGÓCIO (Pedido do Gestor):
-- "O nosso diretor de FinOps precisa apresentar um relatório consolidado com o valor real 
-- economizado através de descontos corporativos aplicados na nossa fatura do Google Cloud. 
-- Como os créditos vêm agrupados em listas dentro de cada registro (ARRAYS), crie uma query 
-- analítica utilizando UNNEST para expandir e desempacotar essa estrutura, exibindo o ID do 
-- projeto, a descrição do serviço, o nome do desconto e o valor exato economizado."
-- =================================================================================

SELECT 
  project.id,
  service.description,
  c.name AS nome_desconto,
  c.amount AS valor_desconto
FROM 
  `meu_finops.custos_nuvem_bruto_gcp`,
  UNNEST(credits) AS c;
