<?php 
include("conexao.php");
include("seguranca.php");



if(isset($_POST['delete']))
{
    $idCliente = $_POST['idCliente'];

    $query = "DELETE FROM cliente WHERE idCliente = '$idCliente'";
    $query_run = mysqli_query($conexao, $query);

    if($query_run)
    {
        echo '<script> alert("Cliente Deletado"); window.location.href = "clientes.php";</script>';
    }
    else
    {
        echo '<script> alert("Cliente Não Deletado")</script>';
    }

}
?>