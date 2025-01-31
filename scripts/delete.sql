/*
(e) Exemplos de exclusão de dados em 5 tabelas. Mostre pelo menos um exemplo com
DELETE aninhado, envolvendo mais de uma tabela. Não esqueça de descrever o que
cada comando faz
*/

-- Este comando remove o cliente que tem o CPF 12345678901
DELETE FROM Cliente 
WHERE cpf = '12345678901';

-- Remove o funcionário com CPF 98765432100
DELETE FROM Funcionario 
WHERE cpf = '98765432100';

-- Se um veículo com a placa ABC1234 for um Carro, Moto ou Caminhão, ele também será removido automaticamente
DELETE FROM Veiculo 
WHERE placa = 'ABC1234';

-- Remove o registro de manutenção com ID 10
DELETE FROM Manutencao 
WHERE idManutencao = 10;


-- excluímos os pagamentos do cliente, depois excluímos o cliente da tabela Cliente
DELETE FROM Pagamento 
WHERE idCliente IN (SELECT idCliente FROM Cliente WHERE cpf = '12345678901');
DELETE FROM Cliente 
WHERE cpf = '12345678901';
