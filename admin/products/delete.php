<?php 
include "../../connect.php";
$productsId = filterRequest("products_id");
$imageName=filterRequest("image_name");
deleteFile("../../upload/products",$imageName);
deleteData("products","products_id=$productsId");