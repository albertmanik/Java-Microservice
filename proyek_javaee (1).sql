-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 19, 2024 at 04:47 PM
-- Server version: 5.7.33
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyek_javaee`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_ruangan`
--

CREATE TABLE `booking_ruangan` (
  `id` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `waktu_booking` datetime NOT NULL,
  `end_booking` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ijin_bermalam`
--

CREATE TABLE `ijin_bermalam` (
  `id` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `waktu_berangkat` varchar(255) NOT NULL,
  `waktu_kembali` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ijin_keluar`
--

CREATE TABLE `ijin_keluar` (
  `id` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `waktu_berangkat` datetime NOT NULL,
  `waktu_kembali` datetime NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ijin_keluar`
--

INSERT INTO `ijin_keluar` (`id`, `id_mahasiswa`, `keperluan`, `waktu_berangkat`, `waktu_kembali`, `status`) VALUES
(6, 19, 'Mengurus ATM', '2024-01-01 13:11:00', '2024-01-01 17:11:00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `total` varchar(255) NOT NULL,
  `akun_pengirim` varchar(255) NOT NULL,
  `jenis_pembayaran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga` varchar(255) DEFAULT NULL,
  `ukuran` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama_produk`, `harga`, `ukuran`) VALUES
(18, 'Kaos Del', '70000', 'XL'),
(20, 'Kaos Del', '60000', 'S'),
(21, 'Topi Del', '170000', 'XXL'),
(22, 'Topi Del', '170000', 'L');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `id` int(11) NOT NULL,
  `nama_ruangan` varchar(225) NOT NULL,
  `status` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id`, `nama_ruangan`, `status`) VALUES
(3, 'GD 512', 'Tersedia'),
(4, 'GD 518', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `id` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat`
--

INSERT INTO `surat` (`id`, `id_mahasiswa`, `keperluan`, `deskripsi`, `status`) VALUES
(12, 19, 'Transkrip Nilai', 'untuk daftar magang', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `noktp` varchar(255) NOT NULL,
  `namalengkap` varchar(255) NOT NULL,
  `nohp` varchar(255) NOT NULL,
  `nim` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `roles`, `noktp`, `namalengkap`, `nohp`, `nim`) VALUES
(1, 'admin', '123', 'admin', '121414', 'ra', '1515', '12130123423123'),
(19, 'Albert', 'Albert', 'mahasiswa', '1234567890', 'Albert Manik', '1234567890', '11321016');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_ruangan`
--
ALTER TABLE `booking_ruangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ruanganbooking` (`id_mahasiswa`),
  ADD KEY `ruangan_booking` (`id_ruangan`);

--
-- Indexes for table `ijin_bermalam`
--
ALTER TABLE `ijin_bermalam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ijin_bermalam` (`id_mahasiswa`);

--
-- Indexes for table `ijin_keluar`
--
ALTER TABLE `ijin_keluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ijin_keluar` (`id_mahasiswa`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_orders` (`id_mahasiswa`),
  ADD KEY `kaos_orders` (`id_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_surat` (`id_mahasiswa`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_ruangan`
--
ALTER TABLE `booking_ruangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ijin_bermalam`
--
ALTER TABLE `ijin_bermalam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ijin_keluar`
--
ALTER TABLE `ijin_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `surat`
--
ALTER TABLE `surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_ruangan`
--
ALTER TABLE `booking_ruangan`
  ADD CONSTRAINT `ruangan_booking` FOREIGN KEY (`id_ruangan`) REFERENCES `ruangan` (`id`),
  ADD CONSTRAINT `user_booking` FOREIGN KEY (`id_mahasiswa`) REFERENCES `user` (`id`);

--
-- Constraints for table `ijin_bermalam`
--
ALTER TABLE `ijin_bermalam`
  ADD CONSTRAINT `ijin_bermalam` FOREIGN KEY (`id_mahasiswa`) REFERENCES `user` (`id`);

--
-- Constraints for table `ijin_keluar`
--
ALTER TABLE `ijin_keluar`
  ADD CONSTRAINT `ijin_keluar` FOREIGN KEY (`id_mahasiswa`) REFERENCES `user` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `kaos_orders` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`),
  ADD CONSTRAINT `user_orders` FOREIGN KEY (`id_mahasiswa`) REFERENCES `user` (`id`);

--
-- Constraints for table `surat`
--
ALTER TABLE `surat`
  ADD CONSTRAINT `user_surat` FOREIGN KEY (`id_mahasiswa`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
