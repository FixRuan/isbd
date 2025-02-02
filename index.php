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
            padding: 5px;
        }
    </style>
</head>

<body>
    <h2>Clientes</h2>
    <a href="add.php">Adicionar Cliente</a>
    <table class="table" border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>CPF</th>
            <th>CNH</th>
            <th>Fone</th>
            <th>Ações</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?= $row['idCliente'] ?></td>
                <td><?= $row['nome'] ?></td>
                <td><?= $row['cpf'] ?></td>
                <td><?= $row['cnh'] ?></td>
                <td><?= $row['fone'] ?></td>
                <td>
                    <a href="edit.php?id=<?= $row['idCliente'] ?>">Editar</a> |
                    <a href="delete.php?id=<?= $row['idCliente'] ?>" onclick="return confirm('Tem certeza?')">Excluir</a>
                </td>
            </tr>
        <?php endwhile; ?>
    </table>
</body>

</html>