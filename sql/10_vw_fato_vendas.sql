CREATE OR REPLACE VIEW `estudos-sql-512214.olist.vw_fato_vendas` AS


WITH avaliacao_pedido AS (
  -- Um pedido pode ter mais de uma avaliação: fica uma linha por pedido
  SELECT
    order_id,
    AVG(review_score) AS nota_avaliacao
  FROM `estudos-sql-512214.olist.avaliacoes`
  GROUP BY order_id
)

SELECT
  ip.order_id AS id_pedido,
  ip.order_item_id AS num_item,
  ip.product_id AS id_produto,
  ip.seller_id AS id_vendedor,
  p.customer_id AS id_cliente,
  DATE(p.order_purchase_timestamp) AS data_compra,
  ip.price AS preco,
  ip.freight_value AS frete,
  DATE_DIFF(DATE(p.order_delivered_customer_date), DATE(p.order_purchase_timestamp), DAY) AS dias_entrega,
  DATE_DIFF(DATE(p.order_delivered_customer_date), DATE(p.order_estimated_delivery_date), DAY) AS dias_atraso,
  CASE
    WHEN DATE(p.order_delivered_customer_date) <= DATE(p.order_estimated_delivery_date)
      THEN 'No prazo'
    ELSE 'Atrasado'
  END AS situacao_entrega,
  av.nota_avaliacao
FROM `estudos-sql-512214.olist.itens_pedido` AS ip
JOIN `estudos-sql-512214.olist.pedidos` AS p
  ON p.order_id = ip.order_id
LEFT JOIN avaliacao_pedido AS av
  ON av.order_id = ip.order_id
WHERE p.order_status = 'delivered'
  AND p.order_delivered_customer_date IS NOT NULL
  AND DATE(p.order_purchase_timestamp) BETWEEN '2017-01-01' AND '2018-08-31'