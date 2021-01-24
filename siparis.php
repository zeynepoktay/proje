<?php
setcookie('cookie_name','cookie_value',['samesite' => 'None']);
session_start();
?>



<!DOCTYPE html>
<html>
<head>
<title>WUWU COLLECTİON</title>
<meta charset="utf-8">
<link href="mainstyle.css" rel="sylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
body{
	display:flex;
	background-color:#c6e2ff;
}
.sidebar{
	width:20%;
	height:1000px;
	background-color:#363636;
	display:flex;
	flex-direction:column;
	border-radius:10px;
}
.sidebar #sidebartop{
	width:100%;
	height:75px;
	background-color:#367fa9;
	color:#c6e2ff;
	display:flex;
	align-items:center;
	justify-content:center;
	border-radius:10px;
}
#avatar{
	width:55px;
	margin-left:15px;
	margin-top:15px;
}
.araclar{
	margin-left:25px;
	margin-top:25px;
	font-size:30px;
	color:#c6e2ff;
}
#dash{
	margin-bottom:25px;
	font-color:#c6e2ff;
}
#yonet{
	margin-bottom:25px;
}
#sip{
	margin-bottom:25px;
}
#graf{
	margin-bottom:25px;
}

.search{
	margin-left:20px;
	margin-top:20px;
}
.infoname{
	margin-left:20px;
	font-size:22px;
	color:#c6e2ff;
}
.boxes{
	display:flex;
}
.box{
	width:250px;
	height:200px;
	display:flex;
	flex-direction:column;
	color:#c6e2ff;
	background-color:#367fa9;
	margin-top:140px;
	margin-left:45px;
	align-items:center;
	border-radius:10px;
	box-shadow:20px 20px 10px grey;
	font-size:25px;
	padding-top:150px;
}
#box3{
	padding-left:15px;
	
}
.sidebar .search i{
	margin-top:23px;
	margin-left:4px;
	color:#c6e2ff;
}
.sidebar .araclar a{
	font-style:italic;
	font-family: sans-serif;
	font-size:25px;
	text-decoration:none;
	color:#c6e2ff;
}


</style>






</head>
<body>
<div class="sidebar">
<div id="sidebartop">WUWU COLLECTİON</div>
<div class="info">
	<img id="avatar" src="<?php echo $_SESSION['resim'] ?>">
	<div class="infog">
		<span class="infoname">ZEYNEP <?php echo $_SESSION['soyad']?>
		 </span>
	</div>
</div>

<div class="search">
	<input class="arama" type="text">
	<span>
	<a href="ara.php"><i class="fa fa-search" aria-hidden="true"></i></a>
	</span>
</div>
<div class="araclar">
<div id="dash"><a href="main.php">DASHBOARD</a></div>

<div id="sip"><a href="siparis.php">SİPARİŞ</a></div>
<div id="graf"><a href="grafik.php">ŞUBELER</a></div>
<div id="yonet"><a href="yonekle.php">YÖNETİCİ EKLEME</a></div>
<div id="yg"><a href="index.php">YÖNETİCİ GİRİŞ</a></div>
</div>
</div>
<div class="content">






<div class="boxes">
<div id="box1"class="box">SİPARİŞ SAYISI</div>
<div id="box2"class="box">MÜŞTERİ SAYISI</div>
<div id="box3"class="box">TOPLAM SİPARİŞ KAZANÇ</div>
<div id="box4"class="box">AKTİF SİPARİŞLİ İL</div>

</div>
</div>
<script>
$(document).ready(function(){
	$.post("getirsiparis.php",
	function(data,status){
		//console.log("sonuç:"+data);
		$("#box1").html("SİPARİŞ SAYISI:"+data);
	});
});

$(document).ready(function(){
	$.post("getirmusteri.php",
	function(data,status){
		console.log("sonuç:"+data);
		$("#box2").html("MÜŞTERİ SAYISI:"+data);
	});
});
$(document).ready(function(){
	$.post("getirkazanc.php",
	function(data,status){
		console.log("sonuç:"+data);
		$("#box3").html("TOPLAM KAZANÇ:"+data);
	});
});
$(document).ready(function(){
	$.post("aktif.php",
	function(data,status){
		console.log("sonuç:"+data);
		$("#box4").html("AKTİF ŞUBE SAYISI:"+data);
	});
});
</script
</body>