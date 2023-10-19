<?php 
include "../../connect.php";
$categoriesId = filterRequest("categories_id");
$imageName=filterRequest("image_name");
deleteFile("../../upload/categories",$imageName);
deleteData("categories","categories_id=$categoriesId");