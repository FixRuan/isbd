<?php
include "config.php";

$id = $_GET['id'];
$conn->query("DELETE FROM Cliente WHERE idCliente = $id");

header("Location: index.php");
?>