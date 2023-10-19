<?php 
include "../connect.php";
$search = filterRequest("search");
$users_id=filterRequest('users_id');
$sql="SELECT productsview.*, 1 as favorite,(products_price - (products_price*products_discount/100)) as products_price_discount FROM productsview 
INNER JOIN favorite ON favorite.favorite_productsid=productsview.products_id AND favorite.favorite_usersid='$users_id' 
WHERE products_name LIKE '%$search%' OR products_name_ar LIKE '%$search%'
UNION ALL 
SELECT *, 0 as favorite,(products_price - (products_price*products_discount/100)) as products_price_discount FROM productsview 
WHERE (products_name LIKE '%$search%' OR products_name_ar LIKE '%$search%') AND products_id NOT IN (SELECT productsview.products_id FROM productsview 
INNER JOIN favorite ON favorite.favorite_productsid=productsview.products_id AND favorite.favorite_usersid='$users_id')";

$stmt=$con->prepare($sql);
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
header('Content-Type: application/json');
if($count>0){
    echo json_encode(array("status" => "success", "data" => $data));
}else{
    printMessage("failure","no data found");
}
// getData("productsview", "products_name LIKE '%$search%' OR products_name_ar LIKE '%$search%'");
