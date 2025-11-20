/* SCRIPT DE INSERÇÃO (INSERT) - PROJETO RETROSOUND */

INSERT INTO CLIENTE (nome_completo, telefone, email, logradouro, numero, bairro, cidade, cep)
VALUES 
('João da Silva', '(11) 98877-6655', 'joao.silva@email.com', 'Rua das Válvulas', '123', 'Centro', 'São Paulo', '01000-001'),
('Maria Oliveira', '(41) 99988-7766', 'maria.o@email.com', 'Avenida dos Transistores', '456', 'Água Verde', 'Curitiba', '80000-002'),
('Carlos Pereira', '(21) 97766-5544', 'carlos.p@email.com', 'Praça do Rádio', '789', 'Copacabana', 'Rio de Janeiro', '21000-003');

INSERT INTO TECNICO (nome_tecnico, matricula)
VALUES
('Ricardo Alves', 'T-001'),
('Ana Julia Mendes', 'T-002');

INSERT INTO FORNECEDOR (nome_fornecedor, contato_telefone, email_fornecedor)
VALUES
('Componentes Vintage S.A.', '(11) 5544-3322', 'vendas@vintage.com'),
('Peças Raras Eletrônicos', '(51) 3322-1100', 'contato@pecasraras.com'),
('Fornecedor Teste (para DELETE)', '(99) 99999-9999', 'delete@teste.com');

INSERT INTO PECA (id_fornecedor, nome_peca, quantidade_estoque, localizacao)
VALUES
(1, 'Válvula 12AX7', 15, 'Prat-A-01'),
(1, 'Capacitor 100uF', 50, 'Caixa-C-05'),
(2, 'Botão Clássico (Marfim)', 30, 'Prat-B-02'),
(1, 'Válvula 6L6', 8, 'Prat-A-02');

INSERT INTO EQUIPAMENTO (id_cliente, tipo, marca, modelo, ano_fabricacao)
VALUES
(1, 'Radiola', 'Philco', 'B-52', 1965),
(2, 'Rádio', 'Zenith', 'Transoceanic', 1958),
(1, 'Vitrola', 'Garrard', 'SP25', 1972);

INSERT INTO ORDEM_DE_SERVICO (id_equipamento, id_tecnico, data_entrada, defeito_relatado, estado_entrada, status_servico)
VALUES
(1, 1, '2025-10-20', 'Não liga, sem som.', 'Caixa de madeira arranhada.', 'Em Reparo'),
(2, 2, '2025-10-22', 'Chiado alto, não sintoniza estações.', 'Completo, bom estado.', 'Aguardando Peças'),
(3, 1, '2025-10-25', 'Toca-discos não gira.', 'Faltando agulha.', 'Aguardando Orçamento');

INSERT INTO ITENS_DA_ORDEM (id_ordem_servico, id_peca, quantidade_usada)
VALUES
(1, 1, 1), 
(1, 2, 2);
