<?php 
include "connect.php";
$allData = array();
$categories = getData("categories", null, null, false);
$topSellingJSON = getData("topselling", "1=1 ORDER BY counttimes DESC", null, false);
$sqlOffer = "SELECT productsview.*,(products_price - (products_price*products_discount/100)) as products_price_discount FROM productsview  
WHERE products_discount != 0 LIMIT 3";
$stmt = $con->prepare($sqlOffer);
$stmt->execute();
$offers = $stmt->fetchAll(PDO::FETCH_ASSOC);
$ads = getData("ads", null, null, false);
$allData["status"] = "success";
$allData["categories"] = $categories;
$allData["offers"] = $offers;
$allData["ads"] = $ads;
if(is_string($topSellingJSON)){
// Decode the JSON string from the database into an associative array
    $topSelling = json_decode($topSellingJSON, true);
    if ($topSelling["status"] === "failure") {
        $sqlTopSelling = "SELECT productsview.*,(products_price - (products_price*products_discount/100)) as products_price_discount FROM productsview  
        LIMIT 3";
        $stmtTopSelling = $con->prepare($sqlTopSelling);
        $stmtTopSelling->execute();
        $topSelling = $stmtTopSelling->fetchAll(PDO::FETCH_ASSOC);
        $allData["topSelling"] = $topSelling;
    }
}else{
    $allData["topSelling"] = $topSellingJSON;

}
echo json_encode($allData);
?>
