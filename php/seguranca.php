<?php
//ob start tira os espaços em branco
ob_start();
session_start();
//VERIFICACAO PARA VER SE O USUARIO ESTÁ LOGADO
if(($_SESSION['usuario_usuario']== "") || ($_SESSION['senha_usuario']== "")){
    include("destruirSessao.php");
    header("Location:index.html");
}
?>