-- Projeto: Análise de E-commerce Olist
-- View: dimensão de clientes (uma linha por cliente do pedido)

CREATE OR REPLACE VIEW `estudos-sql-512214.olist.vw_dim_clientes` AS
SELECT
  customer_id AS id_cliente,
  INITCAP(customer_city) AS cidade,
  customer_state AS estado
FROM `estudos-sql-512214.olist.clientes`