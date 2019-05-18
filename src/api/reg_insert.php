<?php
  include 'conn.php';
$user_phone=isset($_POST['user_phone'])? $_POST['user_phone']:'';
$user_name=isset($_POST['user_name'])? $_POST['user_name']:'';
$password=isset($_POST['password'])? $_POST['password']:'';


$inset_sql="INSERT INTO zol_users (user_name,user_password,user_phone) VALUES('$user_name','$password','$user_phone')";

$inset_res=$conn->query($inset_sql);
// echo $inset_res;
echo $user_name;
?>