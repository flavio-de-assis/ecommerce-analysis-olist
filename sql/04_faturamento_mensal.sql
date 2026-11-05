-- Projeto: Análise de E-commerce Olist
-- Pergunta: como o faturamento evoluiu mês a mês?
-- Tabelas: pedidos + itens_pedido (order_id)
-- Regras: pedidos entregues, período jan/2017 a ago/2018
-- Faturamento: soma do preço dos itens, sem o frete

SELECT
  DATE_TRUNC(DATE(p.order_purchase_timestamp), MONTH) AS mes,
  COUNT(DISTINCT p.order_id) AS total_pedidos,
  ROUND(SUM(ip.price), 2) AS faturamento
FROM `estudos-sql-512214.olist.pedidos` AS p
JOIN `estudos-sql-512214.olist.itens_pedido` AS ip
  ON ip.order_id = p.order_id
WHERE p.order_status = 'delivered'
  AND p.order_delivered_customer_date IS NOT NULL
  AND DATE(p.order_purchase_timestamp) BETWEEN '2017-01-01' AND '2018-08-31'
GROUP BY mes
ORDER BY mes
