<?php 
include "../connect.php";
$email = filterRequest("email");
$verifyCode = rand(10000,90000); // give the range of the numbers , not the number of fields
$stmt= $con->prepare("SELECT * FROM users WHERE users_email = ? ");
$stmt->execute(array($email));
$count= $stmt->rowCount();
if ($count > 0){
    $data= array("users_verifycode" => $verifyCode);
    updateData("users",$data,"users_email= '$email'");
    sendEmail($email,"Verify Code ","Verify Code $verifyCode");
}else {
    printMessage('failure',"the email: $email is not existed");
}