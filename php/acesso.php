<?php

$usuario=$_POST['c_usuario'];
$senha=$_POST['c_senha'];

include("conexao.php");
 
mysqli_select_db($conexao,"mercadinho");

$sql= mysqli_query($conexao, "SELECT * FROM funcionario where nomeFuncionario ='$usuario' and senhaFuncionario='$senha'") or die(mysqli_error());
    $cont = mysqli_num_rows($sql);
        if($cont>0){
       	session_start();
          $_SESSION['usuario_usuario']=$usuario;
          $_SESSION['senha_usuario']=$senha;
          header("Location:funcionarios.php"); 
        }
        else{
            header("Location:index.html");
        }
        
        mysqli_close($conexao);
?>