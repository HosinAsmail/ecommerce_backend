<?php
include "connect.php";
$users_id=filterRequest("users_id");
// getData("notification","notification_usersid=$users_id");
$stmt = $con->prepare("SELECT  notification_id,notification_title,notification_title_ar,notification_body,notification_body_ar,notification_datetime FROM notification WHERE   notification_usersid=$users_id ");
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
header('Content-Type: application/json');
if ($count > 0){
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}