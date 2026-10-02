INSERT INTO administrador (id, email, senha) VALUES ('admin-uuid-1', 'admin@nonna.com', 'admin123');

INSERT INTO configuracoes (id, horario_funcionamento) VALUES ('config-uuid-1', '18:00 - 23:30');

INSERT INTO cliente (id, cpf, nome, sobrenome, email, senha) VALUES 
('cliente-uuid-1', '11111111111', 'João', 'Silva', 'joao@email.com', 'senha123'),
('cliente-uuid-2', '22222222222', 'Maria', 'Souza', 'maria@email.com', 'senha123');

INSERT INTO cliente_endereco (id, id_cliente, rua, cidade, estado, bairro, cep, numero, tipo) VALUES 
('end-uuid-1', 'cliente-uuid-1', 'Rua A', 'São Paulo', 'SP', 'Centro', '01001-000', '100', 'Residencial');

INSERT INTO cliente_telefone (id, id_cliente, telefone) VALUES 
('tel-uuid-1', 'cliente-uuid-1', '11999999999');

INSERT INTO categoria (id, nome) VALUES 
('cat-uuid-1', 'Massas'),
('cat-uuid-2', 'Vinhos');

INSERT INTO produto (id, nome, descricao, preco, id_categoria, imagem) VALUES 
('prod-uuid-1', 'Spaghetti Carbonara', 'Massa com ovos, queijo, pancetta e pimenta preta.', 45.90, 'cat-uuid-1', 'url1'),
('prod-uuid-2', 'Lasanha à Bolonhesa', 'Massa em camadas com carne moída, molho de tomate e queijo.', 55.90, 'cat-uuid-1', 'url2');
