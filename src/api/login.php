<?php
  
  include 'conn.php';
  $user_pass=isset($_GET['user_pass'])? $_GET['user_pass']:'';
  $user_phone=isset($_GET['user_phone'])? $_GET['user_phone']:'';


  $select_sql="select user_name FROM zol_users WHERE user_phone='$user_phone' AND user_password='$user_pass'"; 
  $select_res=$conn->query($select_sql);

  $content =  $select_res->fetch_all(MYSQLI_ASSOC);
  
  echo json_encode($content,JSON_UNESCAPED_UNICODE);
?>