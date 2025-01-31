/*
(g) Exemplos de criação de de 3 visões (Views). Inclua também exemplos de como usar
cada uma das visões. Não esqueça de descrever o que cada comando faz 
*/

/*
    A visão Cliente_Detalhes exibe os detalhes de cada cliente, incluindo nome, CPF, telefone, CNH e cidade. 
    A consulta simplesmente seleciona essas colunas diretamente da tabela Cliente.
*/
CREATE VIEW Cliente_Detalhes AS
SELECT 
    nome AS Nome_Cliente,
    cpf AS CPF,
    fone AS Telefone,
    cnh AS CNH,
    cidade AS Cidade
FROM Cliente;

-- Exibe o nome, CPF, telefone, CNH e cidade de cada cliente no banco de dados.
SELECT * FROM Cliente_Detalhes;

/*
    Visão para mostrar o total de locações por cliente
    Objetivo: Exibir o total de locações feitas por cada cliente, com o nome do cliente e a quantidade de locações realizadas.
*/
CREATE VIEW Total_Locacoes_Por_Cliente AS
SELECT 
    Cliente.nome AS Cliente,
    COUNT(Locacao.idLocacao) AS Total_Locacoes
FROM Cliente
INNER JOIN Locacao ON Cliente.idCliente = Locacao.idCliente
GROUP BY Cliente.idCliente;

-- Exibe o nome de cada cliente e o número total de locações que ele realizou.
SELECT * FROM Total_Locacoes_Por_Cliente;

/*
    Visão para exibir a manutenção dos veículos com custo superior a R$ 500
    Objetivo: Exibir os veículos que passaram por manutenção com um custo superior a R$ 500, 
    incluindo o custo da manutenção e a descrição.
*/
CREATE VIEW Manutencao_Custo_Alto AS
SELECT 
    Veiculo.modelo AS Veiculo,
    Manutencao.dataManutencao,
    Manutencao.tipo AS Tipo_Manutencao,
    Manutencao.descricao,
    Manutencao.custo
FROM Manutencao
INNER JOIN Veiculo ON Manutencao.Veiculo_placa = Veiculo.placa
WHERE Manutencao.custo > 500;

-- Exibe todas as manutenções realizadas em veículos com custo acima de R$ 500, incluindo detalhes do veículo e da manutenção.
SELECT * FROM Manutencao_Custo_Alto;