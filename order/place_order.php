<?php 
include "../connect.php";
$users_id = filterRequest("users_id");
$orders_type = filterRequest("orders_type"); 
$address_id = filterRequest("address_id");
$paymentMethod = filterRequest("payment_method");
$price_delivery = filterRequest("price_delivery");
$coupon_id = filterRequest("coupon_id");
$orders_price = filterRequest("orders_price");
$order_total_price=$orders_price+$price_delivery;
    $data =array(
        "orders_usersid"=>$users_id,
        "orders_address"=>$address_id,
        "orders_type"=>$orders_type,
        "orders_allprodcutsprice"=>$orders_price,
        "orders_coupon"=>$coupon_id,
        "orders_paymentmethod"=>$paymentMethod,
        "orders_pricedelivery"=>$price_delivery,
        "orders_total_price"=>$order_total_price,
        "orders_state"=>"none"

    );
 $count=insertData("orders",$data,false);
 if($count>0){
    $stmt=$con->prepare("SELECT MAX(orders_id) FROM orders");
    $stmt->execute();
    $maxId=$stmt->fetchColumn();
    $data2=array(
        "cart_orders"=>"$maxId"
    );
    updateData("cart",$data2,"cart_usersid='$users_id' AND cart_orders=0");
 }
