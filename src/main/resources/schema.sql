CREATE TABLE administrador (
    id VARCHAR(36) PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE configuracoes (
    id VARCHAR(36) PRIMARY KEY,
    horario_funcionamento VARCHAR(255) NOT NULL
);

CREATE TABLE cliente (
    id VARCHAR(36) PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE cliente_endereco (
    id VARCHAR(36) PRIMARY KEY,
    id_cliente VARCHAR(36) NOT NULL,
    rua VARCHAR(255) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON DELETE CASCADE
);

CREATE TABLE cliente_telefone (
    id VARCHAR(36) PRIMARY KEY,
    id_cliente VARCHAR(36) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON DELETE CASCADE
);

CREATE TABLE categoria (
    id VARCHAR(36) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE produto (
    id VARCHAR(36) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    id_categoria VARCHAR(36) NOT NULL,
    imagem VARCHAR(255),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);

CREATE TABLE pedido (
    id VARCHAR(36) PRIMARY KEY,
    id_cliente VARCHAR(36) NOT NULL,
    preco_total DECIMAL(10,2) NOT NULL,
    tipo_entrega VARCHAR(50) NOT NULL,
    endereco TEXT,
    forma_pagamento VARCHAR(50) NOT NULL,
    horario_criacao DATETIME NOT NULL,
    horario_saida DATETIME,
    horario_finalizacao DATETIME,
    telefone VARCHAR(20),
    status VARCHAR(50) NOT NULL,
    motivo_cancelamento TEXT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE produto_pedido (
    id VARCHAR(36) PRIMARY KEY,
    id_pedido VARCHAR(36) NOT NULL,
    id_produto VARCHAR(36) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);

CREATE TABLE reserva (
    id VARCHAR(36) PRIMARY KEY,
    id_cliente VARCHAR(36) NOT NULL,
    horario DATETIME NOT NULL,
    quantidade_pessoas INT NOT NULL,
    tipo_evento VARCHAR(100),
    motivo_cancelamento TEXT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);
