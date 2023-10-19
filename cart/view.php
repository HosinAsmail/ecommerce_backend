<?php

include "../connect.php";
$users_id = filterRequest('users_id');

// Use a single SQL query to retrieve data from both tables
$sql = "SELECT * FROM cartsview
        WHERE cart.cart_usersid = :users_id AND cart_orders=0";

$stmt = $con->prepare($sql);
$stmt->bindParam(':users_id', $users_id, PDO::PARAM_INT);
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();

$formattedProducts = array();
foreach ($data as $product) {
    $productModel=array(
        "products_id"=>$product["products_id"],
        "products_name"=>$product["products_name"],
        "products_name_ar"=>$product["products_name_ar"],
        "products_description"=>$product["products_description"],
        "products_description_ar"=>$product["products_description_ar"],
        "products_image"=>$product["products_image"],
        "products_count"=>$product["products_count"],
        "products_active"=>$product["products_active"],
        "products_price"=>$product["products_price"],
        "products_discount"=>$product["products_discount"],
        "products_price_discount"=>$product["products_price_discount"],
        "products_datetime"=>$product["products_datetime"],
        "products_categories"=>$product["products_categories"],
        "categories_id"=>$product["categories_id"],
        "categories_name"=>$product["categories_name"],
        "categories_name_ar"=>$product["categories_name_ar"],
        "categories_image"=>$product["categories_image"],
        "categories_datetime"=>$product["categories_datetime"],

        
    );
    $formattedProducts[] = array(
        "product_model" => $productModel,
        "price_and_count" => array(
            "cart_total_product_price" => $product['cart_total_product_price'],
            "cart_products_count" => $product['cart_products_count']
        )
    );
}

// Create the JSON response
$response = array(
    "status" => "success",
    "products" => $formattedProducts
);

if ($count > 0) {
    header('Content-Type: application/json');
    echo json_encode($response);
} else {
    printMessage("failure", "There is a problem in viewing the data");
}
$sqlTest = "SELECT productsview.*, cart.cart_total_product_price, cart.cart_products_count,(products_price - (products_price*products_discount/100)) as products_price_discount 
        FROM productsview
        INNER JOIN cart ON cart.cart_productsid = productsview.products_id
        WHERE cart.cart_usersid = :users_id AND cart_orders=0";
$s="CREATE OR REPLACE VIEW cartview as SELECT productsview.*, cart.cart_total_product_price,cart.cart_usersid, cart.cart_products_count,(products_price - (products_price*products_discount/100)) as products_price_discount 
FROM productsview
INNER JOIN cart ON cart.cart_productsid = productsview.products_id";