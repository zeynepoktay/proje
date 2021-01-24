<!DOCTYPE html>
<html>
<head>
<title>WUWU COLLECTİON</title>
<meta charset="utf-8">
<link href="style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#giris").click(function(){
		
		
		
		$.post("kontrol.php",
		{
			eposta:$("#eposta").val(),
			sifre:$("#sifre").val()
		},
		function(data,status){
			if(data==1){
				$(location).attr("href","main.php");
			}else{
				alert("kullanıcı adı veya şifre yanlış");
			}
		}
		);
	});
});
</script>
</head>
<body>
<div class="yonetici">
<label class="adminlabel"> YÖNETİCİ GİRİŞİ </label>
<div class="girisekrani">
<br><label class="girisyazi">SİSTEME GİRİŞ İÇİN ALANLARI DOLDURUNUZ</label>
<br><label class="kul">KULLANICI MAİL:</label>
<input type="email" id="eposta" placeholder="eposta">
<br><label class="ksifre">KULLANICI ŞİFRE:</label>
<input type="password" id="sifre" placeholder="sifre">
<br><button id="giris"> GİRİŞ</button>

<br><a href=""><label>Beni Hatırla</label></a>
</div>
</div>
</body>
</html>