<?php

include "../../connect.php";
$users_id = filterRequest('users_id');
getData("ordersview","orders_usersid=$users_id AND orders_state!=4 ORDER BY orders_id DESC");
