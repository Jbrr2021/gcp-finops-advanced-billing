-- =================================================================================
-- ENGENHARIA DE DADOS AVANÇADA / CONSULTAS ANINHADAS (SUBQUERIES)
-- CONCEITO: Subquery Escalar no WHERE para Filtragem Dinâmica de Métricas
--
-- CONTEXTO DE NEGÓCIO (Pedido do Gestor):
-- "Para focar nossos esforços de otimização apenas nos recursos de maior impacto, 
-- crie uma consulta que identifique quais serviços estão operando com custos INDIVIDUAIS 
-- ACIMA DA MÉDIA GLOBAL de toda a empresa. Não utilize valores estáticos no WHERE; 
-- a linha de corte deve ser calculada dinamicamente por uma subquery, exibindo o ID 
-- do projeto, a descrição do serviço e o custo bruto de forma ordenada."
-- =================================================================================

SELECT 
 project.id AS projeto_id,
 service.description AS servico_descricao,
 cost AS custo_bruto
FROM
  `meu_finops.custos_nuvem_bruto_gcp`
WHERE 
  cost > (SELECT AVG(cost) FROM `meu_finops.custos_nuvem_bruto_gcp`)
ORDER BY
  custo_bruto DESC;
