-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Feb 2024 pada 14.47
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pinjamkendaraan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id_Kendaraan` int(11) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `merek` varchar(100) NOT NULL,
  `tipe` varchar(100) NOT NULL,
  `plat_Nomor` varchar(100) NOT NULL,
  `foto` text NOT NULL,
  `status_Kendaraan` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kendaraan`
--

INSERT INTO `kendaraan` (`id_Kendaraan`, `jenis`, `merek`, `tipe`, `plat_Nomor`, `foto`, `status_Kendaraan`) VALUES
(1, 'Motor', 'Honda', 'Vario', 'B 9138 FKC', 'uploaded/Kendaraan/honda-vario.webp', 0),
(2, 'Motor', 'Honda', 'Beat', 'B 9137 FPK', 'uploaded/Kendaraan/honda-beat.png', 0),
(3, 'Motor', 'Yamaha', 'Fazzio', 'B 1379 FCK', 'uploaded/Kendaraan/yamaha-vazzio.png', 0),
(8, 'Mobil', 'Toyota', 'Rush', 'B 1037 QKK', 'uploaded/Kendaraan/toyota-rush.webp', 1),
(9, 'Mobil', 'Toyota', 'Kijang', 'B 1846 AID', 'uploaded/Kendaraan/toyota-kijang.png', 0),
(12, 'Mobil', 'Toyota', 'Supra', 'B 12 AA', 'uploaded/Kendaraan/2020-Toyota-GR-Supra-4-cyl-turbo.webp', 1),
(16, 'Motor', 'Yamaha', 'Nmax', 'B 1937 JKS', 'uploaded/Kendaraan/65a6545a17fd7_202202151255313503V70891.png', 0),
(18, 'Mobil', 'Toyota', 'Fortuner', 'B 1648 KSH', 'uploaded/Kendaraan/65aa2cf180efe_007336100_1642053098-WhatsApp_Image_2022-01-13_at_12.37.21.webp', 1),
(19, 'Motor', 'Yamaha', 'ZX -4RR', 'B 1101 FU', 'uploaded/Kendaraan/65add6787eb4b_ZX4RR-1706521375.webp', 0),
(21, 'Motor', 'Yamaha', 'R15', 'B 8163 FDE', 'uploaded/Kendaraan/65ade30bc4ef2_harga-yamaha-r15-movistar.png', 0),
(22, 'Mobil', 'Toyota', 'Hilux', 'B 1938 FKA', 'uploaded/Kendaraan/65b0743035d80_65add7ff5c1a7_image_2024-01-22_095037663.png', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_Peminjaman` int(11) NOT NULL,
  `id_Profil` int(11) NOT NULL,
  `id_Kendaraan` int(11) NOT NULL,
  `alasan` text NOT NULL,
  `dokumen_Pendukung` text NOT NULL,
  `waktu` int(11) NOT NULL,
  `tanggal_Pengajuan` date NOT NULL,
  `tanggal_Dikonfirmasi` date NOT NULL,
  `status_Peminjaman` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_Peminjaman`, `id_Profil`, `id_Kendaraan`, `alasan`, `dokumen_Pendukung`, `waktu`, `tanggal_Pengajuan`, `tanggal_Dikonfirmasi`, `status_Peminjaman`) VALUES
(27, 3, 3, 'camping', '', 3243, '2024-01-16', '0000-00-00', 2),
(45, 3, 1, 'zdadca', '', 1, '2024-01-18', '2024-01-18', 2),
(49, 13, 2, 'buat maling', 'uploaded/Dokumenpendukung/65a8b0e060889_13_bom_di_jakarta.width-800.format-webp.webp', 5, '2024-01-18', '2024-01-18', 2),
(50, 3, 9, 'yyyyyyyyyyyyy', '', 4, '2024-01-18', '2024-01-18', 2),
(55, 3, 19, 'Takbiran ya balapan!!!!!!!!!!', '', 3, '2024-01-24', '2024-01-25', 2),
(58, 11, 21, 'yhhh', '', 1, '2024-01-25', '2024-01-25', 2),
(59, 3, 16, '', '', 1, '2024-01-25', '2024-02-11', 2),
(60, 3, 22, 'aaaaaaaaa', '', 1, '2024-01-26', '2024-01-26', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil`
--

CREATE TABLE `profil` (
  `id_User` int(11) NOT NULL,
  `nama` varchar(75) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `jenis_Kelamin` varchar(20) NOT NULL,
  `tanggal_Lahir` date NOT NULL,
  `email` varchar(75) NOT NULL,
  `no_Hp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `profil`
--

INSERT INTO `profil` (`id_User`, `nama`, `nik`, `jenis_Kelamin`, `tanggal_Lahir`, `email`, `no_Hp`) VALUES
(1, 'Muhammad Ridho Yudiana', '3216111912050003', 'Laki-laki', '2005-12-19', 'mridhoyudiana@gmail.com', '085280028441'),
(3, 'Wayan Deva Adhistanaya', '3216111912051374', 'Laki-laki', '2005-12-12', 'yans@gmail.com', '088129410312'),
(9, 'Arief Fathul Ulum', '3216111912050731', 'Laki-laki', '2005-12-11', 'ariefatululum@gmail.com', '086184618293'),
(10, 'Fadiel Muhammad', '3216111912059163', 'Laki-laki', '2005-12-01', 'fadielintip@gmail.com', '086153801927'),
(11, 'First Admin', '0000000000000001', 'Laki-laki', '0001-01-01', 'admin@admin.com', '000000000001'),
(13, 'Ahmad Mufarizal hammi', '0211042312010009', 'Laki-laki', '2004-11-02', 'rizal@gmail.com', '089529818284'),
(17, 'Ahmad Mufarizal Hammi ', '22222222', 'Laki-laki', '2004-11-02', 'ahmadmufaridzal@gmail.com', '089529818284'),
(19, 'Ibrahim ', '2312010002', 'Laki-laki', '2004-05-27', 'ibrahimopsantay@gmail.com', '082298724372'),
(22, 'Vanisya', '120987615289012', 'Perempuan', '2024-01-08', 'vanisya@gmail.com', '081278919871');

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat`
--

CREATE TABLE `riwayat` (
  `id_Riwayat` int(11) NOT NULL,
  `id_Profil` int(11) NOT NULL,
  `id_Kendaraan` int(11) NOT NULL,
  `alasan` text NOT NULL,
  `waktu` int(11) NOT NULL,
  `tanggal_Pengajuan` date NOT NULL,
  `tanggal_Dikonfirmasi` date NOT NULL,
  `tanggal_Pengembalian` date NOT NULL,
  `level_Riwayat` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `riwayat`
--

INSERT INTO `riwayat` (`id_Riwayat`, `id_Profil`, `id_Kendaraan`, `alasan`, `waktu`, `tanggal_Pengajuan`, `tanggal_Dikonfirmasi`, `tanggal_Pengembalian`, `level_Riwayat`) VALUES
(32, 3, 21, '', 1, '2024-01-22', '0000-00-00', '0000-00-00', 1),
(33, 3, 21, '', 1, '2024-01-22', '2024-01-23', '2024-01-23', 2),
(34, 22, 19, 'Ke warteg', 5, '2024-01-25', '2024-01-25', '2024-01-25', 2),
(35, 22, 18, 'gabut', 1, '2024-01-25', '0000-00-00', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_User` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_User`, `username`, `password`, `level`) VALUES
(1, 'ridho', '$2y$10$FHK/NbbzNlninzFGMfvtuumVRiW2lAbb32SY4IycjtLQiEIQ/Qth.', 1),
(3, 'wayan', '$2y$10$Ang6AuLSDOQpLbdRf/Rw9e3bRC6q0T1xivqQhgtxHpiqZX0LHtp0O', 1),
(9, 'arief', '$2y$10$.FkUdLXBWY1txyujpyo4deGFrhWV0CEapK.DZEhzmvkogXsBJLSaO', 1),
(10, 'fadhiel', '$2y$10$ttYv/sXNggAUNfUjCVMPR.94o8J7bzRasfqyKAtZUIYCBO1qnQ/oy', 1),
(11, 'admin', '$2y$10$2jd8h8M.ZIaZLsoHKiZX0.ojk9qhFRNIetmKAO6de2xWV9UYfaFIG', 2),
(12, 'rizal', '$2y$10$371yPJ08jUWM1oZi.koOJeGxqnnOwss4qZZtBlQjeC6qCLWa6k26e', 1),
(13, 'tebak', '$2y$10$0g3xQP5.NjQK32Tca6CKFecMN.tf7vzUyy0XduNkl.Ba2pRbqe/y2', 1),
(17, 'farid', '$2y$10$z23n4phYo3HQzCloxQHZM.kRojCDDWtzCyAE1/PblY3sW6AnRz1iu', 1),
(19, 'ibrahim', '$2y$10$eDvyI3ZDZrqOOzs1RFCABusnJ.nvoIgUMdg0Q8isMsHlRAtpLOmq.', 1),
(20, 'testo', '$2y$10$4MAbB9qsFKVkkZqpQLkWFuurpnYZIBi6IXmo7yKiizUQq4hVL6U.i', 1),
(21, 'rayhan', '$2y$10$WVNOmi5L86yXrJ8dxLniQ.uK1vlvWCbFaWgK1d1Bvs6FkmTwSwiSW', 1),
(22, 'vanisya', '$2y$10$lwivRKV8RvfjmoRvZPYZl.iOZRzJjNlOQF3DVgGLtMCSmrTdA3nx2', 1),
(23, 'fadil', '$2y$10$G51xghdmzD0qTQNxUzANEOsoe5HlESbwdIxr/nx5r0l.5DF.tTSEG', 1),
(24, 'kira', '$2y$10$RJUUso3CRmRcpx6v9sjGYuaZAPFYhT7Bf7kSPCpSohrfIFisg3aPO', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id_Kendaraan`),
  ADD UNIQUE KEY `plat_Nomor` (`plat_Nomor`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_Peminjaman`),
  ADD KEY `id_Kendaraan` (`id_Kendaraan`),
  ADD KEY `id_Profil` (`id_Profil`);

--
-- Indeks untuk tabel `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id_User`);

--
-- Indeks untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  ADD PRIMARY KEY (`id_Riwayat`),
  ADD KEY `id_Profil` (`id_Profil`),
  ADD KEY `id_Kendaraan` (`id_Kendaraan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_User`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `id_Kendaraan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_Peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  MODIFY `id_Riwayat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_User` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_Kendaraan`) REFERENCES `kendaraan` (`id_Kendaraan`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_Profil`) REFERENCES `profil` (`id_User`);

--
-- Ketidakleluasaan untuk tabel `profil`
--
ALTER TABLE `profil`
  ADD CONSTRAINT `profil_ibfk_1` FOREIGN KEY (`id_User`) REFERENCES `user` (`id_User`);

--
-- Ketidakleluasaan untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  ADD CONSTRAINT `riwayat_ibfk_1` FOREIGN KEY (`id_Profil`) REFERENCES `profil` (`id_User`),
  ADD CONSTRAINT `riwayat_ibfk_2` FOREIGN KEY (`id_Kendaraan`) REFERENCES `kendaraan` (`id_Kendaraan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
