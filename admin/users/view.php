<?php 
include "../../connect.php";
$sql="SELECT users_name,users_email,users_phone,users_id FROM users";
$stmt=$con->prepare($sql);
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
header('Content-Type: application/json');
if($count>0){
    echo json_encode(array("status" => "success", "data" => $data));
}else{
    printMessage("failure","no data found");
}
