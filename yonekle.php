<?php
setcookie('cookie_name','cookie_value',['samesite' => 'None']);
session_start();
?>



<!DOCTYPE html>
<html>
<head>
	<title>YÖNETİCİ EKLEME</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
	<script>
		$(document).ready(function(){

			$("#button-islem").click(function(){ 
				$.ajax({
					type: "POST", 
					url: "yonkontrol.php", 
					data: $('#form-islem').serialize(), 
					success: function(sonuc){
						$("#sonuc").show().html(sonuc); 
						$("#form-islem")[0].reset(); 
					}
				});
			});

		});
	</script>

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
}
.sidebar #sidebartop{
	width:100%;
	height:75px;
	background-color:#367fa9;
	color:#c6e2ff;
	display:flex;
	align-items:center;
	justify-content:center;
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
.content{
	font-family: arial;
	font-size: 20px;
	background-color:#c6e2ff;
	margin-left:200px;
	margin-top:35px;
		}
.genel{
	margin: 60px auto;
	width: 500px;
		}
.baslik{
	padding: 25px;
	font-weight: bold;
		}
.input{
	padding: 10px;
	border: 1px dashed #8b6580;
	outline: none;
	font-family: arial;
	width: 100%;
	box-sizing: border-box;
	margin-bottom: 10px;
	margin-top: 3px;
		}
.button{
	margin-left:425px;
	margin-top:20px;
	padding: 10px;
	font-size: 18px;
	font-weight: bold;
	font-family: arial;
	cursor: pointer;
	color:white;
	background-color:black;
		}
.sonuc{
	width: 100%;
	box-sizing: border-box;
	background-color: #c6e2ff;
	color: #8b658b;
	font-size: 27px;
	padding: 15px;
	margin-top: 25px;
	text-align: center;
		}
	.sidebar .araclar a{
	font-style:italic;
	font-family: sans-serif;
	font-size:25px;
	text-decoration:none;
	color:#c6e2ff;
}
.sidebar .search i{
	margin-top:23px;
	margin-left:4px;
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
	<div class="genel">
		<form id="form-islem" method="POST">
			<div class="baslik">YÖNETİCİ EKLEME</div>
			ID:<br><input type="text" class="input" name="id">
			<br>
			E-POSTA:<br><input type="text" class="input" name="eposta">
			<br>
			<br>
			ŞİFRE:<br><input type="text" class="input" name="sifre">
			<br>
			YÖNETİCİ AD:<br><input type="text" class="input" name="kullaniciad">
			<br>
			<br>
			YÖNETİCİ SOYAD:<br><input type="text" class="input" name="kullanicisoyad">
			<br>
			FOTOĞRAF:<br><input type="text" class="input" name="avatar">
			<br>
			<input type="button" class="button" id="button-islem" value="EKLE">

			<div id="sonuc" class="sonuc" hidden=""></div> 
		</form>
	</div>
</div>
</body>
</html>