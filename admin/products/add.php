<?php 
include "../../connect.php";
$name = filterRequest("name");
$nameAr = filterRequest("name_ar");
$desc = filterRequest("desc");
$descAr = filterRequest("desc_ar");
$count = filterRequest("count");
$active = filterRequest("active");
$price = filterRequest("price");
$discount = filterRequest("discount");
$categoriesId = filterRequest("categories_id");
$imageName=imageUpload("../../upload/products","files");
if($imageName=="fileName"){
    header('Content-Type: application/json');
    printMessage("failure","the image name already exists");
}else{
    $data =array(
        "products_name"=>$name,
        "products_name_ar"=>$nameAr,
        "products_image"=>$imageName,
        "products_description" =>$desc,
        "products_description_ar" =>$descAr,
        "products_count"=>$count,
        "products_active" =>$active,
        "products_price" =>$price,
        "products_discount" =>$discount,
        "products_categories" =>$categoriesId
    );
$count= insertData("products",$data,false);
if($count>0){
    getData("products","products_name='$name' AND products_name_ar='$nameAr' ");
}
}


