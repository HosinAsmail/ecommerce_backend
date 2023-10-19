<?php 

include "../connect.php";
$password = filterRequest("password"); // now it is more secure 
$securedPassword= sha1($password);
$email = filterRequest("email");

$stmt= $con->prepare("SELECT users_id,users_email,users_approve,users_name,users_phone FROM users WHERE users_email = '$email' AND users_password = '$securedPassword'");
$stmt->execute();
$data=$stmt->fetchAll(PDO::FETCH_ASSOC);
$count= $stmt->rowCount();
if ($count > 0){
   echo json_encode(array("status"=>"success","data"=>$data));
}else{
    printMessage("failure","no such user");
}
// getData("users","users_email = '$email' AND users_password = '$securedPassword' ");
