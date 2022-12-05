<?php 
include("conexao.php");
include("seguranca.php");


if(isset($_POST['delete']))
{
    $idProduto = $_POST['idProduto'];

    $query = "DELETE FROM produto WHERE (idProduto = '$idProduto')";
    $query_run = mysqli_query($conexao, $query);

    if($query_run)
    {
        echo '<script> alert("Produto Deletado"); window.location.href = "produtos.php";</script>';
    }
    else
    {
        echo  '<script> alert("Produto Não Deletado")</script>' ; 
    }

}
?>