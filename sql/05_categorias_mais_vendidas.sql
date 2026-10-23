-- Projeto: Análise de E-commerce Olist
-- Pergunta: quais categorias mais vendem?
-- Tabelas: pedidos + itens_pedido (order_id) + produtos (product_id)
-- Regras: pedidos entregues, período jan/2017 a ago/2018

SELECT
  pd.product_category_name AS categoria,
  COUNT(*) AS qtde_itens,
  ROUND(SUM(ip.price), 2) AS faturamento
FROM `estudos-sql-512214.olist.pedidos` AS p
JOIN `estudos-sql-512214.olist.itens_pedido` AS ip
  ON ip.order_id = p.order_id
JOIN `estudos-sql-512214.olist.produtos` AS pd
  ON pd.product_id = ip.product_id
WHERE p.order_status = 'delivered'
  AND DATE(p.order_purchase_timestamp) BETWEEN '2017-01-01' AND '2018-08-31'
GROUP BY categoria
ORDER BY faturamento DESC
LIMIT 10