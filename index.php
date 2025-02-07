<?php
include "config.php";

$result = $conn->query("SELECT * FROM Cliente");

?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>

    <style>
        * {
            padding: 3px;
            font-family: Verdana, Geneva, Tahoma, sans-serif;

            input[type="submit"] {
                display: block;
                padding: 5px;
                margin: 10px auto;
                background-color: #fff;
                border: 1px solid #000;
                width: 10%;
            }

            input[type="submit"]:hover {
                background-color: #000;
                color: #fff;
                cursor:pointer;
            }
        }
    </style>
</head>

<body>
    <h2 align="center">Clientes</h2>
    <table border="1" align="center" width="100%" style="border-collapse: collapse;" bordercolor="#000">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>CPF</th>
            <th>CNH</th>
            <th>Fone</th>
            <th>Estado</th>
            <th>Logradouro</th>
            <th>CEP</th>
            <th>Número</th>
            <th>Bairro</th>
            <th>Complemento</th>
            <th>Cidade</th>
            <th>Ações</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
            <tr align="center">
                <td><?= $row['idCliente'] ?></td>
                <td><?= $row['nome'] ?></td>
                <td><?= $row['cpf'] ?></td>
                <td><?= $row['cnh'] ?></td>
                <td><?= $row['fone'] ?></td>
                <td><?= $row['estado'] ?></td>
                <td><?= $row['logradouro'] ?></td>
                <td><?= $row['cep'] ?></td>
                <td><?= $row['numero'] ?></td>
                <td><?= $row['bairro'] ?></td>
                <td><?= $row['complemento'] ?></td>
                <td><?= $row['cidade'] ?></td>
                <td>
                    <a href="edit.php?id=<?= $row['idCliente'] ?>">Editar</a> |
                    <a href="delete.php?id=<?= $row['idCliente'] ?>" onclick="return confirm('Tem certeza?')">Excluir</a>
                </td>
            </tr>
        <?php endwhile; ?>
    </table>
    <input type="submit" value="Adicionar cliente" onclick="window.location.href='add.php'" />
</body>

</html>