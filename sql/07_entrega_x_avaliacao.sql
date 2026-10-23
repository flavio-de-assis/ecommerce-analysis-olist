-- Projeto: Análise de E-commerce Olist
-- Pergunta: atraso na entrega derruba a nota de avaliação?
-- Tabelas: pedidos + avaliacoes (order_id)
-- Regras: pedidos entregues, período jan/2017 a ago/2018

SELECT
  CASE
    WHEN DATE(p.order_delivered_customer_date) <= DATE(p.order_estimated_delivery_date)
      THEN 'No prazo'
    ELSE 'Atrasado'
  END AS entrega,
  COUNT(*) AS qtde_pedidos,
  ROUND(AVG(a.review_score), 2) AS nota_media
FROM `estudos-sql-512214.olist.pedidos` AS p
JOIN `estudos-sql-512214.olist.avaliacoes` AS a
  ON a.order_id = p.order_id
WHERE p.order_status = 'delivered'
  AND p.order_delivered_customer_date IS NOT NULL
  AND DATE(p.order_purchase_timestamp) BETWEEN '2017-01-01' AND '2018-08-31'
GROUP BY entrega
ORDER BY nota_media DESC