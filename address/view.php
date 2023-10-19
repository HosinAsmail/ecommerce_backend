<?php 
include "../connect.php";
$users_id = filterRequest("users_id");

getData("address","address_usersid=$users_id");