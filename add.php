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
    <style>
        * {
            padding: 2px;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }

        input[type="submit"], [type="button"] {
            background-color: #fff;
            padding: 6px;
            margin-top: 10px;
            border: 1px solid #000;
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
    <h2 align="center">Adicionar Cliente</h2>
    <form method="post">
        <table border="0" align="center">
            <tr>
                <td>CPF:</td>
                <td><input type="text" name="cpf" required minlength="11" maxlength="11"></td>
            </tr>
            <tr>
                <td>Nome:</td>
                <td><input type="text" name="nome" required maxlength="50"></td>
            </tr>
            <tr>
                <td>CNH:</td>
                <td><input type="text" name="cnh" required minlength="11" maxlength="11"></td>
            </tr>
            <tr>
                <td>Fone:</td>
                <td><input type="text" name="fone" required minlength="11" maxlength="11"></td>
            </tr>
            <tr>
                <td>Estado:</td>
                <td><input type="text" name="estado" required maxlength="30"></td>
            </tr>
            <tr>
                <td>Logradouro:</td>
                <td><input type="text" name="logradouro" required maxlength="30"></td>
            </tr>
            <tr>
                <td>CEP:</td>
                <td><input type="text" name="cep" required minlength="8" maxlength="8"></td>
            </tr>
            <tr>
                <td>Número:</td>
                <td><input type="number" name="numero" required></td>
            </tr>
            <tr>
                <td>Bairro:</td>
                <td><input type="text" name="bairro" required maxlength="30"></td>
            </tr>
            <tr>
                <td>Complemento:</td>
                <td><input type="text" name="complemento" maxlength="50"></td>
            </tr>
            <tr>
                <td>Cidade:</td>
                <td><input type="text" name="cidade" required maxlength="30"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Adicionar">
                    <input type="button" value="Cancelar" onclick="window.location.href='index.php'">
                </td>
            </tr>
        </table>
    </form>
</body>

</html>