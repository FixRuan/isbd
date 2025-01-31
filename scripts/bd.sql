CREATE DATABASE locacao;

USE locacao;

/* (a) Criação de todas as tabelas e de todas as restrições de integridade. Todas as
restrições de chave (PRIMARY KEY) e de integridade referencial (FOREIGN KEY)
devem ser criadas. Além disso, crie pelo menos um exemplo com cada uma das
restrições UNIQUE e DEFAULT */

-- Criação da tabela Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    cpf CHAR(11) NOT NULL UNIQUE,
    cnh CHAR(11) NOT NULL UNIQUE,
    fone CHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    logradouro VARCHAR(30) NOT NULL,
    cep CHAR(8) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR(50),
    cidade VARCHAR(30) NOT NULL,
    bairro VARCHAR(30) NOT NULL
);

-- Criação da tabela Funcionario
CREATE TABLE Funcionario (
    cpf CHAR(11) NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL
);

-- Criação da tabela Funcionario_Horista
CREATE TABLE Funcionario_Horista (
    Funcionario_cpf CHAR(11) NOT NULL PRIMARY KEY,
    valor_hora DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (Funcionario_cpf) REFERENCES Funcionario(cpf)
        ON DELETE CASCADE
);

-- Criação da tabela Funcionario_Mensal
CREATE TABLE Funcionario_Mensal (
    Funcionario_cpf CHAR(11) NOT NULL PRIMARY KEY,
    salario DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (Funcionario_cpf) REFERENCES Funcionario(cpf)
        ON DELETE CASCADE
);

-- Criação da tabela Fornecedor
CREATE TABLE Fornecedor (
    cnpj CHAR(14) NOT NULL PRIMARY KEY UNIQUE,
    nome VARCHAR(50) NOT NULL,
    contato CHAR(11) NOT NULL
);

-- Criação da tabela Veiculo
CREATE TABLE Veiculo (
    placa CHAR(8) NOT NULL PRIMARY KEY UNIQUE,
    marca VARCHAR(15) NOT NULL,
    modelo VARCHAR(15) NOT NULL,
    ano INT NOT NULL,
    quilometragem_atual INT NOT NULL,
    disponibilidade BOOLEAN NOT NULL DEFAULT true,
    valor_diario DECIMAL(7,2) DEFAULT 80.00,
    Fornecedor_cnpj VARCHAR(14) NOT NULL,
    FOREIGN KEY (Fornecedor_cnpj) REFERENCES Fornecedor(cnpj)
        ON DELETE RESTRICT
);

-- Criação da tabela Carro
CREATE TABLE Carro(
    Veiculo_placa CHAR(8) NOT NULL UNIQUE PRIMARY KEY,
    numero_portas INT NOT NULL,
    tipo_combustivel VARCHAR(15),
    FOREIGN KEY (Veiculo_placa) REFERENCES Veiculo(placa)
        ON DELETE CASCADE
);

-- Criação da tabela Moto
CREATE TABLE Moto(
    Veiculo_placa CHAR(8) NOT NULL PRIMARY KEY,
    cilindradas INT NOT NULL,
    FOREIGN KEY (Veiculo_placa) REFERENCES Veiculo(placa)
        ON DELETE CASCADE
);

-- Criação da tabela Caminhão
CREATE TABLE Caminhao(
    Veiculo_placa CHAR(8) NOT NULL PRIMARY KEY,
    eixos INT NOT NULL,
    FOREIGN KEY (Veiculo_placa) REFERENCES Veiculo(placa)
        ON DELETE CASCADE
);

-- Criação da tabela Locacao
CREATE TABLE Locacao (
    idLocacao INT AUTO_INCREMENT PRIMARY KEY,
    data_aluguel DATE NOT NULL,
    data_termino DATE,
    quilometragem_inicial INT NOT NULL,
    idCliente INT NOT NULL,
    Veiculo_placa CHAR(8) NOT NULL,
    funcionario_cpf CHAR(11) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
        ON DELETE CASCADE,
    FOREIGN KEY (Veiculo_placa) REFERENCES Veiculo(placa)
        ON DELETE CASCADE,
	FOREIGN KEY (funcionario_cpf) REFERENCES Funcionario(cpf)
		ON DELETE CASCADE
);
-- Criação da tabela Pagamento
CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(6,2) NOT NULL,
    data_pagamento DATE NOT NULL,
    idCliente INT NOT NULL,
    idLocacao INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
        ON DELETE CASCADE,
    FOREIGN KEY (idLocacao) REFERENCES Locacao(idLocacao)
        ON DELETE CASCADE
);


-- Criação da tabela Manutencao
CREATE TABLE Manutencao (
    idManutencao INT AUTO_INCREMENT PRIMARY KEY,
    Veiculo_placa CHAR(8) NOT NULL,
    dataManutencao DATE NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    custo DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (Veiculo_placa) REFERENCES Veiculo(placa)
        ON DELETE RESTRICT
);