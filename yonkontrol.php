<?php
//error_reporting(0);

$baglanti = mysqli_connect("localhost","root","","2018469043"); 
if($baglanti){ 

	if(isset($_POST)){ 

		if($_POST["id"] == "" or $_POST["eposta"] == "" or $_POST["sifre"] == "" or $_POST["kullaniciad"] == "" or $_POST["kullanicisoyad"] == "" or $_POST["avatar"] == ""){ 
			echo "Boş veri girişi";
		} else {

			
			$id = strip_tags(trim($_POST["id"]));
			$eposta= strip_tags(trim($_POST["eposta"]));
			$sifre= strip_tags(trim($_POST["sifre"]));
			$kullaniciad = strip_tags(trim($_POST["kullaniciad"]));
			$kullanicisoyad= strip_tags(trim($_POST["kullanicisoyad"]));
			$avatar = strip_tags(trim($_POST["avatar"]));

			
			$sorgu = mysqli_query($baglanti,"INSERT INTO kullanici (id,eposta,sifre,kullaniciad,kullanicisoyad,avatar) VALUES ('".$id."','".$eposta."','".$sifre."','".$kullaniciad."','".$kullanicisoyad."','".$avatar."')");
			if($sorgu == TRUE){ 

				echo "Kayıt Başarıyla Eklendi";

				

			} else {
				echo "Kayıt hatası...";
			}

		}

		mysqli_close($baglanti);

	} else {
		echo "Post işlemi yaparken bir hata oldu...";
	}
} else {

	die("Veritabanı bağlantısı hatalı...");

}

?>