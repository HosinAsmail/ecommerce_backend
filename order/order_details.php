<?php

include "../connect.php";
$orders_id = filterRequest('orders_id');
getData("cartsview","cart_orders=$orders_id");