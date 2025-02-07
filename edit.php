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
    <style>
        * {
            padding: 2px;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }

        input[type="submit"], [type="button"] {
            background-color: #fff;
            border: 1px solid #000;
            padding: 5px;
            margin-top: 10px;
            width: 49%; 
        }

        input[type="submit"]:hover, [type="button"]:hover {
            background-color: #000;
            color: #fff;
            cursor:pointer;
        }

    </style>
</head>

<body>
    <h2 align="center">Editar Cliente</h2>
    <form method="post">
        <table border="0" align="center">
            <tr>
                <td>Nome:</td>
                <td><input type="text" name="nome" value="<?= $cliente['nome'] ?>" required maxlength="50"></td>
            </tr>
            <tr>
                <td>Fone:</td>
                <td><input type="text" name="fone" value="<?= $cliente['fone'] ?>" required minlength="11" maxlength="11"></td>
            </tr>
            <tr>
                <td>Estado:</td>
                <td><input type="text" name="estado" value="<?= $cliente['estado'] ?>" required maxlength="2"></td>
            </tr>
            <tr>
                <td>Logradouro:</td>
                <td><input type="text" name="logradouro" value="<?= $cliente['logradouro'] ?>" required maxlength="50"></td>
            </tr>
            <tr>
                <td>CEP:</td>
                <td><input type="text" name="cep" value="<?= $cliente['cep'] ?>" required minlength="8" maxlength="8"></td>
            </tr>
            <tr>
                <td>Número:</td>
                <td><input type="text" name="numero" value="<?= $cliente['numero'] ?>" required maxlength="10"></td>
            </tr>
            <tr>
                <td>Bairro:</td>
                <td><input type="text" name="bairro" value="<?= $cliente['bairro'] ?>" required maxlength="50"></td>
            </tr>
            <tr>
                <td>Complemento:</td>
                <td><input type="text" name="complemento" value="<?= $cliente['complemento'] ?>" maxlength="50"></td>
            </tr>
            <tr>
                <td>Cidade:</td>
                <td><input type="text" name="cidade" value="<?= $cliente['cidade'] ?>" required maxlength="50"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Salvar">
                    <input type="button" value="Cancelar" onclick="window.location.href='index.php'">
                </td>
            </tr>
        </table>
    </form>
</body>

</html>