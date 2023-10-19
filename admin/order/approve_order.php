<?php

include "../../connect.php";
$users_id = filterRequest('users_id');
$orders_id = filterRequest('orders_id');

$data=array(
    "orders_state" => 1
);
updateData("orders",$data,"orders_id=$orders_id");
// sendGCM("نجاح","تمت الموافقة على طلبك","$users_id",'','');
insertNotify("نجاح","تمت الموافقة على الطلب",$users_id,$users_id,"","");