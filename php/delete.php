<?php 
include("conexao.php");
include("seguranca.php");



if(isset($_POST['delete']))
{
    $idFuncionario = $_POST['idFuncionario'];

    $query = "DELETE FROM funcionario WHERE idFuncionario = '$idFuncionario'";
    $query_run = mysqli_query($conexao, $query);

    if($query_run)
    {
        echo '<script> alert("Funcionario Deletado"); window.location.href = "funcionarios.php";</script>';
    }
    else
    {
        echo '<script> alert("Funcionario Não Deletado")</script>';

    }

}
?>