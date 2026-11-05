-- Projeto: Análise de E-commerce Olist
-- Pergunta: quais estados geram mais faturamento?
-- Tabelas: pedidos + clientes (customer_id) + itens_pedido (order_id)
-- Regras: pedidos entregues, período jan/2017 a ago/2018
-- Faturamento: soma do preço dos itens, sem o frete

SELECT
  c.customer_state AS estado,
  ROUND(SUM(ip.price), 2) AS total_faturado
FROM `estudos-sql-512214.olist.pedidos` AS p
JOIN `estudos-sql-512214.olist.clientes` AS c
  ON c.customer_id = p.customer_id
JOIN `estudos-sql-512214.olist.itens_pedido` AS ip
  ON ip.order_id = p.order_id
WHERE p.order_status = 'delivered'
  AND p.order_delivered_customer_date IS NOT NULL
  AND DATE(p.order_purchase_timestamp) BETWEEN '2017-01-01' AND '2018-08-31'
GROUP BY estado
ORDER BY total_faturado DESC
