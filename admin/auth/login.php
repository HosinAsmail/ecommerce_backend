<?php 

include "../../connect.php";
$password = filterRequest("password"); // now it is more secure 
$email = filterRequest("email");

$stmt= $con->prepare("SELECT admin_id,admin_email,admin_name,admin_phone FROM admin WHERE admin_email = '$email' AND admin_password = '$password'");
$stmt->execute();
$data=$stmt->fetchAll(PDO::FETCH_ASSOC);
$count= $stmt->rowCount();
header('Content-Type: application/json');
if ($count > 0){
    echo json_encode(array("status"=>"success","data"=>$data));
}else{
    printMessage("failure","no such admin");
}
