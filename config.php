<?php
$host = "127.0.0.1";
$login = "root";
$senha = "123456";
$bd = "locacao";

$conn = new mysqli($host, $login, $senha, $bd);

if ($conn->connect_error) {
    die("Erro de conexão com o banco de dados: " . $conn->connect_error);
}
?>