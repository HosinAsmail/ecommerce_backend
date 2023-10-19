<?php 

include "../connect.php";
$products_id=filterRequest('products_id');
$users_id=filterRequest('users_id');
$products_count=filterRequest('products_count');
$total_product_price=filterRequest('total_product_price');

$data =array(
    "cart_usersid"=>$users_id,
    "cart_productsid"=>$products_id,
    "cart_products_count" => $products_count,
    "cart_total_product_price"=>$total_product_price

);
insertData('cart',$data);
