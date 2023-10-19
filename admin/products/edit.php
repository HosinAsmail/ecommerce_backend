<?php 
include "../../connect.php";
$productsId = filterRequest("products_id");
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
if($imageName=="empty"){
    $data =array(
        "products_name"=>$name,
        "products_name_ar"=>$nameAr,
        "products_description" =>$desc,
        "products_description_ar" =>$descAr,
        "products_count"=>$count,
        "products_active" =>$active,
        "products_price" =>$price,
        "products_discount" =>$discount,
        "products_categories" =>$categoriesId
    );
    updateData("products",$data,"products_id=$productsId");
}else if($imageName=="fileName"){
    header('Content-Type: application/json');
    printMessage("failure","the image name already exists");
}else{
    $oldImage=filterRequest("old_image");
    deleteFile("../../upload/products",$oldImage);
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
    updateData("products",$data,"products_id=$productsId");
}