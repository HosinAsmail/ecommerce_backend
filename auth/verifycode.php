<?php
include "../connect.php";

$email = filterRequest("email");
$isSignUp = filterRequest("isSignUp");
$verifyCode= filterRequest("verifyCode");
// do not forget to wrap the email in prepare with '' this. like 👇 here.
$stmt= $con->prepare("SELECT * FROM users WHERE users_email = '$email' AND users_verifycode = '$verifyCode' ");
$stmt->execute();
$count= $stmt->rowCount();
if ($count > 0){
    if($isSignUp=="true"){
    $data= array("users_approve" => "1");
    updateData("users",$data,"users_email= '$email'","successfully verified");
}else{
    printMessage("success","reset password now");
}
}else {
    printMessage("failure","verify code is not correct");
}