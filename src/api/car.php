<?php
 include 'conn.php';
 $storeName = isset($_GET['storeName']) ? $_GET['storeName'] : ''; 
 $c_id = isset($_GET['c_id']) ? $_GET['c_id'] : ''; 
$u_phone=isset($_GET['u_phone']) ? $_GET['u_phone'] : ''; 
 

 $select_car="select * from zol_order where u_phone=$u_phone";

$select_st="select * from zol_order WHERE storeName='$storeName' and u_phone=$u_phone";

$delete_g="DELETE from zol_order WHERE c_id=$c_id";//删除

// $updata_num="UPDATE zol_order SET sale_num=13 WHERE id=74;";

 $desc_res = $conn->query($select_car);
 $desc_res2 = $conn->query($select_st);//根据店名
 $desc_res3 = $conn->query($delete_g);//删除

 $content = $desc_res->fetch_all(MYSQLI_ASSOC);
 $content2 = $desc_res2->fetch_all(MYSQLI_ASSOC);
 $data=array(
    "content"=>$content,
    "content2"=>$content2,
    "content3"=>$desc_res3
);
echo json_encode($data,JSON_UNESCAPED_UNICODE); 
?>