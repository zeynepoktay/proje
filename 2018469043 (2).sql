-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 24 Oca 2021, 15:56:16
-- Sunucu sürümü: 8.0.18
-- PHP Sürümü: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `2018469043`
--

DELIMITER $$
--
-- Yordamlar
--
DROP PROCEDURE IF EXISTS `1.soru`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `1.soru` ()  NO SQL
SELECT *
FROM si̇pari̇s
WHERE SİPARİS_TARİH=(SELECT MAX(SİPARİS_TARİH)FROM si̇pari̇s)$$

DROP PROCEDURE IF EXISTS `10.soru`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `10.soru` (IN `İSİM` VARCHAR(250))  NO SQL
SELECT musteri̇ler.MUSTERİ_AD,si̇pari̇s.SİPARİS_ID
FROM musteri̇ler LEFT JOIN si̇pari̇s ON si̇pari̇s.MUSTERİ_ID=musteri̇ler.MUSTERİ_ID 
WHERE musteri̇ler.MUSTERİ_AD LIKE CONCAT('%',İSİM,'%')
ORDER BY si̇pari̇s.SİPARİS_ID$$

DROP PROCEDURE IF EXISTS `2.soru`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `2.soru` ()  NO SQL
SELECT sube.SUBE_AD, COUNT(urunler.URUN_ID)as urun_sayisi
FROM sube_urun,sube,urunler
WHERE sube_urun.URUN_ID=urunler.URUN_ID
AND
sube_urun.SUBE_ID=sube.SUBE_ID
GROUP BY sube.SUBE_ID
ORDER BY urun_sayisi$$

DROP PROCEDURE IF EXISTS `3.soru`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `3.soru` ()  NO SQL
SELECT i̇ller.İL_ID as siparissiz
FROM i̇ller LEFT JOIN musteri̇ler ON i̇ller.İL_ID=musteri̇ler.İL_ID 
LEFT JOIN si̇pari̇s ON si̇pari̇s.MUSTERİ_ID=musteri̇ler.MUSTERİ_ID 
WHERE musteri̇ler.İL_ID IS NULL$$

DROP PROCEDURE IF EXISTS `4.soru`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `4.soru` ()  NO SQL
SELECT*
FROM urunler
WHERE urunler.fiyat BETWEEN 50 AND 100$$

DROP PROCEDURE IF EXISTS `5.soru`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `5.soru` ()  NO SQL
SELECT i̇ller.İL_AD, COUNT(musteri̇ler.MUSTERİ_ID)as musteri_sayisi
FROM i̇ller, musteri̇ler
WHERE musteri̇ler.İL_ID=i̇ller.İL_ID
GROUP BY i̇ller.İL_AD$$

DROP PROCEDURE IF EXISTS `6.soru`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `6.soru` (IN `İSİM` VARCHAR(250))  NO SQL
SELECT i̇ller.İL_ID, COUNT(sube.SUBE_ID)AS SUBE_SAYİ
FROM i̇ller,sube
WHERE i̇ller.İL_ID=sube.İL_ID AND
i̇ller.İL_AD=İSİM$$

DROP PROCEDURE IF EXISTS `7.soru`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `7.soru` (IN `isim` VARCHAR(250))  NO SQL
SELECT CONCAT(musteri̇ler.MUSTERİ_AD,"",musteri̇ler.MUSTERİ_SOYAD)AS AD,COUNT(si̇pari̇s.SİPARİS_ID)AS SİPARİS_SAYİSİ
FROM si̇pari̇s,musteri̇ler
WHERE si̇pari̇s.MUSTERİ_ID=musteri̇ler.MUSTERİ_ID 
LIKE CONCAT('%',İSİM,'%')
GROUP BY musteri̇ler.MUSTERİ_AD
ORDER BY SİPARİS_SAYİSİ$$

DROP PROCEDURE IF EXISTS `8.soru`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `8.soru` (IN `isim` VARCHAR(250))  NO SQL
SELECT sube.SUBE_AD as sube_adi,urunler.URUN_AD as urun_adi
FROM sube_urun,sube,urunler
WHERE urunler.URUN_ID=sube_urun.URUN_ID
AND
sube.SUBE_ID=sube_urun.SUBE_ID
AND sube.SUBE_AD LIKE CONCAT('%',isim,'%')
ORDER by urun_adi$$

DROP PROCEDURE IF EXISTS `9.soru`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `9.soru` (IN `isim` VARCHAR(250))  NO SQL
SELECT sube.SUBE_AD, MAX(urunler.FİYAT)as en_pahali
FROM sube LEFT JOIN sube_urun ON sube.SUBE_ID=sube_urun.SUBE_ID LEFT JOIN urunler ON urunler.URUN_ID=sube_urun.URUN_ID
WHERE sube.SUBE_AD LIKE CONCAT('%',isim,'%')$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `apartmanlar`
--

DROP TABLE IF EXISTS `apartmanlar`;
CREATE TABLE IF NOT EXISTS `apartmanlar` (
  `APARTMAN_ID` int(250) NOT NULL,
  PRIMARY KEY (`APARTMAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `apartmanlar`
--

INSERT INTO `apartmanlar` (`APARTMAN_ID`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(62);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `i̇lceler`
--

DROP TABLE IF EXISTS `i̇lceler`;
CREATE TABLE IF NOT EXISTS `i̇lceler` (
  `İLCE_ID` int(250) NOT NULL,
  `İLCE_AD` varchar(250) NOT NULL,
  `İL_ID` int(2) NOT NULL,
  PRIMARY KEY (`İLCE_ID`),
  KEY `İL_ID` (`İL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `i̇lceler`
--

INSERT INTO `i̇lceler` (`İLCE_ID`, `İLCE_AD`, `İL_ID`) VALUES
(1, 'ŞİŞLİ', 34),
(2, 'BEŞİKTAŞ', 34),
(3, 'KAĞITHANE', 34),
(4, 'BEYOĞLU', 34),
(5, 'LEVENT', 34),
(6, 'MECİDİYEKÖY', 34),
(7, 'OKMEYDANI', 34),
(8, 'MALTEPE', 34),
(9, 'KADIKÖY', 34),
(10, 'KUŞADASI', 9),
(11, 'EFELER', 9),
(12, 'NAZİLLİ', 9),
(13, 'SÖKE', 9),
(14, 'BUCA', 35),
(15, 'BORNOVA', 35),
(16, 'BAYRAKLI', 35),
(17, 'EFES', 35),
(18, 'ATAŞEHİR', 34),
(19, 'ALAÇATI', 35),
(20, 'DİDİM', 9),
(22, 'başmakçı', 3),
(23, 'çobanlar', 3),
(24, '', 3),
(25, 'Bolvadin ', 3),
(26, 'dalaman', 48),
(27, 'fethiye ', 48),
(28, 'kavaklıdere', 48),
(29, 'ÇAMLIDERE', 6),
(30, 'ÇANKAYA', 6),
(31, 'ÇUBUK', 6),
(32, 'SİNCAN', 6),
(33, 'AKSEKİ', 7),
(34, 'AKSU', 7),
(35, 'HOPA', 8),
(36, 'KEMALPAŞA', 8),
(37, 'BORÇKA', 8),
(38, 'ŞAVŞAT', 8),
(39, 'nilüfer', 16);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `i̇ller`
--

DROP TABLE IF EXISTS `i̇ller`;
CREATE TABLE IF NOT EXISTS `i̇ller` (
  `İL_ID` int(2) NOT NULL,
  `İL_AD` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`İL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `i̇ller`
--

INSERT INTO `i̇ller` (`İL_ID`, `İL_AD`) VALUES
(1, 'ADANA'),
(2, 'ADIYAMAN'),
(3, 'AFYON'),
(4, 'AĞRI'),
(5, 'AMASYA'),
(6, 'ANKARA'),
(7, 'ANTALYA'),
(8, 'ARTVİN'),
(9, 'AYDIN'),
(10, 'BALIKESİR'),
(11, 'BİLECİK'),
(12, 'BİNGÖL'),
(13, 'BİTLİS'),
(14, 'BOLU'),
(15, 'BURDUR'),
(16, 'BURSA'),
(17, 'ÇANAKKALE'),
(18, 'ÇANKIRI'),
(19, 'ÇORUM'),
(20, 'DENİZLİ'),
(21, 'DİYARBAKIR'),
(22, 'EDİRNE'),
(23, 'ELAZIĞ'),
(24, 'ERZİNCAN'),
(25, 'ERZURUM'),
(26, 'ESKİŞEHİR'),
(27, 'GAZİANTEP'),
(28, 'GİRESUN'),
(29, 'GÜMÜŞHANE'),
(30, 'HAKKARİ'),
(31, 'HATAY'),
(32, 'ISPARTA'),
(33, 'MERSİN'),
(34, 'İSTANBUL'),
(35, 'İZMİR'),
(36, 'KARS'),
(37, 'KASTAMONU'),
(38, 'KAYSERİ'),
(39, 'KIRKLARELİ'),
(40, 'KIRŞEHİR'),
(41, 'KOCAELİ'),
(42, 'KONYA'),
(43, 'KÜTAHYA'),
(44, 'MALATYA'),
(45, 'MANİSA'),
(46, 'KAHRAMANMARAŞ'),
(47, 'MARDİN'),
(48, 'MUĞLA'),
(49, 'MUŞ'),
(50, 'NEVŞEHİR'),
(51, 'NİĞDE'),
(52, 'ORDU'),
(53, 'RİZE'),
(54, 'SAKARYA'),
(55, 'SAMSUN'),
(56, 'SİİRT'),
(57, 'SİNOP'),
(58, 'SİVAS'),
(59, 'TEKİRDAĞ'),
(60, 'TOKAT'),
(61, 'TRABZON'),
(62, 'TUNCELİ'),
(63, 'ŞANLIURFA'),
(64, 'UŞAK'),
(65, 'VAN'),
(66, 'YOZGAT'),
(67, 'ZONGULDAK'),
(68, 'AKSARAY'),
(69, 'BAYBURT'),
(70, 'KARAMAN'),
(71, 'KIRIKKALE'),
(72, 'BATMAN'),
(73, 'ŞIRNAK'),
(74, 'BARTIN'),
(75, 'ARDAHAN'),
(76, 'IĞDIR'),
(77, 'YALOVA'),
(78, 'KARABÜK'),
(79, 'KİLİS'),
(80, 'OSMANİYE'),
(81, 'DÜZCE');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori̇`
--

DROP TABLE IF EXISTS `kategori̇`;
CREATE TABLE IF NOT EXISTS `kategori̇` (
  `KATEGORİ_ID` int(50) NOT NULL,
  `KATEGORİ_AD` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`KATEGORİ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `kategori̇`
--

INSERT INTO `kategori̇` (`KATEGORİ_ID`, `KATEGORİ_AD`) VALUES
(1, 'ÇANTA'),
(2, 'AYAKKABI');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

DROP TABLE IF EXISTS `kullanici`;
CREATE TABLE IF NOT EXISTS `kullanici` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eposta` text COLLATE utf8_turkish_ci NOT NULL,
  `sifre` text COLLATE utf8_turkish_ci NOT NULL,
  `kullaniciad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `kullanicisoyad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`id`, `eposta`, `sifre`, `kullaniciad`, `kullanicisoyad`, `avatar`) VALUES
(1, 'zeynepokty99@outlook.com', '1234', 'ZEYNEP', 'OKTAY', 'img/avatar.jpg'),
(2, 'yaren1@outlook.com', '1235', 'yaren', 'güzeloğlu', 'img/avatar.png');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mahalleler`
--

DROP TABLE IF EXISTS `mahalleler`;
CREATE TABLE IF NOT EXISTS `mahalleler` (
  `MAHALLE_ID` int(250) NOT NULL,
  `MAHALLE_AD` varchar(250) NOT NULL,
  PRIMARY KEY (`MAHALLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `mahalleler`
--

INSERT INTO `mahalleler` (`MAHALLE_ID`, `MAHALLE_AD`) VALUES
(1, 'yaşarlı'),
(2, 'talatpaşa'),
(3, 'keçecipiri'),
(4, 'nalıncı bayırı'),
(5, 'CUMHURİYET'),
(6, 'ATATÜRK'),
(10, 'HÜRRİYET'),
(11, 'İSTİKLAL'),
(12, 'İNÖNÜ'),
(13, 'BARBAROS'),
(14, 'NAMIK KEMAL'),
(15, 'FATİH SULTAN MEHMET'),
(16, '19 MAYIS');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteri̇ler`
--

DROP TABLE IF EXISTS `musteri̇ler`;
CREATE TABLE IF NOT EXISTS `musteri̇ler` (
  `MUSTERİ_ID` int(50) NOT NULL,
  `MUSTERİ_AD` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `MUSTERİ_SOYAD` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `TCKİMLİK_NO` int(13) NOT NULL,
  `TELEFON` int(12) NOT NULL,
  `İL_ID` int(2) NOT NULL,
  `İLCE_ID` int(250) NOT NULL,
  `SOKAK_ID` int(250) NOT NULL,
  `MAHALLE_ID` int(250) NOT NULL,
  `DAİRE_NO` int(250) NOT NULL,
  `APARTMAN_ID` int(50) NOT NULL,
  PRIMARY KEY (`MUSTERİ_ID`),
  KEY `APARTMAN_ID` (`APARTMAN_ID`),
  KEY `MAHALLE_ID` (`MAHALLE_ID`),
  KEY `SOKAK_ID` (`SOKAK_ID`),
  KEY `İLCE_ID` (`İLCE_ID`),
  KEY `İL_ID` (`İL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `musteri̇ler`
--

INSERT INTO `musteri̇ler` (`MUSTERİ_ID`, `MUSTERİ_AD`, `MUSTERİ_SOYAD`, `TCKİMLİK_NO`, `TELEFON`, `İL_ID`, `İLCE_ID`, `SOKAK_ID`, `MAHALLE_ID`, `DAİRE_NO`, `APARTMAN_ID`) VALUES
(1, 'zeynep', 'oktay', 2145678912, 123456789, 34, 3, 9, 2, 3, 62),
(2, 'taha', 'duman', 1566598853, 1552658456, 8, 29, 5, 3, 5, 12),
(3, 'YAREN', 'GÜZELOĞLU', 2125456894, 1548569235, 9, 10, 2, 1, 11, 2),
(4, 'MEHMET ', 'ALTUNKAYA', 455896584, 456985695, 3, 22, 12, 5, 8, 17),
(5, 'AHMET', 'EREN', 152635365, 548587694, 35, 15, 1, 14, 23, 16),
(6, 'ayşe', 'yılmaz', 256548854, 45696584, 26, 31, 10, 14, 8, 4),
(7, 'hilal', 'yalçın', 154782354, 253354214, 6, 22, 10, 5, 4, 2),
(8, 'ebru', 'demir', 125478875, 455778875, 41, 23, 6, 6, 7, 15),
(9, 'batur', 'yılmaz', 257856874, 24574544, 48, 26, 12, 12, 13, 6),
(10, 'mert', 'güneş', 451545488, 145457875, 16, 39, 1, 12, 3, 15),
(11, 'cemal', 'algan', 454545455, 121545231, 45, 25, 10, 12, 14, 15),
(12, 'emine', 'kılıç', 254564646, 455654632, 61, 28, 1, 6, 13, 31);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `si̇pari̇s`
--

DROP TABLE IF EXISTS `si̇pari̇s`;
CREATE TABLE IF NOT EXISTS `si̇pari̇s` (
  `SİPARİS_ID` int(250) NOT NULL,
  `MUSTERİ_ID` int(50) NOT NULL,
  `SİPARİS_TARİH` date NOT NULL,
  `URUN_ID` int(50) NOT NULL,
  `ADET` int(50) NOT NULL,
  `toplam` int(255) NOT NULL,
  PRIMARY KEY (`SİPARİS_ID`),
  KEY `URUN_ID` (`URUN_ID`),
  KEY `MUSTERİ_ID` (`MUSTERİ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `si̇pari̇s`
--

INSERT INTO `si̇pari̇s` (`SİPARİS_ID`, `MUSTERİ_ID`, `SİPARİS_TARİH`, `URUN_ID`, `ADET`, `toplam`) VALUES
(1, 1, '2010-01-20', 4, 1, 125),
(2, 1, '2021-01-04', 2, 2, 120),
(3, 3, '2021-01-06', 2, 1, 50),
(4, 1, '2020-11-11', 3, 1, 90),
(5, 5, '2020-12-16', 1, 1, 60),
(6, 4, '2020-12-21', 4, 2, 250),
(7, 2, '2020-12-22', 3, 2, 250),
(8, 5, '2020-11-11', 1, 1, 60),
(9, 5, '2020-10-14', 4, 2, 250),
(10, 7, '2020-12-09', 3, 2, 150),
(11, 7, '2020-11-19', 3, 1, 90),
(12, 6, '2020-11-26', 1, 1, 150),
(13, 6, '2020-11-18', 2, 1, 100),
(14, 6, '2020-12-20', 3, 2, 150),
(15, 6, '2020-12-14', 1, 1, 120),
(16, 6, '2020-11-17', 1, 1, 100),
(17, 7, '2021-01-12', 3, 1, 90),
(18, 7, '2020-11-10', 3, 1, 90),
(19, 5, '2021-01-10', 2, 1, 100),
(20, 5, '2020-12-09', 4, 1, 125),
(21, 1, '2020-11-18', 1, 2, 150),
(22, 1, '2020-12-20', 2, 3, 200),
(23, 1, '2020-12-14', 2, 4, 200),
(24, 5, '2020-10-08', 3, 3, 250),
(25, 1, '2020-12-23', 2, 3, 200),
(26, 5, '2020-11-19', 3, 2, 250),
(27, 5, '2021-01-12', 4, 2, 200),
(28, 1, '2020-12-22', 1, 5, 250),
(29, 8, '2020-12-14', 3, 2, 200),
(30, 9, '2020-11-18', 3, 3, 200),
(31, 9, '2020-12-16', 2, 2, 200),
(32, 9, '2020-11-19', 3, 2, 200),
(33, 9, '2020-11-17', 2, 2, 150),
(34, 5, '2020-11-12', 2, 2, 150),
(35, 9, '2020-12-16', 3, 3, 250),
(36, 5, '2020-11-17', 2, 4, 300),
(37, 5, '2020-11-25', 4, 2, 200),
(38, 5, '2020-11-24', 4, 4, 200),
(39, 5, '2020-12-29', 4, 3, 125),
(40, 5, '2020-12-28', 1, 4, 200),
(41, 5, '2020-12-23', 3, 2, 150),
(42, 9, '2021-01-21', 4, 2, 150),
(43, 5, '2020-12-16', 4, 2, 100),
(44, 5, '2020-12-07', 4, 2, 100),
(45, 1, '2020-11-23', 3, 2, 150),
(46, 4, '2020-11-27', 1, 3, 175),
(47, 3, '2020-12-15', 1, 2, 200),
(48, 8, '2020-11-30', 2, 2, 150),
(49, 7, '2020-12-28', 3, 3, 250),
(50, 9, '2020-12-21', 1, 5, 400),
(51, 8, '2020-12-21', 1, 3, 300),
(52, 9, '2020-11-24', 3, 2, 200),
(53, 8, '2020-12-29', 2, 2, 150),
(54, 8, '2020-12-13', 2, 2, 200),
(55, 5, '2020-11-25', 1, 2, 250),
(56, 9, '2020-12-20', 4, 2, 150),
(57, 10, '2020-11-16', 1, 2, 200),
(58, 11, '2020-12-15', 3, 3, 250),
(60, 12, '2020-12-29', 1, 2, 200),
(61, 9, '2020-12-06', 4, 2, 200);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sokaklar`
--

DROP TABLE IF EXISTS `sokaklar`;
CREATE TABLE IF NOT EXISTS `sokaklar` (
  `SOKAK_ID` int(250) NOT NULL,
  `SOKAK_AD` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`SOKAK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `sokaklar`
--

INSERT INTO `sokaklar` (`SOKAK_ID`, `SOKAK_AD`) VALUES
(1, 'iyiniyet'),
(2, 'taktaki'),
(3, 'altıpatlar'),
(4, 'otello kamil'),
(5, 'örnek'),
(6, 'cesaretsiz'),
(7, 'konya'),
(8, 'çelenk'),
(9, 'yaşarlı cadde'),
(10, 'KUYU SOKAK'),
(11, 'TAKSİM CADDESİ'),
(12, 'GÜZELKUYU');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sube`
--

DROP TABLE IF EXISTS `sube`;
CREATE TABLE IF NOT EXISTS `sube` (
  `SUBE_ID` int(50) NOT NULL,
  `SUBE_AD` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `İL_ID` int(2) NOT NULL,
  PRIMARY KEY (`SUBE_ID`),
  KEY `İL_ID` (`İL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `sube`
--

INSERT INTO `sube` (`SUBE_ID`, `SUBE_AD`, `İL_ID`) VALUES
(1, 'taksim', 34),
(2, 'meciyeköy', 34),
(3, 'kagıthane sube', 34);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sube_urun`
--

DROP TABLE IF EXISTS `sube_urun`;
CREATE TABLE IF NOT EXISTS `sube_urun` (
  `SUBE_ID` int(50) NOT NULL,
  `URUN_ID` int(50) NOT NULL,
  KEY `SUBE_ID` (`SUBE_ID`),
  KEY `URUN_ID` (`URUN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `sube_urun`
--

INSERT INTO `sube_urun` (`SUBE_ID`, `URUN_ID`) VALUES
(1, 1),
(3, 3),
(2, 2),
(3, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

DROP TABLE IF EXISTS `urunler`;
CREATE TABLE IF NOT EXISTS `urunler` (
  `URUN_ID` int(50) NOT NULL,
  `URUN_AD` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `FİYAT` int(50) NOT NULL,
  `STOK` int(50) NOT NULL,
  `KATEGORİ_ID` int(10) NOT NULL,
  PRIMARY KEY (`URUN_ID`),
  KEY `KATEGORİ_ID` (`KATEGORİ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `urunler`
--

INSERT INTO `urunler` (`URUN_ID`, `URUN_AD`, `FİYAT`, `STOK`, `KATEGORİ_ID`) VALUES
(1, 'SIRT ÇANTA KIRMIZI ', 60, 10, 1),
(2, 'SIRT ÇANTA SİYAH', 60, 10, 1),
(3, 'TOPUKLU SİYAH', 95, 10, 2),
(4, 'DERİ BOT SİYAH', 125, 10, 2);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `i̇lceler`
--
ALTER TABLE `i̇lceler`
  ADD CONSTRAINT `i̇lceler_ibfk_1` FOREIGN KEY (`İL_ID`) REFERENCES `i̇ller` (`İL_ID`);

--
-- Tablo kısıtlamaları `musteri̇ler`
--
ALTER TABLE `musteri̇ler`
  ADD CONSTRAINT `musteri̇ler_ibfk_1` FOREIGN KEY (`APARTMAN_ID`) REFERENCES `apartmanlar` (`APARTMAN_ID`),
  ADD CONSTRAINT `musteri̇ler_ibfk_2` FOREIGN KEY (`MAHALLE_ID`) REFERENCES `mahalleler` (`MAHALLE_ID`),
  ADD CONSTRAINT `musteri̇ler_ibfk_3` FOREIGN KEY (`SOKAK_ID`) REFERENCES `sokaklar` (`SOKAK_ID`),
  ADD CONSTRAINT `musteri̇ler_ibfk_4` FOREIGN KEY (`İL_ID`) REFERENCES `i̇ller` (`İL_ID`),
  ADD CONSTRAINT `musteri̇ler_ibfk_5` FOREIGN KEY (`İLCE_ID`) REFERENCES `i̇lceler` (`İLCE_ID`);

--
-- Tablo kısıtlamaları `si̇pari̇s`
--
ALTER TABLE `si̇pari̇s`
  ADD CONSTRAINT `si̇pari̇s_ibfk_1` FOREIGN KEY (`MUSTERİ_ID`) REFERENCES `musteri̇ler` (`MUSTERİ_ID`),
  ADD CONSTRAINT `si̇pari̇s_ibfk_2` FOREIGN KEY (`URUN_ID`) REFERENCES `urunler` (`URUN_ID`);

--
-- Tablo kısıtlamaları `sube`
--
ALTER TABLE `sube`
  ADD CONSTRAINT `sube_ibfk_1` FOREIGN KEY (`İL_ID`) REFERENCES `i̇ller` (`İL_ID`);

--
-- Tablo kısıtlamaları `sube_urun`
--
ALTER TABLE `sube_urun`
  ADD CONSTRAINT `sube_urun_ibfk_1` FOREIGN KEY (`SUBE_ID`) REFERENCES `sube` (`SUBE_ID`),
  ADD CONSTRAINT `sube_urun_ibfk_2` FOREIGN KEY (`URUN_ID`) REFERENCES `urunler` (`URUN_ID`);

--
-- Tablo kısıtlamaları `urunler`
--
ALTER TABLE `urunler`
  ADD CONSTRAINT `urunler_ibfk_1` FOREIGN KEY (`KATEGORİ_ID`) REFERENCES `kategori̇` (`KATEGORİ_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
