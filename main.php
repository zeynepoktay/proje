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
	border-radius:30px;
}
.araclar {
	margin-left:25px;
	margin-top:25px;
	font-size:30px;
	text-decoration:none;
	
}
.sidebar .araclar a{
	font-style:italic;
	font-family: sans-serif;
	font-size:25px;
	text-decoration:none;
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

#siparisChart{
	width:750px;
	margin-left:25px;
	margin-top:50px;
	
}
.sidebar .search i{
	margin-top:23px;
	margin-left:4px;
	color:#c6e2ff;
}
#piechart{
	margin-top:65px;
	margin-left:40px;
	width: 500px;
	height: 300px;
	
}
#box1{
	width:250px;
	height:150px;
	margin-top:500px;
	margin-left:0px;
	display:flex;
	flex-direction:column;
	color:#c6e2ff;
	background-color:#367fa9;
	align-items:center;
	border-radius:10px;
	padding-top:90px;
}
#box2{
	width:250px;
	height:150px;
	margin-top:50px;
	display:flex;
	flex-direction:column;
	color:#c6e2ff;
	background-color:#367fa9;
	align-items:center;
	border-radius:10px;
	padding-top:100px;
	
}
#box3{
	width:250px;
	height:150px;
	margin-top:50px;
	display:flex;
	flex-direction:column;
	color:#c6e2ff;
	background-color:#367fa9;
	align-items:center;
	border-radius:10px;
	padding-top:100px;

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

<div class="header"></div>
<?php
$baglanti = mysqli_connect("localhost","root","","2018469043");
$ay_sorgu = mysqli_query($baglanti,"SELECT musteri̇ler.İL_ID FROM musteri̇ler");
$kar_sorgu = mysqli_query($baglanti,"SELECT musteri̇ler.İL_ID,COUNT(si̇pari̇s.SİPARİS_ID)as kar FROM musteri̇ler,si̇pari̇s WHERE musteri̇ler.MUSTERİ_ID=si̇pari̇s.MUSTERİ_ID GROUP BY musteri̇ler.İL_ID");
?>


<div class="chart">
	<canvas id="siparisChart" ></canvas>
	
	<script>
					var miktar=[5,10,20,25,30,35,40,45,50,55,15,60];
					var miktar=[<?php while($sonuc2=mysqli_fetch_assoc($kar_sorgu)){echo '"' . $sonuc2['kar'] . '",';}?>];
					
					
					
					var aylar=["Ocak","Şubat","Mart","Nisan","Mayıs","Haziran","Temmuz","Ağustos","Eylül","Ekim","Kasım","Aralık"];
					var aylar=[<?php while($sonuc=mysqli_fetch_assoc($ay_sorgu)){echo '"' . $sonuc['İL_ID'] . '",';}?>];
		
					var kanvas = document.getElementById('siparisChart').getContext('2d');
					var chart = new Chart(kanvas, {
						type: "bar",
						data: { 
							labels: aylar,
							datasets: [{
								label: 'İLLERE GÖRE SİPARİŞ MİKTARI',
								backgroundColor: "rgb(52,58,64)",		
								borderColor: "rgb(52,58,64)",
								data: miktar,
							
				}]
			},
			options: {
				legend:{
					labels: {
						fontColor:'rgb(52,58,64)'
					}
				},
				scales: {
					yAxes: [{
						ticks:{
							fontColor:"rgb(52,58,64)",
							beginAtZero: true,							
						}
					}],
					xAxes:[{
						ticks:{
							fontColor:"rgb(52,58,64)"
						}
					}]
				}
			}
		});
	</script>
	</div>
<div id="piechart" ></div>
</div>
	   
	   
<script>
	   google.charts.load('current', {'packages':['corechart']});
       google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['İL AD', 'SİPARİŞ SAYISI'],
          ['İSTANBUL', 9],
          ['İZMİR',  18],
          ['MUĞLA',  10]
        ]);

        var options = {
          title: 'İLK 3 SIRADAKİ İLLER',
		  backgroundColor:'#c6e2ff'
		  
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
</script>
<div class="boxes">
<div id="box1" class="box">İZMİR TOPLAM KAZANÇ</div>
<div id="box2" class="box">MUĞLA TOPLAM KAZANÇ</div>
<div id="box3" class="box">İSTANBUL TOPLAM KAZANÇ</div>
</div>
<script>
$(document).ready(function(){
	$.post("getiril.php",
	function(data,status){
		//console.log("sonuç:"+data);
		$("#box1").html("İZMİR TOPLAM KAZANÇ:"+data);
	});
});
$(document).ready(function(){
	$.post("getirilmu.php",
	function(data,status){
		//console.log("sonuç:"+data);
		$("#box2").html("MUĞLA TOPLAM KAZANÇ:"+data);
	});
});
$(document).ready(function(){
	$.post("getirilis.php",
	function(data,status){
		//console.log("sonuç:"+data);
		$("#box3").html("İSTANBUL TOPLAM KAZANÇ:"+data);
	});
});



</script>
	
	




</div>
</body>




</html>
