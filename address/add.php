<?php 
include "../connect.php";
$users_id = filterRequest("users_id");
$street = filterRequest("street");
$city = filterRequest("city");
$name = filterRequest("name");
// be so careful a tiny space in the column name create a problem cannot be seen
    $data =array(
        "address_usersid"=>$users_id,
        "address_street"=>$street,
        "address_city"=>$city,
        "address_name"=>$name
    );
   insertData("address",$data);
    
