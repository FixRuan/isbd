/*
(f) Exemplos de, pelo menos, 12 consultas. Inclua consultas simples e complexas,
envolvendo todas as cláusulas do comando de consulta (SELECT, FROM, WHERE,
ORDER BY, GROUP BY, HAVING), os operadores (JOIN, OUTER JOIN,
UNION, AND, OR, NOT, BETWEEN, IN, LIKE, IS NULL, ANY/SOME, ALL,
EXISTS), além de funções agregadas e consultas aninhadas (subconsultas). Não faça
aninhamentos "forçados", somente os use em situações onde é difícil escrever uma
consulta sem aninhamento. Será avaliado o nível de complexidade das consultas
apresentadas. Não se esqueça de descrever em detalhes o que cada consulta
recupera (ex: recupera o nome e o endereço dos gerentes dos departamentos que
controlam os projetos localizados em Lavras). (valor: 50%)
F1: consulta com INNER JOIN
F2: consulta com OUTER JOIN
F3: consulta com ORDER BY
F4: consulta com GROUP BY
F5: consulta com HAVING
F6: consulta com UNION
F7: consulta com IN
F8: consulta com LIKE
F9: consulta com IS NULL
F10: consulta com ANY ou SOME
F11: consulta com ALL
F12: consulta com EXISTS
Outras consultas a seu critério. Inclua consultas com os operadores AND, OR, NOT,
BETWEEN, se ainda não apareceram nas consutas de F1 a F12;
*/

-- F1: consulta com INNER JOIN
-- Recupera o nome do cliente, a placa do veículo alugado e a data do aluguel.
-- Faz um INNER JOIN entre Cliente e Locacao para listar apenas os clientes que já realizaram locações
SELECT Cliente.nome, Locacao.Veiculo_placa, Locacao.data_aluguel
FROM Cliente
INNER JOIN Locacao ON Cliente.idCliente = Locacao.idCliente;

-- F2: consulta com OUTER JOIN
-- Lista todos os veículos, mostrando também a data da última manutenção, caso exista.
/*
    O LEFT JOIN garante que todos os veículos apareçam, mesmo sem manutenções.
    A função MAX() retorna a última data de manutenção.
*/
SELECT Veiculo.placa, Veiculo.modelo, MAX(Manutencao.dataManutencao) AS ultima_manutencao
FROM Veiculo
LEFT JOIN Manutencao ON Veiculo.placa = Manutencao.Veiculo_placa
GROUP BY Veiculo.placa, Veiculo.modelo;

-- F3: consulta com ORDER BY
-- Lista os funcionários ordenados pelo nome em ordem alfabética.
SELECT nome, cpf 
FROM Funcionario
ORDER BY nome ASC;

-- F4: consulta com GROUP BY
-- Mostra a quantidade de veículos por fornecedor.
/*
    Usa COUNT() para contar veículos por fornecedor.
    O GROUP BY agrupa os dados por nome do fornecedor.
*/
SELECT Fornecedor.nome, COUNT(Veiculo.placa) AS total_veiculos
FROM Fornecedor
INNER JOIN Veiculo ON Fornecedor.cnpj = Veiculo.Fornecedor_cnpj
GROUP BY Fornecedor.nome;

-- F5: consulta com HAVING
-- Mostra os fornecedores que fornecem mais de 3 veículos.
-- O HAVING filtra apenas os fornecedores que possuem mais de 3 veículos.
SELECT Fornecedor.nome, COUNT(Veiculo.placa) AS total_veiculos
FROM Fornecedor
INNER JOIN Veiculo ON Fornecedor.cnpj = Veiculo.Fornecedor_cnpj
GROUP BY Fornecedor.nome
HAVING COUNT(Veiculo.placa) > 3;

-- F6: consulta com UNION
-- Lista os CPFs de todos os clientes e funcionários, sem duplicação.
SELECT cpf FROM Cliente
UNION
SELECT cpf FROM Funcionario;

-- F7: consulta com IN
-- Mostra os clientes que alugaram um dos veículos específicos ('ABC1D23' ou 'DEF4G56').
SELECT nome FROM Cliente
WHERE idCliente IN (
    SELECT idCliente FROM Locacao WHERE Veiculo_placa IN ('ABC1D23', 'DEF4G56')
);

-- F8: consulta com LIKE
-- Lista todos os clientes cujo nome começa com "Jo".
SELECT nome FROM Cliente
WHERE nome LIKE 'Jo%';

-- F9: consulta com IS NULL
-- Lista os veículos que nunca passaram por manutenção.
SELECT Veiculo.placa, Veiculo.modelo
FROM Veiculo
LEFT JOIN Manutencao ON Veiculo.placa = Manutencao.Veiculo_placa
WHERE Manutencao.idManutencao IS NULL;

-- F10: consulta com ANY ou SOME
-- Lista os clientes que já pagaram algum valor acima de R$500.
-- ANY verifica se pelo menos um pagamento foi maior que 500.
SELECT nome FROM Cliente
WHERE idCliente = ANY (
    SELECT idCliente FROM Pagamento WHERE valor > 500
);

-- F11: consulta com ALL
-- Lista os veiculos com maior quilometragem do que a marca Fiat.
SELECT v.modelo, v.marca, v.placa, v.quilometragem_atual
FROM Veiculo v
WHERE v.quilometragem_atual > ALL (
    SELECT quilometragem_atual
    FROM Veiculo
    WHERE marca = 'Fiat'
);

-- F12: consulta com EXISTS
-- Lista os clientes que já alugaram algum veículo.
-- O EXISTS retorna TRUE se houver pelo menos uma locação para o cliente.
SELECT nome FROM Cliente c
WHERE EXISTS (
    SELECT 1 FROM Locacao l WHERE l.idCliente = c.idCliente
);