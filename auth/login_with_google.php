<?php 

include "../connect.php";
$email = filterRequest("email");
$username=filterRequest("username");
$phone=filterRequest("phone");

$data =array(
    "users_name"=>$username,
    "users_email"=>$email,
    "users_password"=>0,
    "users_phone"=>$phone,
    "users_verifycode"=>0,
    "users_approve"=>1
);
insertData("users",$data,false);

$stmt= $con->prepare("
SELECT users_id,users_email,users_approve,users_name,users_phone FROM users 
WHERE users_email = '$email' 
AND users_phone = '$phone'
");
$stmt->execute();
$data=$stmt->fetchAll(PDO::FETCH_ASSOC);
$count= $stmt->rowCount();
if ($count > 0){
   echo json_encode(array("status"=>"success","data"=>$data));
}else{
    printMessage("failure","no such user");
}
