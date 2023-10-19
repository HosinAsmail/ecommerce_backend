<?php 
include "../connect.php";
$password = filterRequest("password"); // now it is more secure 
$securedPassword= sha1($password);
$email = filterRequest("email");

$stmt= $con->prepare("SELECT * FROM users WHERE users_email = ? ");
$stmt->execute(array($email));
$count= $stmt->rowCount();
if ($count > 0){
    $data= array("users_password" => $securedPassword);
    updateData("users",$data,"users_email= '$email'");
}
else {
    printMessage("failure","the email is not existed");
}