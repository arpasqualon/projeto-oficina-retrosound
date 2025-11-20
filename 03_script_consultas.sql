/* SCRIPT DE CONSULTAS (SELECT) - PROJETO RETROSOUND */

-- Consulta 1: Listar todas as peças com baixo estoque (menos de 10 unidades)
SELECT 
    nome_peca,
    quantidade_estoque,
    localizacao
FROM 
    PECA
WHERE 
    quantidade_estoque < 10
ORDER BY 
    quantidade_estoque ASC;


-- Consulta 2: Encontrar o dono de um equipamento específico (Ex: Equipamento ID 2)
SELECT 
    C.nome_completo,
    C.telefone,
    E.marca,
    E.modelo
FROM 
    CLIENTE C
JOIN 
    EQUIPAMENTO E ON C.id_cliente = E.id_cliente
WHERE 
    E.id_equipamento = 2;


-- Consulta 3: Consulta complexa de uma Ordem de Serviço (Ordem 1)
-- (Mostra Cliente, Equipamento, Técnico e Status da Ordem)
SELECT 
    OS.id_ordem_servico AS Ficha,
    OS.data_entrada,
    OS.status_servico,
    C.nome_completo AS Cliente,
    E.marca AS Equipamento,
    T.nome_tecnico AS Tecnico_Responsavel
FROM 
    ORDEM_DE_SERVICO OS
JOIN 
    EQUIPAMENTO E ON OS.id_equipamento = E.id_equipamento
JOIN 
    CLIENTE C ON E.id_cliente = C.id_cliente
JOIN 
    TECNICO T ON OS.id_tecnico = T.id_tecnico
WHERE 
    OS.id_ordem_servico = 1;


-- Consulta 4: Listar todas as peças usadas na Ordem de Serviço 1
SELECT 
    P.nome_peca,
    ITO.quantidade_usada
FROM 
    ITENS_DA_ORDEM ITO
JOIN 
    PECA P ON ITO.id_peca = P.id_peca
WHERE 
    ITO.id_ordem_servico = 1;


-- Consulta 5: Ver todas as Ordens de Serviço (com nome do cliente)
-- Ordenadas das mais recentes para as mais antigas
SELECT 
    OS.id_ordem_servico,
    OS.data_entrada,
    OS.status_servico,
    OS.defeito_relatado,
    C.nome_completo
FROM 
    ORDEM_DE_SERVICO OS
JOIN 
    EQUIPAMENTO E ON OS.id_equipamento = E.id_equipamento
JOIN 
    CLIENTE C ON E.id_cliente = C.id_cliente
ORDER BY 
    OS.data_entrada DESC;
