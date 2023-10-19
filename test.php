<?php 

include "connect.php";
for($i=15;$i<28;$i++){
    $data=array(
        "products_discount"=> 10
    );
 updateData("products",$data,"products_id=$i",false);
}
echo "success";
