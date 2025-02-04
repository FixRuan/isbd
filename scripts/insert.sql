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
('56789012345', '54321098766', '31983456789', 'Fernando Lima', 'RS', 'Avenida E', '90020030', 500, 'Sala 10', 'Porto Alegre', 'Centro Histórico'),
('67890123456', '43210987655', '31984561234', 'Paulo Mendes', 'BA', 'Rua F', '40010020', 600, 'Casa 2', 'Salvador', 'Barra'),
('78901234567', '32109876544', '31985672345', 'Renata Costa', 'CE', 'Avenida G', '60030340', 700, NULL, 'Fortaleza', 'Meireles'),
('89012345678', '21098765433', '31986783456', 'Gustavo Ferreira', 'SC', 'Rua H', '88020050', 800, 'Bloco 3', 'Florianópolis', 'Centro'),
('90123456789', '10987654322', '31987894567', 'Tatiane Lima', 'DF', 'Rua I', '70040060', 900, NULL, 'Brasília', 'Asa Sul'),
('01234567890', '09876543211', '31988905678', 'Bruno Rocha', 'AM', 'Avenida J', '69050070', 1000, 'Loja 5', 'Manaus', 'Centro');

INSERT INTO Funcionario (cpf, nome)
VALUES
('11111111111', 'Roberto Almeida'),
('22222222222', 'Juliana Mendes'),
('33333333333', 'Ricardo Santos'),
('44444444444', 'Carla Nunes'),
('55555555555', 'André Costa'),
('66666666666', 'Lucas Oliveira'),
('77777777777', 'Mariana Silva'),
('88888888888', 'Camila Rocha'),
('99999999999', 'Fernando Souza'),
('10101010101', 'Débora Martins');

INSERT INTO Funcionario_Horista (Funcionario_cpf, valor_hora)
VALUES
('11111111111', 20.50),
('22222222222', 22.00),
('33333333333', 18.75),
('44444444444', 21.30),
('55555555555', 19.80),
('66666666666', 23.50),
('77777777777', 25.00),
('99999999999', 22.75);
INSERT INTO Funcionario_Mensal (Funcionario_cpf, salario)
VALUES
('11111111111', 3500.00),
('22222222222', 4200.00),
('33333333333', 3900.00),
('44444444444', 4600.00),
('55555555555', 4100.00),
('88888888888', 5000.00),
('10101010101', 4800.00);

INSERT INTO Fornecedor (cnpj, nome, contato)
VALUES
('12345678000123', 'AutoPeças LTDA', '31991234567'),
('23456789000134', 'Veículos SA', '31992345678'),
('34567890000145', 'Carros e Motos Ltda', '31993456789'),
('45678901000156', 'Transporte Fácil', '31994567890'),
('56789012000167', 'Caminhões e Afins', '31995678901'),
('67890123000178', 'AutoCar Ltda', '31996781234'),
('78901234000189', 'MotoWorld', '31997892345'),
('89012345000190', 'TruckParts Ltda', '31998903456'),
('90123456000101', 'BikeCenter SA', '31999014567'),
('01234567000112', 'MotoPeças Brasil', '31999125678');

INSERT INTO Veiculo (placa, marca, modelo, ano, quilometragem_atual, disponibilidade, valor_diario, Fornecedor_cnpj)
VALUES
('ABC1D23', 'Fiat', 'Uno', 2020, 50000, true, 100.00, '12345678000123'),
('BCD2E34', 'Chevrolet', 'Onix', 2021, 30000, true, 120.00, '23456789000134'),
('CDE3F45', 'Honda', 'Civic', 2019, 70000, true, 150.00, '34567890000145'),
('DEF4G56', 'Yamaha', 'Fazer 250', 2022, 12000, true, 90.00, '45678901000156'),
('EFG5H67', 'Scania', 'R500', 2018, 200000, true, 250.00, '56789012000167'),
('HIJ6K78', 'Volkswagen', 'Golf', 2022, 10000, true, 130.00, '67890123000178'),
('IJK7L89', 'Suzuki', 'GSX-S750', 2021, 5000, true, 110.00, '78901234000189'),
('JKL8M90', 'Mercedes', 'Actros', 2018, 150000, true, 300.00, '89012345000190'),
('KLM9N01', 'Honda', 'CB500F', 2020, 8000, true, 95.00, '90123456000101'),
('LMN0P12', 'BMW', 'X1', 2023, 2000, true, 180.00, '01234567000112');
INSERT INTO Carro (Veiculo_placa, numero_portas, tipo_combustivel)
VALUES
('ABC1D23', 4, 'Gasolina'),
('BCD2E34', 4, 'Flex'),
('CDE3F45', 4, 'Gasolina'),
('DEF4G56', 2, 'Elétrico'),
('EFG5H67', 4, 'Diesel'),
('HIJ6K78', 4, 'Flex'),
('LMN0P12', 4, 'Gasolina');

INSERT INTO Moto (Veiculo_placa, cilindradas)
VALUES
('DEF4G56', 250),
('ABC1D23', 150),
('BCD2E34', 300),
('CDE3F45', 500),
('EFG5H67', 750),
('IJK7L89', 750),
('KLM9N01', 500);

INSERT INTO Caminhao (Veiculo_placa, eixos)
VALUES
('EFG5H67', 6),
('ABC1D23', 4),
('BCD2E34', 8),
('CDE3F45', 10),
('DEF4G56', 12),
('JKL8M90', 8);
INSERT INTO Locacao (data_aluguel, data_termino, quilometragem_inicial, idCliente, Veiculo_placa, funcionario_cpf)
VALUES
('2025-01-01', '2025-01-05', 50000, 1, 'ABC1D23', '11111111111'),
('2025-02-10', '2025-02-15', 30000, 2, 'BCD2E34', '22222222222'),
('2025-03-20', '2025-03-25', 70000, 3, 'CDE3F45', '33333333333'),
('2025-04-05', '2025-04-10', 12000, 4, 'DEF4G56', '44444444444'),
('2025-05-15', '2025-05-20', 200000, 5, 'EFG5H67', '55555555555'),
('2025-06-01', '2025-06-07', 10000, 6, 'HIJ6K78', '66666666666'),
('2025-07-10', '2025-07-15', 5000, 7, 'IJK7L89', '77777777777'),
('2025-08-05', '2025-08-12', 8000, 8, 'KLM9N01', '88888888888'),
('2025-09-15', '2025-09-20', 2000, 9, 'LMN0P12', '99999999999'),
('2025-10-01', '2025-10-07', 150000, 10, 'JKL8M90', '10101010101');

INSERT INTO Pagamento (valor, data_pagamento, idCliente, idLocacao)
VALUES
(500.00, '2025-01-05', 1, 1),
(600.00, '2025-02-15', 2, 2),
(750.00, '2025-03-25', 3, 3),
(400.00, '2025-04-10', 4, 4),
(1200.00, '2025-05-20', 5, 5),
(900.00, '2025-06-07', 6, 6),
(550.00, '2025-07-15', 7, 7),
(700.00, '2025-08-12', 8, 8),
(950.00, '2025-09-20', 9, 9),
(1800.00, '2025-10-07', 10, 10);

INSERT INTO Manutencao (Veiculo_placa, dataManutencao, descricao, tipo, custo)
VALUES
('ABC1D23', '2025-01-15', 'Troca de óleo', 'Preventiva', 150.00),
('BCD2E34', '2025-02-20', 'Troca de pneus', 'Corretiva', 600.00),
('CDE3F45', '2025-03-30', 'Revisão geral', 'Preventiva', 800.00),
('DEF4G56', '2025-04-25', 'Troca de pastilha de freio', 'Corretiva', 300.00),
('EFG5H67', '2025-05-10', 'Troca de motor', 'Corretiva', 5000.00),
('HIJ6K78', '2025-06-15', 'Troca de óleo', 'Preventiva', 180.00),
('IJK7L89', '2025-07-20', 'Substituição da corrente', 'Corretiva', 400.00),
('KLM9N01', '2025-08-25', 'Troca de pastilhas de freio', 'Corretiva', 320.00),
('LMN0P12', '2025-09-30', 'Revisão geral', 'Preventiva', 850.00),
('JKL8M90', '2025-10-10', 'Troca do motor', 'Corretiva', 7000.00);