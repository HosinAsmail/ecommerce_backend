<?php 

include "../connect.php";
$users_id=filterRequest('users_id');
$sql="SELECT productsview.* FROM productsview 
INNER JOIN favorite ON favorite.favorite_productsid=productsview.products_id AND favorite.favorite_usersid='$users_id' 
";
$stmt = $con->prepare($sql);
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
header('Content-Type: application/json');
if ($count > 0) {
   echo json_encode(array('status'=> 'success',"products" =>$data ));
} else {
    printMessage("failure","there is a problem in adding");
}
