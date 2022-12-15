-- Databricks notebook source
SELECT 
    COUNT(*) AS LinhasNaoNulas, -- linhas não nulas
    COUNT (idCliente) AS IDClientesNaoNulos, -- ID de clientes não nulos
    COUNT (DISTINCT idCliente) AS IDClientesDistintos,  -- ID de clientes distintos
    
    COUNT (idClienteUnico) AS IDClientesUnicosDistintos, 
    COUNT (DISTINCT idClienteUnico) AS IDClientesUnicosDistintos
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
  COUNT (*),
  COUNT (distinct idCliente) as qtClientes,
  COUNT (DISTINCT idClienteUnico) AS IDClientesUnicosDistintos

FROM silver_olist.cliente
  
WHERE descCidade IN ('presidente prudente','curitiba')  

-- COMMAND ----------

SELECT 
    ROUND (AVG (vlPreco),2) AS MediaPreco,
    MAX (vlPreco) AS PrecoMaisAlto,
    INT (PERCENTILE(vlPreco,0.5)) AS PrecoMediano,
    ROUND (PERCENTILE(vlPreco,0.5),0) AS PrecoMediano,
    
    AVG (vlFrete) AS MediaFrete,
    MAX (vlFrete) AS FreteMaisAlto,
    MIN (vlFrete) AS FreteMaisBaixo
FROM silver_olist.item_pedido
