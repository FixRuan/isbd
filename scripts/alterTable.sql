/*
(b) Exemplos de ALTER TABLE (pelo menos 3 exemplos, envolvendo alterações
diversas) e DROP TABLE. Crie uma tabela extra que não existe no seu trabalho,
somente para exemplificar, e a apague no final com o DROP TABLE 
*/

ALTER TABLE Cliente 
ADD email VARCHAR(100) UNIQUE;

ALTER TABLE Veiculo 
MODIFY COLUMN modelo VARCHAR(30) NOT NULL;

ALTER TABLE Fornecedor 
DROP COLUMN contato;

CREATE TABLE Seguro (
    idSeguro INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    cobertura VARCHAR(50) NOT NULL,
    valor DECIMAL(7,2) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- DROP TABLE Seguro;