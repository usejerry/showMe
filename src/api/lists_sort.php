<?php
include 'conn.php';

$sort = isset($_GET['sort']) ? $_GET['sort'] : '';

$g_img = isset($_GET['g_img']) ? $_GET['g_img'] : '   ';
$original_p = isset($_GET['original_p']) ? $_GET['original_p'] : '';
$now_p = isset($_GET['now_p']) ? $_GET['now_p'] : '';
$title = isset($_GET['title']) ? $_GET['title'] : '';
$magges = isset($_GET['magges']) ? $_GET['magges'] : '';
$color=isset($_GET['color']) ? $_GET['color'] : '';
$storeName=isset($_GET['storeName']) ? $_GET['storeName'] : '';
$goods_num=isset($_GET['goods_num']) ? $_GET['goods_num'] : '';
$time=isset($_GET['time']) ? $_GET['time'] : '';

$cid = isset($_GET['cid']) ? $_GET['cid'] : '2';
$g_type=isset($_GET['g_type']) ? $_GET['g_type'] : '';

$u_phone=isset($_GET['u_phone']) ? $_GET['u_phone'] : '';
$tui_num=$cid + 1;
// echo $cid;
if($sort=="desc"){
$select_price="select * from zol_goods ORDER BY now_price DESC";
}else{
$select_price="select * from zol_goods ORDER BY now_price asc";
}
$select_coupon="SELECT * FROM zol_goods ORDER BY price_coupon ASC";

$select_xiao="SELECT * from zol_goods LIMIT 0,5";

$select_id="SELECT  * from zol_goods WHERE id=$cid";//根据id
$select_type="SELECT  * from zol_goods WHERE g_type='$g_type'";//查询商品类型

$select_saleNum="SELECT * FROM zol_goods ORDER BY original_price DESC";

$select_reco="select * from zol_goods LIMIT $cid,$tui_num";
$insert_c="INSERT into zol_order (original_price,title,now_price,magges,buy_time,color,storeName,images,c_id,sale_num,u_phone) VALUES($original_p,'$title',$now_p,'$magges','$time','$color','$storeName','$g_img',$cid,$goods_num,$u_phone)";


$desc_res = $conn->query($select_price);//价格排序

$desc_res2 = $conn->query($select_saleNum);//销量排序

$desc_res3 = $conn->query($select_coupon);//销量排序
$desc_res4 = $conn->query($select_xiao);//小萝卜
$desc_res5 = $conn->query($select_id);//查id
$desc_res7 = $conn->query($insert_c);
$desc_res6 = $conn->query($select_reco);//推荐商品
$desc_res8 = $conn->query($select_type);//商品类型



$content = $desc_res->fetch_all(MYSQLI_ASSOC);
$content2 = $desc_res2->fetch_all(MYSQLI_ASSOC);
$content3 = $desc_res3->fetch_all(MYSQLI_ASSOC);
$content4 = $desc_res4->fetch_all(MYSQLI_ASSOC);
$content5 = $desc_res5->fetch_all(MYSQLI_ASSOC);
$content6 = $desc_res6->fetch_all(MYSQLI_ASSOC);
$content8 = $desc_res8->fetch_all(MYSQLI_ASSOC);

$data=array(
      "content"=>$content,
      "content2"=>$content2,
      "content3"=>$content3,
      "content4"=>$content4,
      "content5"=>$content5,
      "content6"=>$content6,
      "content8"=>$content8,
      "ok"=>$desc_res7,
      "to"=>$tui_num
);
echo json_encode($data,JSON_UNESCAPED_UNICODE);
?>