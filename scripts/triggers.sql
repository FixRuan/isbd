/*
(j) Exemplos de 3 triggers, um para cada evento (inserção, alteração e exclusão). Os
triggers devem ter aplicação no seu projeto. Apresente exemplos de testes dos
triggers, mostrando casos em que eles são disparados e casos em que não são
disparados.
*/

-- Trigger INSERT 
-- Objetivo: Atualizar a disponibilidade do veículo para false quando uma nova locação é inserida.

DELIMITER //
CREATE TRIGGER AtualizaDisponibilidadeAoAlugar
AFTER INSERT ON Locacao
FOR EACH ROW
BEGIN
    UPDATE Veiculo
    SET disponibilidade = false
    WHERE placa = NEW.Veiculo_placa;
END;
//
DELIMITER ;


INSERT INTO Locacao (data_aluguel, quilometragem_inicial, idCliente, Veiculo_placa, funcionario_cpf) VALUES ('2025-01-31', 20000, 1, 'ABC1D23', '11111111111');
INSERT INTO Locacao (data_aluguel, quilometragem_inicial, idCliente, Veiculo_placa, funcionario_cpf) VALUES ('2025-02-01', 15000, 2, 'BCD2E34', '22222222222');

-- Trigger para Alteração
-- Objetivo: Impedir a alteração da quilometragem de um veículo para um valor menor que o atual.

DELIMITER //
CREATE TRIGGER ImpedirQuilometragemMenor
BEFORE UPDATE ON Veiculo
FOR EACH ROW
BEGIN
    IF NEW.quilometragem_atual < OLD.quilometragem_atual THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Não é permitido reduzir a quilometragem do veículo.';
    END IF;
END;
//
DELIMITER ;

UPDATE Veiculo SET quilometragem_atual = 30000 WHERE placa = 'ABC1D23';
UPDATE Veiculo SET quilometragem_atual = 15000 WHERE placa = 'ABC1D23';


-- Trigger para Exclusão
-- Objetivo: Impedir a exclusão de um cliente que possui locações em andamento.

DELIMITER //
CREATE TRIGGER ImpedirExclusaoClienteComLocacao
BEFORE DELETE ON Cliente
FOR EACH ROW
BEGIN
    DECLARE locacoes_ativas INT;

    SELECT COUNT(*) INTO locacoes_ativas
    FROM Locacao
    WHERE idCliente = OLD.idCliente AND data_termino IS NULL;

    IF locacoes_ativas > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: O cliente possui locações em andamento.';
    END IF;
END;
//
DELIMITER ;