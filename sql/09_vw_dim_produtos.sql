-- Projeto: Análise de E-commerce Olist
-- View: dimensão de produtos (categoria tratada)

CREATE OR REPLACE VIEW `estudos-sql-512214.olist.vw_dim_produtos` AS
SELECT
  product_id AS id_produto,
  COALESCE(INITCAP(REPLACE(product_category_name, '_', ' ')), 'Sem categoria') AS categoria
FROM `estudos-sql-512214.olist.produtos`