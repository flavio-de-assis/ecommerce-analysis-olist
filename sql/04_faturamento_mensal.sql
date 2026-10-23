-- Projeto: Análise de E-commerce Olist
-- Pergunta: como o faturamento evoluiu mês a mês?
-- Tabelas: pedidos + pagamentos (order_id)
-- Regra de negócio: apenas pedidos entregues
select 
  date_trunc(date(p.order_purchase_timestamp), MONTH) as mes,
  count(distinct p.order_id) as total_pedidos,
  round(sum(pg.payment_value),2) as faturamento 
from `estudos-sql-512214.olist.pedidos` p
join `estudos-sql-512214.olist.pagamentos` pg on p.order_id = pg.order_id
where p.order_status = 'delivered'  AND DATE(p.order_purchase_timestamp) BETWEEN '2017-01-01' AND '2018-08-31'
group by mes
order by mes