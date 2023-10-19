<?php 

include "../../connect.php";
$sql="SELECT products.*,(products_price - (products_price*products_discount/100)) as products_price_discount FROM products";
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

