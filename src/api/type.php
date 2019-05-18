<?php
include 'conn.php';
$g_type=isset($_GET['g_type']) ? $_GET['g_type'] : '';
$sort = isset($_GET['sort']) ? $_GET['sort'] : '';

if($g_type == ''){
   $select_type="SELECT  * from zol_goods";
}else{
    $select_type="SELECT  * from zol_goods WHERE g_type='$g_type'";//查询商品类型
};


//价格排序
if($sort=="desc"){
    $select_price="select * from zol_goods where g_type='$g_type' ORDER BY now_price DESC";
    $select_coupon="select * from zol_goods where g_type='$g_type' ORDER BY price_coupon DESC";
    $select_all_coupon="select * from zol_goods ORDER BY price_coupon DESC";//全部商品销量降序
    $select_all_price="select * from zol_goods  ORDER BY now_price DESC";//全部商品价格降序
}else{
    $select_price="select * from zol_goods where g_type='$g_type' ORDER BY now_price asc";
    $select_coupon="select * from zol_goods where g_type='$g_type' ORDER BY price_coupon  asc";
    $select_all_price="select * from zol_goods  ORDER BY now_price asc";//全部商品价格降序
    $select_all_coupon="select * from zol_goods  ORDER BY price_coupon  asc";//全部商品价格降序
};



$desc_res = $conn->query($select_type);//商品类型
$desc_res2 = $conn->query($select_price);
$desc_res3 = $conn->query($select_coupon);
$desc_res4 = $conn->query($select_all_price);//全部商品价格
$desc_res5 = $conn->query($select_all_coupon);//全部商品销量


$content = $desc_res->fetch_all(MYSQLI_ASSOC);
$content2 = $desc_res2->fetch_all(MYSQLI_ASSOC);
$content3 = $desc_res3->fetch_all(MYSQLI_ASSOC);
$content4 = $desc_res4->fetch_all(MYSQLI_ASSOC);
$content5 = $desc_res5->fetch_all(MYSQLI_ASSOC);





$data=array(
    "content"=>$content,
    "content2"=>$content2,
    "content3"=>$content3,
    "content4"=>$content4,
    "content5"=>$content5,

);
echo json_encode($data,JSON_UNESCAPED_UNICODE);
?>