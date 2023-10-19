<?php 

include "../connect.php";
$products_id=filterRequest('products_id');
$users_id=filterRequest('users_id');

deleteData("favorite"," favorite_usersid='$users_id' AND favorite_productsid='$products_id'");