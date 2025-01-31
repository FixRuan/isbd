<?php
include "config.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cpf = $_POST['cpf'];
    $nome = $_POST['nome'];
    $cnh = $_POST['cnh'];
    $fone = $_POST['fone'];
    $estado = $_POST['estado'];
    $logradouro = $_POST['logradouro'];
    $cep = $_POST['cep'];
    $numero = $_POST['numero'];
    $bairro = $_POST['bairro'];
    $complemento = $_POST['complemento'];
    $cidade = $_POST['cidade'];

    $sql = "INSERT INTO Cliente (cpf, nome, cnh, fone, estado, logradouro, cep, numero, bairro, complemento, cidade)
            VALUES ('$cpf', '$nome', '$cnh', '$fone', '$estado', '$logradouro', '$cep', '$numero', '$bairro', '$complemento', '$cidade')";

    if ($conn->query($sql)) {
        header("Location: index.php");
    } else {
        echo "Erro: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Adicionar Cliente</title>
</head>

<body>
    <h2>Adicionar Cliente</h2>
    <form method="post">
        Nome: <input type="text" name="nome" required><br>
        CPF: <input type="text" name="cpf" required><br>
        CNH: <input type="text" name="cnh" required><br>
        Fone: <input type="text" name="fone" required><br>
        Estado: <input type="text" name="estado" required><br>
        Logradouro: <input type="text" name="logradouro" required><br>
        CEP: <input type="text" name="cep"><br>
        Número: <input type="number" name="numero" required><br>
        Bairro: <input type="text" name="bairro" required><br>
        Complemento: <input type="text" name="complemento"><br>
        Cidade: <input type="text" name="cidade" required><br>
        <input type="submit" value="Salvar">
    </form>
</body>

</html>