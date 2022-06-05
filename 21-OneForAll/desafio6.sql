SELECT 
    MIN(plano.valor_plano) AS 'faturamento_minimo', 
    MAX(plano.valor_plano) AS 'faturamento_maximo',
    ROUND(AVG(plano.valor_plano),2) AS 'faturamento_medio',
    ROUND(SUM(plano.valor_plano),2) AS 'faturamento_total'
FROM SpotifyClone.usuario 
JOIN SpotifyClone.plano ON usuario.id_plano = plano.id_plano;