<?php 
include "../../connect.php";
$title = filterRequest("title");
$titleAr = filterRequest("title_ar"); 
$body = filterRequest("body");
$bodyAr = filterRequest("body_ar"); 
$color = filterRequest("color");
$colorCircle = filterRequest("color_circle");
    $data =array(
        "ads_title"=>$title,
        "ads_title_ar"=>$titleAr,
        "ads_body"=>$body,
        "ads_body_ar"=>$bodyAr,
        "ads_color"=>$color,
        "ads_color_circle"=>$colorCircle
    );
$count= insertData("ads",$data,false);
if($count>0){
    getData("ads","ads_title='$title' AND ads_title_ar='$titleAr' ");
}
