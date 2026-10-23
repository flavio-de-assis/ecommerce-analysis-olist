-- Projeto: Análise de E-commerce Olist
-- Pergunta: quais formas de pagamento são mais usadas?
-- Tabelas: pedidos + pagamentos (order_id)
-- Regras: pedidos entregues, período jan/2017 a ago/2018

SELECT
  CASE pg.payment_type
    WHEN 'credit_card' THEN 'Cartão de crédito'
    WHEN 'boleto'      THEN 'Boleto'
    WHEN 'voucher'     THEN 'Voucher'
    WHEN 'debit_card'  THEN 'Cartão de débito'
    ELSE 'Não definido'
  END AS forma_pagamento,
  COUNT(*) AS qtde_pagamentos,
  ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS percentual
FROM `estudos-sql-512214.olist.pedidos` AS p
JOIN `estudos-sql-512214.olist.pagamentos` AS pg
  ON pg.order_id = p.order_id
WHERE p.order_status = 'delivered'
  AND DATE(p.order_purchase_timestamp) BETWEEN '2017-01-01' AND '2018-08-31'
GROUP BY forma_pagamento
ORDER BY qtde_pagamentos DESC