<?php
include 'conn.php';
$user_name = isset($_GET['user_name']) ? $_GET['user_name'] : ''; 


$select_sql="select * from zol_users where user_name='$user_name'";
$desc_res = $conn->query($select_sql);
$content = $desc_res->fetch_all(MYSQLI_ASSOC);//获取名字

// echo json_encode($content,JSON_UNESCAPED_UNICODE);
$user_id=$content[0]['id'];//获取id

$mes_content=isset($_GET['mes_content']) ? $_GET['mes_content'] : ''; 

$mes_num=isset($_GET['mes_num']) ? $_GET['mes_num'] : ''; 
$mes_time=isset($_GET['mes_time']) ? $_GET['mes_time'] : ''; 

if($user_id){
$insert_sql="INSERT into zol_mes (m_content,xingxing,u_id,m_time,u_name) VALUES('$mes_content',$mes_num,'$user_id','$mes_time','$user_name')"; 
$desc_res2 = $conn->query($insert_sql);
}

?>