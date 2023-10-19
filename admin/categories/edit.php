<?php 
include "../../connect.php";
$categoriesId = filterRequest("categories_id");
$name = filterRequest("name");
$nameAr = filterRequest("name_ar"); // now it is more secure 
$imageName=imageUpload("../../upload/categories","files");
if($imageName=="empty"){
    $data =array(
        "categories_name"=>$name,
        "categories_name_ar"=>$nameAr,
    );
    updateData("categories",$data,"categories_id=$categoriesId");
}else if($imageName=="fileName"){
    header('Content-Type: application/json');
    printMessage("failure","the image name already exists");
}else{
    $oldImage=filterRequest("old_image");
    deleteFile("../../upload/categories",$oldImage);
    $data =array(
        "categories_name"=>$name,
        "categories_name_ar"=>$nameAr,
        "categories_image"=>$imageName,
    );
    updateData("categories",$data,"categories_id=$categoriesId");
}

/*
<?php 
include "../../connect.php";
$categoriesId = filterRequest("categories_id");
$name = filterRequest("name");
$nameAr = filterRequest("name_ar"); // now it is more secure 
$imageName=imageUpload("../../upload/categories","files");
if($imageName=="empty"){
    $data =array(
        "categories_name"=>$name,
        "categories_name_ar"=>$nameAr,
    );
}else{
    $oldImage=filterRequest("old_image");
    deleteFile("../../upload/categories",$oldImage);
    $data =array(
        "categories_name"=>$name,
        "categories_name_ar"=>$nameAr,
        "categories_image"=>$imageName,
    );
}
updateData("categories",$data,"categories_id=$categoriesId");
*/