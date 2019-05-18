<?php
  include 'conn.php';
  $user_phone=isset($_GET['user_phone'])? $_GET['user_phone']:'';
  
  // echo $user_phone;
  $select_sql="SELECT * from zol_users WHERE user_phone='$user_phone'";
  $select_res=$conn->query($select_sql);
  if($select_res->num_rows==1){
    echo 1;
  }else{
    echo 0;
  };
?>