<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produtos</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
</head>
<body>
    <div>
        <?php include("menu.php");?> 
    </div>
    <br>
    <div class="container">
        <div class="jumbotron">
            <h2>Produtos</h2>
            <hr>
<div class="row">
    <a href="produto_inserir.php" class="btn btn-success" style="margin-left:80%;"> Adicionar Produto </a>
</div>

<br>

<?php

include("conexao.php");
include("seguranca.php");

$query = "SELECT * 
FROM produto 
INNER JOIN marca ON marca.idMarca = produto.idMarca 
INNER JOIN categoria ON categoria.idCategoria = produto.idCategoria
ORDER BY nomeProduto";


$query_run = mysqli_query($conexao, $query);

?>

<table class="table table-bordered" style="background-color: white;">
<thead class="table-dark">
    <tr>
        <th>Produto</th>
        <th>Valor</th>
        <th>Marca</th>
        <th>Categoria</th>
        <th>Quantidade</th>
        <th>EDITAR</th>
        <th>DELETAR</th>
    </tr>

</thead>

<?php

    if($query_run)
    {
        while($row = mysqli_fetch_array($query_run))
        {
            ?>
                <tbody>
                    <tr>
                        <th> <?php echo $row['nomeProduto']; ?></th>
                        <th> <?php echo $row['valorProduto']; ?></th>
                        <th> <?php echo $row['nomeMarca']; ?></th>
                        <th> <?php echo $row['nomeCategoria']; ?></th>
                        <th> <?php echo $row['quantidadeProduto']; ?></th>
                        <form action="produtos_update.php" method="post">
                            <input type="hidden" name='idProduto' value="<?php echo $row['idProduto']?>">
                            <th> <input type="submit" name="edit" class="btn btn-success" value="EDITAR"></th>
                        </form>
                        <form action="produtos_deletar.php" method="post">
                            <input type="hidden" name='idProduto' value="<?php echo $row['idProduto'] ?>">
                            <th> <input type="submit" name="delete" class="btn btn-danger" value="DELETAR"> </th>
                        </form>
                    </tr>
                </tbody>
            <?php
        }
    }else
    {
        echo "Nada foi encontrado";
    }
?>
</table>
        </div>
    </div>
<?php include("dep_query.php");?>
</body>
</html>