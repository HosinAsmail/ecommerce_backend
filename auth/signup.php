<?php 
include "../connect.php";
$username = filterRequest("username");
$password = filterRequest("password"); // now it is more secure 
$securedPassword= sha1($password);
$email = filterRequest("email");
$verifyCode = rand(10000,90000); // give the range of the numbers , not the number of fields
$phone = filterRequest("phone");

$stmt= $con->prepare("SELECT * FROM users WHERE users_email = ? OR users_phone = ? ");
$stmt->execute(array($email,$phone));
$count= $stmt->rowCount();
if ($count > 0){
    printMessage('failure',"failure in Sign up because the email:$email or the phone: $phone number is  used");
}else {
    $data =array(
        "users_name"=>$username,
        "users_email"=>$email,
        "users_password"=>$securedPassword,
        "users_phone"=>$phone,
        "users_verifycode"=>$verifyCode,
    );
    sendEmail($email,"Verify Code Ecommerce","Verify Code $verifyCode");
    insertData("users",$data);
}