-- Databricks notebook source
-- Selecione todos os clientes paulistanos

SELECT *
FROM silver_olist.cliente
WHERE descCidade = 'sao paulo'


-- COMMAND ----------

-- Selecione todos os clientes paulistas

SELECT *
FROM silver_olist.cliente
WHERE descUF = 'SP'

-- COMMAND ----------

-- Selecione todos os vendedores cariocas e paulistas

SELECT *
FROM silver_olist.vendedor
WHERE descCidade = 'rio de janeiro'
OR descUF = 'SP'

-- COMMAND ----------

-- Selecione todos os produtos de perfumaria e bebes com altura maior que 5cm

SELECT *
FROM silver_olist.produto

WHERE descCategoria in ('perfumaria','bebes') 
AND vlAlturaCm > 5

-- COMMAND ----------

-- DBTITLE 1,Foco (+exercícios)
-- Lista de pedidos com mais de um item

SELECT *
FROM silver_olist.pedido
