<?php
$baglanti=mysqli_connect("localhost","root","","2018469043");
if($baglanti){

			
			$res=mysqli_query($baglanti,"SELECT COUNT(MUSTERİ_ID) AS sayi FROM musteri̇ler");
			$row=mysqli_fetch_assoc($res);
			$sum=$row['sayi'];
			echo $sum;


			mysqli_close($baglanti);
		}else{
			die("Veriler gelmedi");
		}
?>