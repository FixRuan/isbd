/*
(h) Exemplos de criação de usuários (pelo menos 2), concessão (GRANT) e revocação
(REVOKE) de permissão de acesso
*/

-- Criando usuários
CREATE USER 'gestor'@'localhost' IDENTIFIED BY 'gerente#2025';
CREATE USER 'atendente'@'localhost' IDENTIFIED BY 'atendente#2025';

-- Concedendo permissões ao usuário 'gestor' (acesso total ao banco)
GRANT ALL PRIVILEGES ON locacao.* TO 'gestor'@'localhost';

-- Concedendo permissões ao usuário 'atendente' (apenas leitura na tabela Cliente)
GRANT SELECT ON locacao.Cliente TO 'atendente'@'localhost';

-- Aplicando as mudanças de privilégios
FLUSH PRIVILEGES;

-- Revogando permissão de leitura do usuário 'atendente'
REVOKE SELECT ON locacao.Cliente FROM 'atendente'@'localhost';

-- Removendo usuários
DROP USER 'gestor'@'localhost';
DROP USER 'atendente'@'localhost';