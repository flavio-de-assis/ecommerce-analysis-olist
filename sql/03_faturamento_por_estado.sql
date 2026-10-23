-- Projeto: Análise de E-commerce Olist
-- Pergunta: quais estados geram mais faturamento?
-- Tabelas: pedidos + clientes (customer_id) + pagamentos (order_id)
-- Regra de negócio: considera apenas pedidos entregues (order_status = 'delivered')

SELECT
  c.customer_state AS estado,
  ROUND(SUM(pg.payment_value), 2) AS total_faturado
FROM `estudos-sql-512214.olist.pedidos` AS p
JOIN `estudos-sql-512214.olist.clientes` AS c
  ON c.customer_id = p.customer_id
JOIN `estudos-sql-512214.olist.pagamentos` AS pg
  ON pg.order_id = p.order_id
WHERE p.order_status = 'delivered'
  AND DATE(p.order_purchase_timestamp) BETWEEN '2017-01-01' AND '2018-08-31'
GROUP BY estado
ORDER BY total_faturado DESC