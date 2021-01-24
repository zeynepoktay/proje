<?php
$baglanti=mysqli_connect("localhost","root","","2018469043");
if($baglanti){

			
			$res=mysqli_query($baglanti,"SELECT musteri̇ler.İL_ID,SUM(si̇pari̇s.toplam) AS toplam FROM musteri̇ler,si̇pari̇s WHERE musteri̇ler.MUSTERİ_ID=si̇pari̇s.MUSTERİ_ID AND musteri̇ler.İL_ID=48");
			$row=mysqli_fetch_assoc($res);
			$sum=$row['toplam'];
			echo $sum;


			mysqli_close($baglanti);
		}else{
			die("Veriler gelmedi");
		}
?>