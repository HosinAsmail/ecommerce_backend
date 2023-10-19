<?php 

include "../connect.php";
$categories_id=filterRequest('categories_id');
$users_id=filterRequest('users_id');
$requestNumber=filterRequest("request_number");
$rowPerRequest=6;
$start = $requestNumber * $rowPerRequest;
$sql="SELECT *
FROM (
    SELECT productsview.*, 1 as favorite, (products_price - (products_price*products_discount/100)) as products_price_discount
    FROM productsview 
    INNER JOIN favorite ON favorite.favorite_productsid=productsview.products_id AND favorite.favorite_usersid='$users_id' 
    WHERE categories_id='$categories_id'

    UNION ALL 

    SELECT *, 0 as favorite, (products_price - (products_price*products_discount/100)) as products_price_discount
    FROM productsview 
    WHERE categories_id='$categories_id' 
    AND products_id NOT IN (
        SELECT productsview.products_id
        FROM productsview 
        INNER JOIN favorite ON favorite.favorite_productsid=productsview.products_id AND favorite.favorite_usersid='$users_id'
    )
) AS subquery
LIMIT $start,$rowPerRequest;
";
$stmt=$con->prepare($sql);
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
header('Content-Type: application/json');
if($count>0){
    echo json_encode(array("status" => "success","data" => $data));
}else{
    printMessage("failure","no data found");
}

