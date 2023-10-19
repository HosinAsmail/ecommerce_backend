<?php 
include "../connect.php";
$address_id = filterRequest("address_id");
$street = filterRequest("street");
$city = filterRequest("city");
$name = filterRequest("name");
// be so careful a tiny space in the column name create a problem cannot be seen
    $data =array(
        "address_street"=>$street,
        "address_city"=>$city,
        "address_name"=>$name
    );
   updateData("address",$data,"address_id=$address_id");
    
