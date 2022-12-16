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

SELECT DISTINCT idPedido
FROM silver_olist.item_pedido
WHERE idPedidoItem > 1


-- COMMAND ----------

-- Lista de pedidos que o frete é mais caro que o item

SELECT *
  FROM silver_olist.item_pedido
  WHERE vlFrete > vlPreco


-- COMMAND ----------

-- Lista de pedidos que ainda não foram enviados

SELECT *
  FROM silver_olist.pedido
  WHERE dtEnvio IS null
  


-- COMMAND ----------

-- Lista de pedidos que foram entregues com atraso

SELECT *
FROM silver_olist.pedido
WHERE dtEntregue > dtEstimativaEntrega

-- COMMAND ----------

-- Lista de pedidos que foram entregues com 2 dias de antecedência

SELECT *
FROM silver_olist.pedido
WHERE (datediff (dtEntregue, dtEstimativaEntrega) < 2) 

-- COMMAND ----------

-- Lista de pedidos feitos em dezembro de 2017 e entregues com atraso

SELECT *
FROM silver_olist.pedido
WHERE (month (dtPedido)=12) AND (year(dtPedido)=2017) AND date (dtEstimativaEntrega) < date (dtEntregue) 


-- COMMAND ----------

-- Lista de pedidos com avaliação menor ou igual a 4

SELECT *
FROM silver_olist.avaliacao_pedido
WHERE vlNota <= '4'



-- COMMAND ----------

-- Lista de pedidos com 2 ou mais parcelas menores que R$20

SELECT *,
vlPagamento / nrPacelas AS vlParcela
FROM silver_olist.pagamento_pedido
WHERE nrPacelas >= 2
AND vlPagamento / nrPacelas  < 20



-- COMMAND ----------

-- todos os pedidos, marque se houve atraso ou não
SELECT *
FROM silver_olist.pedido
WHERE dtEntregue > dtEstimativaEntrega 


-- COMMAND ----------

    -- case 02 - selecione os itens de pedidos e defina os grupos em uma nova coluna
    -- para frete inferior a 10%: "10%"
    -- para frete entre 10 e 25% :
    -- 25% e 50%
    -- maior que 50%


    -- ctrl + barra comenta todas as linhas selecionadas
    
    
SELECT *,
  vlPreco + vlFrete AS vlTotal,
  vlFrete / (vlPreco + vlFrete) AS pctFrete,
  
CASE 
  WHEN vlFrete / (vlPreco + vlFrete) <=0.1 THEN '10%'
  WHEN vlFrete / (vlPreco + vlFrete) <=0.25 THEN '10% a 25%'
  WHEN vlFrete / (vlPreco + vlFrete) <=0.5 THEN '25% a 50%'
  ELSE '+50%'
END AS descFretePct
   
FROM silver_olist.item_pedido
