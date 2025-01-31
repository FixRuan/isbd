/*
(d) Exemplos de modificação de dados em 5 tabelas. Mostre pelo menos um exemplo
com UPDATE aninhado, envolvendo mais de uma tabela. Não esqueça de descrever
o que cada comando faz 
*/

-- 1. Atualização de dados na tabela Cliente
UPDATE Cliente
SET fone = '44557654321'
WHERE cpf = '12345678901';

-- 2. Atualização de um fornecedor
UPDATE Fornecedor
SET contato = '31991234567'
WHERE cnpj = '12345678000123';

-- 3. Atualização de um veículo
UPDATE Veiculo
SET valor_diario = 110.00
WHERE placa = 'ABC1D23';

-- 4. Atualização de uma locação
UPDATE Locacao
SET data_termino = '2025-01-06'
WHERE idLocacao = 1;

-- 5. Atualização de um pagamento
UPDATE Pagamento
SET valor = 550.00
WHERE id_pagamento = 1;

-- UPDATE aninhado: Atualiza a quilometragem final de um veículo após a locação ser encerrada
UPDATE Veiculo
SET quilometragem_atual = (
    SELECT quilometragem_inicial + 500 -- Supondo um uso de 500 km na locação
    FROM Locacao
    WHERE Veiculo.placa = Locacao.Veiculo_placa AND Locacao.idLocacao = 1
)
WHERE placa = (SELECT Veiculo_placa FROM Locacao WHERE idLocacao = 1);