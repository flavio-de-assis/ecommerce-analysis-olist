-- Projeto: Análise de E-commerce Olist
-- Objetivo: conferir se todas as tabelas foram carregadas por completo
-- Valores esperados: pedidos 99.441 | itens_pedido 112.650 | clientes 99.441
-- produtos 32.951 | vendedores 3.095 | pagamentos 103.886 | avaliacoes 99.224
-- geolocalizacao 1.000.163 | traducao_categorias 71

SELECT 'pedidos' AS tabela, COUNT(*) AS linhas FROM `estudos-sql-512214.olist.pedidos`
UNION ALL SELECT 'itens_pedido', COUNT(*) FROM `estudos-sql-512214.olist.itens_pedido`
UNION ALL SELECT 'clientes', COUNT(*) FROM `estudos-sql-512214.olist.clientes`
UNION ALL SELECT 'produtos', COUNT(*) FROM `estudos-sql-512214.olist.produtos`
UNION ALL SELECT 'vendedores', COUNT(*) FROM `estudos-sql-512214.olist.vendedores`
UNION ALL SELECT 'pagamentos', COUNT(*) FROM `estudos-sql-512214.olist.pagamentos`
UNION ALL SELECT 'avaliacoes', COUNT(*) FROM `estudos-sql-512214.olist.avaliacoes`
UNION ALL SELECT 'geolocalizacao', COUNT(*) FROM `estudos-sql-512214.olist.geolocalizacao`
UNION ALL SELECT 'traducao_categorias', COUNT(*) FROM `estudos-sql-512214.olist.traducao_categorias`