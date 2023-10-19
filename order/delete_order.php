<?php

include "../connect.php";
$orders_id = filterRequest('orders_id');
$stmt = $con->prepare("DELETE FROM orders WHERE orders_id=$orders_id AND orders_state='0'");
$stmt->execute();
$count = $stmt->rowCount();
if ($count > 0) {
    $stmt2 = $con->prepare("DELETE FROM cart WHERE cart_orders=$orders_id");
    $stmt2->execute();
    $count2 = $stmt2->rowCount();
    if ($count2 > 0) {
        echo json_encode(array("status" => "success"));
    } else {
        echo json_encode(array("status" => "failure"));
    }
    } else {
    echo json_encode(array("status" => "failure"));
}