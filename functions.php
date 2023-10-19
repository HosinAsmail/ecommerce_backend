<?php

// ==========================================================
//  Copyright Reserved Wael Wael Abo Hamza (Course Ecommerce)
// ==========================================================

define("MB", 1048576);
date_default_timezone_set("Asia/Damascus");
function filterRequest($requestname)
{
  return  htmlspecialchars(strip_tags($_POST[$requestname]));
}

function getData($table, $where = null, $values = null,$json=true)
{
    global $con;
    $data = array();
    if($where==null){
        $stmt = $con->prepare("SELECT  * FROM $table ");

    }else{
        $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");

    }
    $stmt->execute($values);
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
    header('Content-Type: application/json');
    if($json==true){
        if ($count > 0){
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
        return $count;
    
    }else{
        if ($count > 0){
            return $data;
        } else {
            return json_encode(array("status" => "failure"));
        }
    }
}

function insertData($table, $data, $json = true)
{
    global $con;
    foreach ($data as $field => $v)
        $ins[] = ':' . $field;
    $ins = implode(',', $ins);
    $fields = implode(',', array_keys($data));
    $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

    $stmt = $con->prepare($sql);
    foreach ($data as $f => $v) {
        $stmt->bindValue(':' . $f, $v);
    }
    $stmt->execute();
    $count = $stmt->rowCount();
    header('Content-Type: application/json');
    if ($json == true) {
    if ($count > 0) {
        printMessage("success","added successfully");
    } else {
        printMessage("failure","there is a problem in adding");
    }
  }
    return $count;
}


function updateData($table, $data, $where,$json = true)
{
    global $con;
    $cols = array();
    $vals = array();

    foreach ($data as $key => $val) {
        $vals[] = "$val";
        $cols[] = ""$key" =  ? ";
    }
    $sql = "UPDATE $table SET " . implode(', ', $cols) . " WHERE $where";

    $stmt = $con->prepare($sql);
    $stmt->execute($vals);
    $count = $stmt->rowCount();
    if ($json == true) {
    header('Content-Type: application/json');    
    if ($count > 0) {
        printMessage('success',"successfully updated");

    } else {
        printMessage("failure","we could not updated the values");
    }
    }
    return $count;
}

function deleteData($table, $where, $json = true)
{
    global $con;
    $stmt = $con->prepare("DELETE FROM $table WHERE $where");
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        header('Content-Type: application/json');
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

function imageUpload($dir,$imageRequest)
{
  global $msgError;
  if(isset($_FILES[$imageRequest])){
    // $imagename  = rand(1000, 10000) . $_FILES[$imageRequest]['name'];
    $imagename  = $_FILES[$imageRequest]['name'];
    $imagetmp   = $_FILES[$imageRequest]['tmp_name'];
    $imagesize  = $_FILES[$imageRequest]['size'];
    $allowExt   = array("jpg", "png", "gif", "mp3", "pdf","svg","jpeg");
    $strToArray = explode(".", $imagename);
    $ext        = end($strToArray);
    $ext        = strtolower($ext);
    if (!file_exists($dir . "/" . $imagename)) {
        if (!empty($imagename) && !in_array($ext, $allowExt)) {
            $msgError = "EXT";
          }
          if ($imagesize > 2 * MB) {
            $msgError = "size";
          }
    }else{
        $msgError="fileName";
    }
   
    if (empty($msgError)) {
      move_uploaded_file($imagetmp,  $dir. "/" . $imagename);
      return $imagename;
    } else {
      return $msgError;
    }
  
  }else{
    return "empty";
  }
}



function deleteFile($dir, $imagename)
{
    if (file_exists($dir . "/" . $imagename)) {
        unlink($dir . "/" . $imagename);
    }
}

function checkAuthenticate()
{
    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {
        if ($_SERVER['PHP_AUTH_USER'] != "wael" ||  $_SERVER['PHP_AUTH_PW'] != "wael12345") {
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }

    // End 

}
function printMessage($status,$message){
    echo json_encode(array(
        "status" => $status,
        "message" => $message,
    ));
}
function sendEmail($to,$title,$body){
    error_reporting(E_ALL);
    ini_set('display_errors', '1');
    $header = "MIME-Version: 1.0\r\n";
    $header .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
    $header .= "From: Housin@housinasmail.com\r\n";
    try{
    mail($to, $title, $body, $header); 
    }catch(Exception $e){
        echo $e;
    }
}
function sendGCM($title, $message, $topic, $pageid, $pagename)
{


    $url = 'https://fcm.googleapis.com/fcm/send';

    $fields = array(
        "to" => '/topics/' . $topic,
        'priority' => 'high',
        'content_available' => true,

        'notification' => array(
            "body" =>  $message,
            "title" =>  $title,
            "click_action" => "FLUTTER_NOTIFICATION_CLICK",
            "sound" => "default"

        ),
        'data' => array(
            "pageid" => $pageid,
            "pagename" => $pagename
        )

    );


    $fields = json_encode($fields);
    $headers = array(
        'Authorization: key=' . "AAAAYdrURsI:APA91bGR1jh3qsqXvSzSxQ4kH2plGMpn4_ZbSvNHd2R3vfhQVWKVfJo10PB6k78vwg4k-Dd1C0x4vFMUUzFZwyPExGkLmjOh0fs9SSSj87FV3bcR3g_2z_wnf3sKSY2fvcQS9NCMNoMw",
        'Content-Type: application/json'
    );

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

    $result = curl_exec($ch);
    return $result;
    curl_close($ch);
}



function insertNotify($title, $body, $userid, $topic, $pageid, $pagename)
{
    global $con;
    $stmt  = $con->prepare("INSERT INTO "notification"(  "notification_title", "notification_body", "notification_usersid") VALUES (? , ? , ?)");
    $stmt->execute(array($title, $body, $userid));
    sendGCM($title,  $body, $topic, $pageid, $pagename);
    $count = $stmt->rowCount();
    return $count;
}
?>
