/*
(i) Exemplos de 3 procedimentos/funções, com e sem parâmetros, de entrada e de saída,
contendo alguns comandos tais como IF, CASE WHEN, WHILE, declaração de
variáveis e funções prontas. Os procedimentos devem ter aplicação no seu projeto.
Apresente exemplos de testes dos procedimentos/funções, mostrando como eles
são executados. Não esqueça de descrever o que cada comando faz
*/

-- Criando função para verificar status da CNH
-- Retorna válida se o tamanho da cnh for 11
DELIMITER //
CREATE FUNCTION Verificar_Status_CNH(cnh_cliente CHAR(11)) RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
    DECLARE status_cnh VARCHAR(20);
    SELECT CASE 
        WHEN LENGTH(cnh_cliente) = 11 THEN 'Válida'
        ELSE 'Inválida'
    END INTO status_cnh;
    RETURN status_cnh;
END //
DELIMITER;

-- Criando procedimento para calcular desconto para clientes frequentes
DELIMITER //
CREATE PROCEDURE Aplicar_Desconto(cliente_id INT, OUT desconto DECIMAL(5,2))
BEGIN
    DECLARE num_alugueis INT;
    SELECT COUNT(*) INTO num_alugueis FROM locacao WHERE idCliente = cliente_id;
    SET desconto = CASE 
        WHEN num_alugueis >= 3 THEN 0.15
        WHEN num_alugueis >= 2 THEN 0.10
        ELSE 0.05
    END;
END //
DELIMITER ;

-- Criando procedimento para listar clientes por estado
DELIMITER //
CREATE PROCEDURE Listar_Clientes_Por_Estado(IN estado_cliente VARCHAR(30))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE cliente_nome VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT nome FROM Cliente WHERE estado = estado_cliente;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    clientes_loop: LOOP
        FETCH cur INTO cliente_nome;
        IF done THEN
            LEAVE clientes_loop;
        END IF;
        SELECT cliente_nome;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

-- Testando as funções e procedimentos
select locacao.Verificar_Status_CNH('12345678900');

set @desconto = 0;
call locacao.Aplicar_Desconto(1, @desconto);
select @desconto;

call locacao.Listar_Clientes_Por_Estado('MG');