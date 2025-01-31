/*
(c) Exemplos de inserções de dados em cada uma das tabelas (pelo menos 5 em cada
tabela). Para testar bem o trabalho, recomenda-se inserir dezenas de registros em
cada tabela
*/

INSERT INTO Cliente (cpf, cnh, fone, nome, estado, logradouro, cep, numero, complemento, cidade, bairro)
VALUES
('12345678901', '98765432100', '31987654321', 'Carlos Silva', 'MG', 'Rua A', '30123456', 100, 'Apto 202', 'Belo Horizonte', 'Centro'),
('23456789012', '87654321099', '31987651234', 'Ana Souza', 'SP', 'Avenida B', '01234567', 200, NULL, 'São Paulo', 'Jardins'),
('34567890123', '76543210988', '31981234567', 'João Pereira', 'RJ', 'Rua C', '22041001', 300, 'Casa 1', 'Rio de Janeiro', 'Copacabana'),
('45678901234', '65432109877', '31982345678', 'Mariana Oliveira', 'PR', 'Rua D', '80010100', 400, NULL, 'Curitiba', 'Batel'),
('56789012345', '54321098766', '31983456789', 'Fernando Lima', 'RS', 'Avenida E', '90020030', 500, 'Sala 10', 'Porto Alegre', 'Centro Histórico');

INSERT INTO Funcionario (cpf, nome)
VALUES
('11111111111', 'Roberto Almeida'),
('22222222222', 'Juliana Mendes'),
('33333333333', 'Ricardo Santos'),
('44444444444', 'Carla Nunes'),
('55555555555', 'André Costa');

INSERT INTO Funcionario_Horista (Funcionario_cpf, valor_hora)
VALUES
('11111111111', 20.50),
('22222222222', 22.00),
('33333333333', 18.75),
('44444444444', 21.30),
('55555555555', 19.80);
INSERT INTO Funcionario_Mensal (Funcionario_cpf, salario)
VALUES
('11111111111', 3500.00),
('22222222222', 4200.00),
('33333333333', 3900.00),
('44444444444', 4600.00),
('55555555555', 4100.00);

INSERT INTO Fornecedor (cnpj, nome, contato)
VALUES
('12345678000123', 'AutoPeças LTDA', '31991234567'),
('23456789000134', 'Veículos SA', '31992345678'),
('34567890000145', 'Carros e Motos Ltda', '31993456789'),
('45678901000156', 'Transporte Fácil', '31994567890'),
('56789012000167', 'Caminhões e Afins', '31995678901');

INSERT INTO Veiculo (placa, marca, modelo, ano, quilometragem_atual, disponibilidade, valor_diario, Fornecedor_cnpj)
VALUES
('ABC1D23', 'Fiat', 'Uno', 2020, 50000, true, 100.00, '12345678000123'),
('BCD2E34', 'Chevrolet', 'Onix', 2021, 30000, true, 120.00, '23456789000134'),
('CDE3F45', 'Honda', 'Civic', 2019, 70000, true, 150.00, '34567890000145'),
('DEF4G56', 'Yamaha', 'Fazer 250', 2022, 12000, true, 90.00, '45678901000156'),
('EFG5H67', 'Scania', 'R500', 2018, 200000, true, 250.00, '56789012000167');
INSERT INTO Carro (Veiculo_placa, numero_portas, tipo_combustivel)
VALUES
('ABC1D23', 4, 'Gasolina'),
('BCD2E34', 4, 'Flex'),
('CDE3F45', 4, 'Gasolina'),
('DEF4G56', 2, 'Elétrico'),
('EFG5H67', 4, 'Diesel');

INSERT INTO Moto (Veiculo_placa, cilindradas)
VALUES
('DEF4G56', 250),
('ABC1D23', 150),
('BCD2E34', 300),
('CDE3F45', 500),
('EFG5H67', 750);

INSERT INTO Caminhao (Veiculo_placa, eixos)
VALUES
('EFG5H67', 6),
('ABC1D23', 4),
('BCD2E34', 8),
('CDE3F45', 10),
('DEF4G56', 12);
INSERT INTO Locacao (data_aluguel, data_termino, quilometragem_inicial, idCliente, Veiculo_placa, funcionario_cpf)
VALUES
('2025-01-01', '2025-01-05', 50000, 1, 'ABC1D23', '11111111111'),
('2025-02-10', '2025-02-15', 30000, 2, 'BCD2E34', '22222222222'),
('2025-03-20', '2025-03-25', 70000, 3, 'CDE3F45', '33333333333'),
('2025-04-05', '2025-04-10', 12000, 4, 'DEF4G56', '44444444444'),
('2025-05-15', '2025-05-20', 200000, 5, 'EFG5H67', '55555555555');

INSERT INTO Pagamento (valor, data_pagamento, idCliente, idLocacao)
VALUES
(500.00, '2025-01-05', 1, 1),
(600.00, '2025-02-15', 2, 2),
(750.00, '2025-03-25', 3, 3),
(400.00, '2025-04-10', 4, 4),
(1200.00, '2025-05-20', 5, 5);

INSERT INTO Manutencao (Veiculo_placa, dataManutencao, descricao, tipo, custo)
VALUES
('ABC1D23', '2025-01-15', 'Troca de óleo', 'Preventiva', 150.00),
('BCD2E34', '2025-02-20', 'Troca de pneus', 'Corretiva', 600.00),
('CDE3F45', '2025-03-30', 'Revisão geral', 'Preventiva', 800.00),
('DEF4G56', '2025-04-25', 'Troca de pastilha de freio', 'Corretiva', 300.00),
('EFG5H67', '2025-05-10', 'Troca de motor', 'Corretiva', 5000.00);