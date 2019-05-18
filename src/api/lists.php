<?php
 include 'conn.php';
 //接收参数
 $page = isset($_GET['page']) ? $_GET['page'] : '1';//第几页
 $num = isset($_GET['num']) ? $_GET['num'] : '3';//每页多少条
 
 $index = $page * $num;
 $select_sql_2 = 'SELECT * FROM zol_goods';
	//2.执行语句
 $select_sql_1="select * from zol_goods LIMIT 0,$index";
 //执行语句
 $res_2 = $conn->query($select_sql_2);
 $res_1 = $conn->query($select_sql_1);
 $content = $res_1->fetch_all(MYSQLI_ASSOC);
 $data = array(
    'total' => $res_2->num_rows,//总条数
    'goodslist' => $content,
    'page' => $page,
    'num' => $num
);
//  var_dump($content1);
 echo json_encode($data,JSON_UNESCAPED_UNICODE);
?>