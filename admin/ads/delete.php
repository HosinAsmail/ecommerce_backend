<?php 
include "../../connect.php";
$adsId = filterRequest("ads_id");
deleteData("ads","ads_id=$adsId");