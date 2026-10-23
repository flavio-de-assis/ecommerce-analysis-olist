-- Projeto: Análise de E-commerce Olist
-- Pergunta: quais são os 10 estados com mais pedidos?
-- Tabelas: pedidos + clientes (ligadas por customer_id)

SELECT
  c.customer_state AS estado,
  COUNT(p.order_id) AS total_pedidos
FROM `estudos-sql-512214.olist.pedidos` AS p
JOIN `estudos-sql-512214.olist.clientes` AS c
  ON p.customer_id = c.customer_id
WHERE p.order_status = 'delivered'
  AND DATE(p.order_purchase_timestamp) BETWEEN '2017-01-01' AND '2018-08-31'
GROUP BY estado
ORDER BY total_pedidos DESC
LIMIT 10