<?php 

include "../connect.php";
$products_id=filterRequest('products_id');
$users_id=filterRequest('users_id');
$data =array(
    "favorite_usersid"=>$users_id,
    "favorite_productsid"=>$products_id,
);

insertData('favorite',$data);
