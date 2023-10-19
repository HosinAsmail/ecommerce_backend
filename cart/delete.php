<?php 

include "../connect.php";
$products_id=filterRequest('products_id');
$users_id=filterRequest('users_id');

deleteData("cart"," cart_id = (SELECT cart_id FROM cart WHERE cart_usersid= '$users_id' AND cart_productsid='$products_id' AND cart_orders=0 LIMIT 1) ");