/*
(b) Exemplos de ALTER TABLE (pelo menos 3 exemplos, envolvendo alterações
diversas) e DROP TABLE. Crie uma tabela extra que não existe no seu trabalho,
somente para exemplificar, e a apague no final com o DROP TABLE 
*/

-- adiciona um email na tabela Cliente
ALTER TABLE Cliente 
ADD email VARCHAR(100) UNIQUE;

-- modifica o atributo modelo de veículo para possuir mais caracteres (15 -> 30)
ALTER TABLE Veiculo 
MODIFY COLUMN modelo VARCHAR(30) NOT NULL;


-- remove o atributo contado da tabela fornecedor
ALTER TABLE Fornecedor 
DROP COLUMN contato;

-- cria uma tabela de seguro que se relaciona com cliente, possuindo cobertura e valor
CREATE TABLE Seguro (
    idSeguro INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    cobertura VARCHAR(50) NOT NULL,
    valor DECIMAL(7,2) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

DROP TABLE Seguro;