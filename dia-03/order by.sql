-- Databricks notebook source
SELECT
descUF,
COUNT (DISTINCT idClienteUnico) AS qtClienteEstado

FROM silver_olist.cliente

GROUP BY descUF
ORDER BY descUF

-- COMMAND ----------

-- GROUP BY alternativa 1 

SELECT
descUF,
COUNT (DISTINCT idClienteUnico) AS qtClienteEstado

FROM silver_olist.cliente

GROUP BY descUF
ORDER BY 2
-- ordenar pela segunda coluna da consulta

-- COMMAND ----------

-- GROUP BY alternativa 2

SELECT
descUF,
COUNT (DISTINCT idClienteUnico) AS qtClienteEstado

FROM silver_olist.cliente

GROUP BY descUF
ORDER BY qtClienteEstado desc

LIMIT 1


-- COMMAND ----------

-- GROUP BY alternativa 3 (quando o SGBD não aceita a 2)

SELECT
descUF,
  COUNT (DISTINCT idClienteUnico) AS qtClienteEstado

FROM silver_olist.cliente

GROUP BY descUF
ORDER BY COUNT (DISTINCT idClienteUnico) 
