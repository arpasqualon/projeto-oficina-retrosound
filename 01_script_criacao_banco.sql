/* SCRIPT DE CRIAÇÃO (DDL) - PROJETO RETROSOUND */

CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    logradouro VARCHAR(200),
    numero VARCHAR(20),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    cep VARCHAR(10)
);

CREATE TABLE TECNICO (
    id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
    nome_tecnico VARCHAR(255) NOT NULL,
    matricula VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE FORNECEDOR (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_fornecedor VARCHAR(255) NOT NULL,
    contato_telefone VARCHAR(20),
    email_fornecedor VARCHAR(100)
);

CREATE TABLE PECA (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    id_fornecedor INT,
    nome_peca VARCHAR(100) NOT NULL,
    quantidade_estoque INT NOT NULL DEFAULT 0,
    localizacao VARCHAR(50),
    FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDOR(id_fornecedor)
);

CREATE TABLE EQUIPAMENTO (
    id_equipamento INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    tipo VARCHAR(50),
    marca VARCHAR(100),
    modelo VARCHAR(100),
    ano_fabricacao INT,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE ORDEM_DE_SERVICO (
    id_ordem_servico INT AUTO_INCREMENT PRIMARY KEY,
    id_equipamento INT NOT NULL,
    id_tecnico INT,
    data_entrada DATE NOT NULL,
    defeito_relatado TEXT,
    estado_entrada VARCHAR(255),
    status_servico VARCHAR(50) DEFAULT 'Aguardando Orçamento',
    FOREIGN KEY (id_equipamento) REFERENCES EQUIPAMENTO(id_equipamento),
    FOREIGN KEY (id_tecnico) REFERENCES TECNICO(id_tecnico)
);

CREATE TABLE ITENS_DA_ORDEM (
    id_ordem_servico INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade_usada INT NOT NULL,
    PRIMARY KEY (id_ordem_servico, id_peca),
    FOREIGN KEY (id_ordem_servico) REFERENCES ORDEM_DE_SERVICO(id_ordem_servico),
    FOREIGN KEY (id_peca) REFERENCES PECA(id_peca)
);
