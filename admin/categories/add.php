<?php 
include "../../connect.php";
$name = filterRequest("name");
$nameAr = filterRequest("name_ar"); // now it is more secure 
$imageName=imageUpload("../../upload/categories","files");
if($imageName=="fileName"){
    header('Content-Type: application/json');
    printMessage("failure","the image name already exists");

}else{
    $data =array(
        "categories_name"=>$name,
        "categories_name_ar"=>$nameAr,
        "categories_image"=>$imageName,
    );
$count= insertData("categories",$data,false);
if($count>0){
    getData("categories","categories_name='$name' AND categories_name_ar='$nameAr' ");
}
}
