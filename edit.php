<?php
include "config.php";

$id = $_GET['id'];
$result = $conn->query("SELECT * FROM Cliente WHERE idCliente = $id");
$cliente = $result->fetch_assoc();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome = $_POST['nome'];
    $fone = $_POST['fone'];
    $estado = $_POST['estado'];
    $logradouro = $_POST['logradouro'];
    $cep = $_POST['cep'];
    $numero = $_POST['numero'];
    $bairro = $_POST['bairro'];
    $complemento = $_POST['complemento'];
    $cidade = $_POST['cidade'];

    $sql = "UPDATE Cliente SET nome='$nome', fone='$fone', estado='$estado', logradouro='$logradouro', cep='$cep',
            numero='$numero', bairro='$bairro', complemento='$complemento', cidade='$cidade' WHERE idCliente=$id";

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
    <title>Editar Cliente</title>
</head>

<body>
    <h2>Editar Cliente</h2>
    <form method="post">
        Nome: <input type="text" name="nome" value="<?= $cliente['nome'] ?>" required><br>
        Fone: <input type="text" name="fone" value="<?= $cliente['fone'] ?>" required><br>
        Estado: <input type="text" name="estado" value="<?= $cliente['estado'] ?>" required><br>
        Logradouro: <input type="text" name="logradouro" value="<?= $cliente['logradouro'] ?>" required><br>
        CEP: <input type="text" name="cep" value="<?= $cliente['cep'] ?>"><br>
        Número: <input type="number" name="numero" value="<?= $cliente['numero'] ?>" required><br>
        Bairro: <input type="text" name="bairro" value="<?= $cliente['bairro'] ?>" required><br>
        Complemento: <input type="text" name="complemento" value="<?= $cliente['complemento'] ?>"><br>
        Cidade: <input type="text" name="cidade" value="<?= $cliente['cidade'] ?>" required><br>
        <input type="submit" value="Atualizar">
    </form>
</body>

</html>