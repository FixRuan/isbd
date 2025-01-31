CREATE DATABASE locacao;

USE locacao;

CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    cpf CHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(50) NOT NULL,
    cnh CHAR(11) NOT NULL,
    fone CHAR(15) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    logradouro VARCHAR(30) NOT NULL,
    cep CHAR(8),
    numero INT NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    complemento VARCHAR(50),
    cidade VARCHAR(30) NOT NULL
);
